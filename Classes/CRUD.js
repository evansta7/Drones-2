
var MongoClient = require('mongodb').MongoClient;
var url = 'mongodb://localhost:27017/Drones';

function searchItem(collectionName, columnName, value){
    MongoClient.connect(url,function(err,client){
        var db = client.db('Drones');
        db.collection(collectionName).find({[columnName]: value}).toArray(function(err,result){
            console.log(result);
        });
        client.close();
    });
}

searchItem('User', 'username', 'liz');