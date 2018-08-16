var mysql = require('mysql');
var twilio = require('twilio');

var con = mysql.createConnection({
    
    host: '192.241.135.75',
    port: 3306,
    user: 'SeniorDesign',
    password: 'SeniorDesign',
    database: 'seniordesign'
});

var client = new twilio('AC7c0522c5168fe9c010a2717d01bd3f90', 'c6a50f12c3f92145a3e30d55707e0448');

con.query("SELECT * FROM track_eyes", function (err, result, fields) {
    if (err) throw err;
    
    for(var i = 0; i < result.length; i++) {
        if(result[i].TOTAL < result[i].HAS_ATTENTION) {
            console.log("error detected!");
            var track_id = result[i].TRACK_ID;
            var hma_fix = "UPDATE track_eyes SET total = ? WHERE total = ?";
            con.query(hma_fix, [result[i].TOTAL, result[i].HAS_ATTENTION], function(err,result) {
                if (err) throw err;
                console.log("updated track_eyes table");
            });
            var hma = "INSERT INTO error_log (error_type, status, description) " + 
                    "VALUES ('More attention than total', 'Corrected', 'Track_eyes record " + 
                    track_id + " had total number of " + result[i].TOTAL + ", attention number of " + 
                    result[i].HAS_ATTENTION + "')"
            con.query(hma, function(err,result) {
                if (err) throw err;
                console.log("HMA inserted record");
            });
        }
        
        else
            continue;
    }
    for(var i = 0; i < result.length-1; i++) {
        if((result[i+1].TIMESTAMP - result[i].TIMESTAMP) > 5000) {
            if((result[i+1].TIMESTAMP - result[i].TIMESTAMP) > (60000)){
                var stoppedin = "INSERT INTO error_log(error_type, status, description) " + 
                            "VALUES ('Stopped Input', 'Action Required', " + 
                            "'There is at least a 1-minute gap between track record " + 
                            result[i].TRACK_ID + " and " + result[i+1].TRACK_ID + ", data input may have stopped')";
                con.query(stoppedin, function(err,result) {
                    if (err) throw err;
                    console.log("TSS inserted record");
                    client.messages.create({
                        to: 'replace this with receiver phone number',
                        from: '+17372002969',
                        body: 'Error Found: Action Required.'
                      });
                });
            }
            else{
                var missingin = "INSERT INTO error_log(error_type, status, description) " + 
                            "VALUES ('Missing Input', 'Ignored', " + 
                            "'Missing records detected between track record " + 
                            result[i].TRACK_ID + " and " + result[i+1].TRACK_ID + ", ignored due to small impact')";
                con.query(missingin, function(err,result) {
                    if (err) throw err;
                    console.log("TSM inserted record");
                });
            }
        }
        else
            continue;    
    }
  });

setTimeout((function() {
    return process.exit(22);
}), 5000);