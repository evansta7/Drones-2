var hello = require('./CRUD.js');
var dataReceived = [];
function receiveName(){
var userName = document.getElementById('loginEmail').value;
var password = document.getElementById('loginPassword').value;
alert(userName)
}
hello.data('*','Users', 'Username =\'liz\'', function(result){
  dataReceived = result;
  console.log(dataReceived);
});