var express = require('express');
var mysql = require('mysql');

var app = express();

function getMySQLConnection() {
	return mysql.createConnection({
                host: "localhost",
                //port: 22,
                user: "SeniorDesign",
                password: "SeniorDesign",
                database: "seniordesign"
	});
}

app.set('view engine', 'pug');

app.get('/pages/js_reporting.php', function(req,res) {
    var list = [];

    var connection = getMySQLConnection();
    connection.connect();

    connection.query('SELECT * FROM theaters', function(err, rows, fields) {
        if (err) {
            res.status(500).json({"status_code": 500,"status_message": "internal server error"});
        } else {
            // Loop check on each row
            for (var i = 0; i < rows.length; i++) {

                // Create an object to save current row's data
                var theater = {
                    'id':rows[i].ID,
                    'status':rows[i].STATUS,
                    'movie':rows[i].MOVIE,
                    'time':rows[i].REMAINING_TIME
                }
                // Add object into array
                list.push(theater);
        }

        res.render('index', {"list": list});
        }
    });

connection.end();
});

app.listen(8081, function() {
    console.log('listening on port', 8081);
});