const express = require("express");
const app = express();
const database = require("./db"); // Giả sử bạn có một tệp riêng cho kết nối cơ sở dữ liệu
const path = require("path");
const moment = require("moment");
const session = require("express-session");
const NodeCache = require("node-cache");
const multer = require("multer");

const cache = new NodeCache({ stdTTL: 15 });

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "public/uploads/");
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + path.extname(file.originalname));
  },
});

const upload = multer({ storage: storage });

app.set("view engine", "ejs");
app.use(express.static("public"));

const port = 3000;

const bodyParser = require("body-parser");
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use(
  session({
    resave: false,
    saveUninitialized: false,
    secret: "somesecret",
    cookie: { maxAge: 600000 },
  })
);

function authChecker(req, res, next) {
  const auth = req.session.isLogin;
  if (auth) {
    if (auth.Auth || req.path === "/login") {
      next();
    } else {
      res.redirect("/login");
    }
  } else {
    res.redirect("/login");
  }
}

app.get("/login", (req, res) => {
  res.render("login", { title: "Đăng nhập", error: "" });
});

app.post("/login", (req, res) => {
  const userName = req.body.userName;
  const password = req.body.password;

  const query = "SELECT UserName, Password, UserID FROM nguoidung WHERE UserName = ?";

  database.query(query, [userName], (err, results) => {
    if (err) {
      console.error("Lỗi truy vấn cơ sở dữ liệu:", err);
      res.render("login", {
        title: "Đăng nhập",
        error: "Đăng nhập không thành công",
      });
    } else if (results.length > 0) {
      const user = results[0];
      if (password === user.Password) {
        const infoLogin = {
          Auth: true,
          userId: user.UserID,
          userName: user.UserName,
          // Bạn có thể bao gồm thông tin người dùng khác nếu cần
        };
        req.session.isLogin = infoLogin;
        res.redirect("/admin");
      } else {
        res.render("login", {
          title: "Đăng nhập",
          error: "Đăng nhập thất bại, tên đăng nhập và mật khẩu không đúng",
        });
      }
    } else {
      res.render("login", {
        title: "Đăng nhập",
        error: "Đăng nhập thất bại, tên đăng nhập và mật khẩu không đúng",
      });
    }
  });
});

//logout
app.get("/logout", (req, res) => {
  // Xóa phiên và chuyển hướng đến trang đăng nhập
  req.session.destroy((err) => {
    if (err) {
      console.error("Lỗi hủy phiên:", err);
    }
    res.redirect("/login");
  });
});


app.get("/admin", authChecker, (req, res) => {
  res.render("admin", { title: "Quản trị" });
});
//show nvien
app.get("/nhanvien", authChecker, (req, res) => {
  const query = "SELECT * FROM nhanvien";
  // Thực hiện câu truy vấn
  database.query(query, (err, results) => {
    if (err) {
      console.error("Lỗi truy vấn cơ sở dữ liệu:", err);
      // Xử lý lỗi (ví dụ: hiển thị trang lỗi)
      res.render("error", { error: "Lỗi khi truy xuất dữ liệu nhân viên" });
    } else {
      // Hiển thị trang nhanvien.ejs với dữ liệu đã truy xuất
      res.render("nhanvien", { nhanviens: results, title: "Quản lý Nhân viên" });
    }
  });
});
// Hiển thị trang thêm nhân viên
app.get('/nhanvien/them', authChecker, upload.any(), (req, res) => {
  res.render('themnhanvien', { title: 'Add Employee' });
});


// add nhan vien moi
app.post("/nhanvien/them", authChecker, upload.any(), (req, res) => {

  let strQueryInsert =
    "INSERT INTO NhanVien (MaNhanVien, HoTenDem, Ten, NgaySinh, GioiTinh, DiaChi, Email, SoDienThoai, MaPhongBan, MaChucVu, Image) values(";
  strQueryInsert += "'" + req.body.maNhanVien + "',";
  strQueryInsert += "'" + req.body.hoTen + "',";
  strQueryInsert += "'" + req.body.Ten + "',";
  strQueryInsert += "'" + req.body.ngaySinh + "',";
  strQueryInsert += "'" + req.body.gioiTinh + "',";
  strQueryInsert += "'" + req.body.diaChi + "',";
  strQueryInsert += "'" + req.body.email + "',";
  strQueryInsert += "'" + req.body.soDienThoai + "',";
  strQueryInsert += "'" + req.body.maPhongBan + "',";
  strQueryInsert += "'" + req.body.maChucVu + "',";
  strQueryInsert += "'" + req.body.Image + "'";
  strQueryInsert += ")";
  // res.send(strQueryInsert)
  database.query(strQueryInsert, function (error, data) {
    if (data) {
      res.redirect("/nhanvien");
    } else {
      res.redirect("/admin");
    }
  });
});

// Xoa nhan vien 
app.get("/nhanvien/xoa", (req, res) => {
  let manv = req.query.id;
  if (manv) {
    let strQuery = "Delete FROM nhanvien WHERE MaNhanVien='" + manv + "'";
    let strQueryChamCong = "Delete FROM chamcong WHERE MaNhanVien = '" + manv + "'";
    let strQueryLichSuLamViec = "Delete FROM lichsulamviec WHERE MaNhanVien = '" + manv + "'";
    let strQueryLuong = "Delete FROM luong WHERE MaNhanVien = '" + manv + "'";
    let strQueryNghi = "Delete FROM nghi WHERE MaNhanVien = '" + manv + "'";

    database.query(strQueryChamCong, function (err, data) {


    });

    database.query(strQueryLichSuLamViec, function (err, data) {


    });

    database.query(strQueryLuong, function (err, data) {


    });

    database.query(strQueryNghi, function (err, data) {


    });

    database.query(strQuery, function (error, data) {
      if (data) {
        res.redirect("/nhanvien");
      } else {
        res.redirect("/admin");
      }
    });
  }
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

//--------------------------------- Restful API ----------------------------

// API: nguoidung

app.get("/nguoidung", async (req, res) => {
  try {
    const query = `SELECT * from nguoidung;`
    // Thực hiện câu truy vấn
    database.query(query, (err, results) => {
      if (err) {
        res.status(400).json({
          message: err,
        });
      } else {
        res.status(200).json({
          status: 1,
          message: "Lấy dữ liệu thành công.",
          data: results
        });
      }
    });

  } catch (err) {
    res.status(500).json({
      message: err,
    });
  }
});

app.get("/nguoidung/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const query = `SELECT * FROM nguoidung WHERE UserID = ${id}`

    // Thực hiện câu truy vấn
    database.query(query, (err, results) => {
      if (err) {
        res.status(400).json({
          status: 0,
          message: "Ko tìm thấy",
          data: ""
        });
      } else {
        res.status(200).json({
          status: 1,
          message: "Lấy dữ liệu thành công.",
          data: results
        });
      }
    });

  } catch (err) {
    res.status(500).json({
      message: err,
    });
  }
});

// Đăng kí nghỉ -- chưa xong
app.post("/nghi", async (req, res) => {
  try {
    const { maNghi, maNhanVien, loaiNghi, ngayBatDau, ngayKetThuc } = req.body;
    const query = `INSERT INTO nghi (MaNghi, MaNhanVien, LoaiNghi, NgayBatDau, NgayKetThuc) 
                        values ('${maNghi}', '${maNhanVien}', '${loaiNghi}', '${ngayBatDau}', '${ngayKetThuc}')`;

    database.query(query, (error, results) => {
      if (error) {
        res.status(400).json({
          status: 0,
          message: "Đăng kí nghỉ thất bại",
          data: ""
        });
      } else {
        res.status(200).json({
          status: 1,
          message: "Đăng kí nghỉ thành công.",
          data: results,
        });
      }
    });

  } catch (err) {
    res.status(500).json({
      message: err,
    });
  }
});


// API: Lương

app.get("/luong", async (req, res) => {
  try {
    const query = `SELECT * from luong;`
    // Thực hiện câu truy vấn
    database.query(query, (err, results) => {
      if (err) {
        res.status(400).json({
          message: err,
        });
      } else {
        res.status(200).json({
          status: 1,
          message: "Lấy dữ liệu thành công.",
          data: results
        });
      }
    });

  } catch (err) {
    res.status(500).json({
      message: err,
    });
  }
});

app.get("/luong/:id", async (req, res) => {
  try {
    const query = "SELECT * FROM `luong` WHERE MaLuong = 12;"
    // Thực hiện câu truy vấn
    database.query(query, (err, results) => {
      if (err) {
        res.status(400).json({
          message: err,
        });
      } else {
        res.status(200).json({
          status: 1,
          message: "Lấy dữ liệu thành công.",
          data: results
        });
      }
    });

  } catch (err) {
    res.status(500).json({
      message: err,
    });
  }
});


// API: Chấm công

app.get("/chamcong", async (req, res) => {
  try {
    const query = `SELECT * from chamcong;`
    // Thực hiện câu truy vấn
    database.query(query, (err, results) => {
      if (err) {
        res.status(400).json({
          message: err,
        });
      } else {
        res.status(200).json({
          status: 1,
          message: "Lấy dữ liệu thành công.",
          data: results
        });
      }
    });

  } catch (err) {
    res.status(500).json({
      message: err,
    });
  }
});

app.get("/chamcong/:id", async (req, res) => {
  try {
    const query = "SELECT * FROM chamcong WHERE MaChamCong = ?"
    // Thực hiện câu truy vấn
    database.query(query, (err, results) => {
      if (err) {
        res.status(400).json({
          message: "Lấy dữ liệu thất bại.",
        });
      } else {
        res.status(200).json({
          status: 1,
          message: "Lấy dữ liệu thành công.",
          data: results
        });
      }
    });

  } catch (err) {
    res.status(500).json({
      message: err,
    });
  }
});

// API: Nhân viên

app.get("/nhanviens", async (req, res) => {
  try {
    const query = `SELECT * from nhanvien;`
    // Thực hiện câu truy vấn
    database.query(query, (err, results) => {
      if (err) {
        res.status(400).json({
          message: err,
        });
      } else {
        res.status(200).json({
          status: 1,
          message: "Lấy dữ liệu thành công.",
          data: results
        });
      }
    });

  } catch (err) {
    res.status(500).json({
      message: err,
    });
  }
});

app.get("/nhanviens/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const query = `SELECT * FROM nhanvien WHERE MaNhanVien = ${id}`

    // Thực hiện câu truy vấn
    database.query(query, (err, results) => {
      if (err) {
        res.status(400).json({
          message: err,
        });
      } else {
        res.status(200).json({
          status: 1,
          message: "Lấy dữ liệu thành công.",
          data: results
        });
      }
    });

  } catch (err) {
    res.status(500).json({
      message: err,
    });
  }
});