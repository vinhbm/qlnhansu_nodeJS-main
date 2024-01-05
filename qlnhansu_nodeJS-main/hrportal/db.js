const mysql = require('mysql');

// Create a MySQL connection
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'qlnhansu',
});

// Connect to the MySQL database
connection.connect(function (error) {
  if (error) {
    throw error;
  } else {
    console.log('MySQL Database is connected Successfully');
  }
});

// Export the connection for use in other files
module.exports = connection;
