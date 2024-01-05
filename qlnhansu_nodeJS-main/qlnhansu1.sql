-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 19, 2023 lúc 07:30 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlnhansu`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chamcong`
--

CREATE TABLE `chamcong` (
  `MaChamCong` int(11) NOT NULL,
  `MaNhanVien` int(11) DEFAULT NULL,
  `NgayChamCong` date DEFAULT NULL,
  `GioVao` time DEFAULT NULL,
  `GioRa` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chamcong`
--

INSERT INTO `chamcong` (`MaChamCong`, `MaNhanVien`, `NgayChamCong`, `GioVao`, `GioRa`) VALUES
(11, 11, '2023-03-01', '08:00:00', '17:00:00'),
(12, 12, '2023-05-15', '09:00:00', '18:00:00'),
(13, 13, '2023-12-31', '08:30:00', '17:30:00'),
(14, 14, '2023-01-30', '08:00:00', '16:30:00'),
(15, 15, '2023-09-30', '08:30:00', '17:30:00'),
(16, 16, '2023-04-30', '09:30:00', '18:30:00'),
(17, 17, '2023-10-30', '08:00:00', '17:00:00'),
(18, 18, '2023-06-30', '09:00:00', '18:00:00'),
(19, 19, '2023-11-30', '08:30:00', '17:30:00'),
(20, 20, '2023-02-28', '08:00:00', '17:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chucvu`
--

CREATE TABLE `chucvu` (
  `MaChucVu` int(11) NOT NULL,
  `TenChucVu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chucvu`
--

INSERT INTO `chucvu` (`MaChucVu`, `TenChucVu`) VALUES
(2, 'Quản lý'),
(3, 'Nhân Viên'),
(4, 'Chuyên Viên'),
(5, 'Kỹ Sư'),
(6, 'Trưởng Phòng'),
(7, 'Nhân Viên Kinh Doanh'),
(8, 'Nhân Viên Marketing'),
(9, 'Nhân Viên IT'),
(10, 'Nhân Viên Tài Chính'),
(11, 'Giám Đốc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lichsulamviec`
--

CREATE TABLE `lichsulamviec` (
  `MaLichSu` int(11) NOT NULL,
  `MaNhanVien` int(11) DEFAULT NULL,
  `NgayBatDau` date DEFAULT NULL,
  `NgayKetThuc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lichsulamviec`
--

INSERT INTO `lichsulamviec` (`MaLichSu`, `MaNhanVien`, `NgayBatDau`, `NgayKetThuc`) VALUES
(11, 11, '2021-03-01', '2023-03-01'),
(12, 12, '2018-07-01', '2023-05-15'),
(13, 13, '2020-01-15', '2022-12-31'),
(14, 14, '2017-09-01', '2023-01-30'),
(15, 15, '2019-07-01', '2023-09-30'),
(16, 16, '2018-05-01', '2023-04-30'),
(17, 17, '2022-01-01', '2022-12-31'),
(18, 18, '2016-11-01', '2023-06-30'),
(19, 19, '2021-02-15', '2022-11-30'),
(20, 20, '2017-06-01', '2022-02-28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `luong`
--

CREATE TABLE `luong` (
  `MaLuong` int(11) NOT NULL,
  `MaNhanVien` int(11) DEFAULT NULL,
  `SoTien` decimal(10,2) DEFAULT NULL,
  `NgayHieuLuc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `luong`
--

INSERT INTO `luong` (`MaLuong`, `MaNhanVien`, `SoTien`, `NgayHieuLuc`) VALUES
(11, 11, 15000000.00, '2021-03-01'),
(12, 12, 20000000.00, '2018-07-01'),
(13, 13, 18000000.00, '2020-01-15'),
(14, 14, 25000000.00, '2017-09-01'),
(15, 15, 22000000.00, '2019-07-01'),
(16, 16, 19000000.00, '2018-05-01'),
(17, 17, 30000000.00, '2022-01-01'),
(18, 18, 50000000.00, '2016-11-01'),
(19, 19, 23000000.00, '2021-02-15'),
(20, 20, 28000000.00, '2017-06-01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nghi`
--

CREATE TABLE `nghi` (
  `MaNghi` int(11) NOT NULL,
  `MaNhanVien` int(11) DEFAULT NULL,
  `LoaiNghi` varchar(20) DEFAULT NULL,
  `NgayBatDau` date DEFAULT NULL,
  `NgayKetThuc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nghi`
--

INSERT INTO `nghi` (`MaNghi`, `MaNhanVien`, `LoaiNghi`, `NgayBatDau`, `NgayKetThuc`) VALUES
(11, 11, 'Có phép', '2022-01-01', '2023-01-07'),
(12, 12, 'Có phép', '2021-08-15', '2023-08-21'),
(13, 13, 'Không phép', '2020-06-15', '2023-06-21'),
(14, 14, 'Có phép', '2022-06-01', '2023-06-07'),
(15, 15, 'Không phép', '2021-11-15', '2023-11-21'),
(16, 16, 'Có phép', '2022-03-01', '2023-03-07'),
(17, 17, 'Không phép', '2022-08-01', '2023-08-07'),
(18, 18, 'Có phép', '2022-04-15', '2023-04-21'),
(19, 19, 'Không phép', '2021-12-01', '2023-12-07'),
(20, 20, 'Có phép', '2022-05-15', '2023-05-21'),
(21, 12, '', '2021-11-15', '2023-11-21'),
(22, 12, 'Không phép', '2021-11-15', '2023-11-21'),
(24, 13, 'Không phép', '2021-11-15', '2023-11-21'),
(25, 14, 'Không phép', '2021-11-15', '2023-11-21'),
(26, 14, 'Không phép', '2021-11-15', '2023-11-21'),
(27, 14, 'Không phép', '2021-11-15', '2023-11-21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`UserID`, `UserName`, `Password`, `Role`) VALUES
(2, 'user1', 'userpassword1', 1),
(3, 'admin', 'adminpassword1', 0),
(4, 'user2', 'userpassword2', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MaNhanVien` int(11) NOT NULL,
  `HoTenDem` varchar(50) DEFAULT NULL,
  `Ten` varchar(50) DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `GioiTinh` varchar(10) DEFAULT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `SoDienThoai` varchar(20) DEFAULT NULL,
  `MaPhongBan` int(11) DEFAULT NULL,
  `MaChucVu` int(11) DEFAULT NULL,
  `Image` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`MaNhanVien`, `HoTenDem`, `Ten`, `NgaySinh`, `GioiTinh`, `DiaChi`, `Email`, `SoDienThoai`, `MaPhongBan`, `MaChucVu`, `Image`) VALUES
(11, 'Trần Thị', 'P', '1994-08-10', 'Nữ', 'Đà Nẵng', 'tranthip@example.com', '123456789', 3, 5, NULL),
(12, 'Lê Văn', 'Q', '1985-05-20', 'Nam', 'Hồ Chí Minh', 'levanq@example.com', '987654321', 7, 8, NULL),
(13, 'Nguyễn Văn', 'R', '1990-12-15', 'Nam', 'Hà Nội', 'nguyenvanr@example.com', '456789123', 5, 6, NULL),
(14, 'Hoàng Thị', 'S', '1988-03-25', 'Nữ', 'Quảng Bình', 'hoangthis@example.com', '321654987', 6, 7, NULL),
(15, 'Phan Văn', 'T', '1996-02-18', 'Nam', 'Hải Phòng', 'phanvant@example.com', '456123789', 8, 10, NULL),
(16, 'Đỗ Thị', 'U', '1993-07-05', 'Nữ', 'Bắc Giang', 'dothiu@example.com', '789456123', 4, 3, NULL),
(17, 'Lê Văn', 'V', '1987-09-10', 'Nam', 'Thái Bình', 'levanv@example.com', '147258369', 9, 11, NULL),
(18, 'Nguyễn Thị', 'X', '1991-11-28', 'Nữ', 'Ninh Bình', 'nguyenthix@example.com', '369852147', 10, 2, NULL),
(19, 'Trần Văn', 'Y', '1989-06-03', 'Nam', 'Bình Dương', 'tranvany@example.com', '258369147', 2, 3, NULL),
(20, 'Phạm Thị', 'Z', '1995-04-15', 'Nữ', 'Sóc Trăng', 'phamthiz@example.com', '963852741', 3, 4, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phongban`
--

CREATE TABLE `phongban` (
  `MaPhongBan` int(11) NOT NULL,
  `TenPhongBan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phongban`
--

INSERT INTO `phongban` (`MaPhongBan`, `TenPhongBan`) VALUES
(2, 'Phòng Kế Toán'),
(3, 'Phòng Kinh Doanh'),
(4, 'Phòng Nhân Sự'),
(5, 'Phòng Kỹ Thuật'),
(6, 'Phòng Marketing'),
(7, 'Phòng Hành Chính'),
(8, 'Phòng Quản lý Dự Án'),
(9, 'Phòng Nghiên Cứu và Phát Triển'),
(10, 'Phòng IT'),
(11, 'Phòng Tài Chính');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chamcong`
--
ALTER TABLE `chamcong`
  ADD PRIMARY KEY (`MaChamCong`),
  ADD KEY `FK_ChamCong_NhanVien` (`MaNhanVien`);

--
-- Chỉ mục cho bảng `chucvu`
--
ALTER TABLE `chucvu`
  ADD PRIMARY KEY (`MaChucVu`);

--
-- Chỉ mục cho bảng `lichsulamviec`
--
ALTER TABLE `lichsulamviec`
  ADD PRIMARY KEY (`MaLichSu`),
  ADD KEY `FK_LichSuLamViec_NhanVien` (`MaNhanVien`);

--
-- Chỉ mục cho bảng `luong`
--
ALTER TABLE `luong`
  ADD PRIMARY KEY (`MaLuong`),
  ADD KEY `FK_Luong_NhanVien` (`MaNhanVien`);

--
-- Chỉ mục cho bảng `nghi`
--
ALTER TABLE `nghi`
  ADD PRIMARY KEY (`MaNghi`),
  ADD KEY `FK_Nghi_NhanVien` (`MaNhanVien`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`UserID`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MaNhanVien`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `FK_NhanVien_PhongBan` (`MaPhongBan`),
  ADD KEY `FK_NhanVien_ChucVu` (`MaChucVu`);

--
-- Chỉ mục cho bảng `phongban`
--
ALTER TABLE `phongban`
  ADD PRIMARY KEY (`MaPhongBan`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chamcong`
--
ALTER TABLE `chamcong`
  ADD CONSTRAINT `FK_ChamCong_NhanVien` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`);

--
-- Các ràng buộc cho bảng `lichsulamviec`
--
ALTER TABLE `lichsulamviec`
  ADD CONSTRAINT `FK_LichSuLamViec_NhanVien` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`);

--
-- Các ràng buộc cho bảng `luong`
--
ALTER TABLE `luong`
  ADD CONSTRAINT `FK_Luong_NhanVien` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`);

--
-- Các ràng buộc cho bảng `nghi`
--
ALTER TABLE `nghi`
  ADD CONSTRAINT `FK_Nghi_NhanVien` FOREIGN KEY (`MaNhanVien`) REFERENCES `nhanvien` (`MaNhanVien`);

--
-- Các ràng buộc cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `FK_NhanVien_ChucVu` FOREIGN KEY (`MaChucVu`) REFERENCES `chucvu` (`MaChucVu`),
  ADD CONSTRAINT `FK_NhanVien_PhongBan` FOREIGN KEY (`MaPhongBan`) REFERENCES `phongban` (`MaPhongBan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
