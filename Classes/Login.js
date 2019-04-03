var hello = require('./CRUD.js');
var dataReceived = [];
hello.data('*','Users', 'Username =\'liz\'', function(result){
  dataReceived = result;
  console.log(dataReceived);
});