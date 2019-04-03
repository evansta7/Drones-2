var dbData = require('./CRUD.js');
var userName = "";
var password = "";

function loginData(){
  userName = document.getElementById('loginUsername').value;
  password = document.getElementById('loginPassword').value;

  if (userName == "" || password == "") {
    document.getElementById('ErrorMessage').innerHTML = "<span style=\"color:red\">Please provide a username and password</span>";


  }else{
    document.getElementById('ErrorMessage').hidden = true;
    window.location.assign("page-register.html");
  } 
}
  dbData.data('*','Users', 'Username =\'liz\'', function(result){
  dataReceived = result;
  console.log(dataReceived);
});