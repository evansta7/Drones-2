var dbData = require('./CRUD.js');
var userName = "";
var password = "";

module.exports.login = function loginData(){
  userName = document.getElementById('loginUsername').value;
  password = document.getElementById('loginPassword').value;
  if (userName == "" || password == "") {
    document.getElementById('ErrorMessage').hidden = false;
    document.getElementById('ErrorMessage').innerHTML = "<span style=\"color:red\">Please provide a username and password</span>";
    return false;
  }else{
    validation(userName, password,function(result){
      if (result) {
        window.location.replace("index.html");    
        document.getElementById('ErrorMessage').hidden = true;
      }else {
        document.getElementById('ErrorMessage').hidden = false;
        document.getElementById('ErrorMessage').innerHTML = "<span style=\"color:red\">Incorrect username or password</span>";   
      } 
      
    });   
    return false;
  } 
}

function validation(userName, password,callback){
  var condition = 'Username =\''+ userName +'\' AND Password =\''+ password + '\'';
  dbData.data('*','Users', condition , function(result){
    if(!result.length){
      alert("IT DOES NOT WORK")
    return callback(false);
    }else
    {
      alert("IT WORKS")
      return callback(true);
    }
  
  });
  return callback(false)
}
