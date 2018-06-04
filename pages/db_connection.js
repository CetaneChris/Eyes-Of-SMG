var mysql = require('mysql');

var con = mysql.createConnection({
        host: "localhost",
        //port: 22,
        user: "SeniorDesign",
        password: "SeniorDesign",
        database: "seniordesign"
});

con.connect(function(err) {
        if(err) throw err;
        else{
        console.log("Connected!");
        con.query("SELECT * FROM theaters", function(err, result) {
                if(err) throw err;
                console.log(result);
                });
        }
});

//process.exit();