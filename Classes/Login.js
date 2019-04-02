
var MongoClient = require('mongodb').MongoClient;
var url = 'mongodb://localhost:27017/Drones';
MongoClient.connect(url, function(err, client) {
    console.log('connected');
    var db = client.db('Drones');
    var cursor = db.collection('User').find();
    cursor.each(function(err,data){
        console.log(data);
    })
    client.close();
});

