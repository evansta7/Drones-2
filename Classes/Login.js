var dbData = require('./CRUD.js');
var userName = "";
var password = "";

function loginData(){
  userName = document.getElementById('loginUsername').value;
  password = document.getElementById('loginPassword').value;

  if (userName == "" || password == "") {
    document.getElementById('ErrorMessage').hidden = false;
    document.getElementById('ErrorMessage').innerHTML = "<span style=\"color:red\">Please provide a username and password</span>";
    return false;
  }else{
    window.location.replace("index.html");    
    document.getElementById('ErrorMessage').hidden = true;
  } 
  return false;
}
  dbData.data('*','Users', 'Username =\'liz\'', function(result){
  dataReceived = result;
  console.log(dataReceived);
});