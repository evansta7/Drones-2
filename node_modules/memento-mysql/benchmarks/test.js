var Memento = require('../index');

var mysqlConfig = {
	host     : 'localhost',
	user     : 'root',
	password : '',
	database : 'benchmark'
};

var memcachedConfig = "127.0.0.1:11211";

var memento = new Memento({mysql: mysqlConfig, memcached: memcachedConfig});

var start = new Date().getTime();

memento.query('SELECT * FROM test WHERE id>10000 LIMIT 5000', function(err, rows, fields) {
	if (err) throw err;

	//console.log(rows);
	var end = new Date().getTime();
	var time = end - start;
		
	console.log('Execution time: ' + (time / 1000) + ' seconds');	
	
	memento.finish();
});

