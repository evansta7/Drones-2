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
//The tableName is the name of the table you are quering
//The function returns the data in raw format, can be exported with the following code:
/* var dbData = require('./CRUD.js');
var dataReceived = [];
dbData.data('*','Users', 'Username =\'liz\'', function(result){
  dataReceived = result;
}); */
module.exports.data = function readData(columns,tableName , condition = "", callback){
  if (condition != "") {
   var query = 'SELECT ' + columns + 'FROM ' + tableName + ' WHERE ' + condition;
  }else
  {
   var query = 'SELECT ' + columns + 'FROM ' + tableName;
  }
  connection.connect(function(err) {
    connection.query(query, function (err, result, fields) {
     return callback(result);
    });
  });
}


//This functions inserts data into the database
//The SQL does not hava a condition
//The columns is all the columns from the table
//  - Columns for user:
//    "`Username`, `Password`, `Email`, `CellphoneNumber`, `Name`, `Surname`"

//  -Columns for farmer:
//      ""`UserID`, `StreetAddress`, `Suburb`, `PostalCode`""

//values must be in the same order as the column names
function insertData(columns,values, tablename){
    var query = 'INSERT INTO ' + tablename + ' (' + columns + ') VALUES(' + values + ')';
    connection.connect(function(err){
    connection.query(query);
  })
}
insertData("`Username`, `Password`, `Email`, `CellphoneNumber`, `Name`, `Surname`",'\'liz\',\'123\',\'asd@com\',\'065455\',\'ELizabeth\', \'van Staden\'', 'users');



