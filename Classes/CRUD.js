var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'root',
  database : 'dronefarming'
});

connection.connect(function(err) {
  connection.query('SELECT * FROM dronefarming.users', function (err, result, fields) {
    console.log(result);
  });
});
