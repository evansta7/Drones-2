

var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'root',
  database : 'dronefarming'
});


//This function selects the specified columns from the table in the database
//A condition can be added if needed, else it can be left blank when calling this function
//The Columns format should be as follow: Column1, Column2 etc
//The tableName is the nme of the table you are quering
//The
function readData(columns,tableName , condition = ""){
  var dataReceived = [];
  if (condition != "") {
   var query = 'SELECT ' + columns + 'FROM ' + tableName + ' WHERE ' + condition;
  }else
  {
   var query = 'SELECT ' + columns + 'FROM ' + tableName;
  }
  connection.connect(function(err) {
    connection.query(query, function (err, result, fields) {
      dataReceived = result;
    });
  });
  console.log(dataReceived);

  return dataReceived;
}
var result = readData('*','Users', 'Username =\'liz\'');