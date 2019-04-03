var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'root',
  database : 'Drones'
});

connection.connect(function(err) {
  connection.query('SELECT * FROM Drones.Users', function (err, result, fields) {
    console.log(result);
  });
  
});
