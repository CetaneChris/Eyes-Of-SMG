var mysql = require('mysql');
var popupS = require('popups');

var con = mysql.createConnection({
    
    host: '192.241.135.75',
    port: 3306,
    user: 'SeniorDesign',
    password: 'SeniorDesign',
    database: 'seniordesign'
});


// con.connect(function(err) {
//     if (err) throw err;
//     console.log("Connected!");
// });

con.query("SELECT * FROM track_eyes", function (err, result, fields) {
    if (err) throw err;
    //console.log(result);
    //console.log(`Total = ${result[0].TOTAL}, Attention =  ${result[0].HAS_ATTENTION}`);
    //console.log(result[3].TIMESTAMP - result[2].TIMESTAMP);
    for(var i = 0; i < result.length; i++) {
        //console.log(`Total = ${result[i].TOTAL}, Attention =  ${result[i].HAS_ATTENTION}`);
        if(result[i].TOTAL < result[i].HAS_ATTENTION) {
            //console.log("error detected!");
            var track_id = result[i].TRACK_ID;
            var hma_fix = "UPDATE track_eyes SET total = ? WHERE total = ?";
            con.query(hma_fix, [result[i].TOTAL, result[i].HAS_ATTENTION], function(err,result) {
                if (err) throw err;
                //console.log("updated track_eyes table");
            });
            var hma = "INSERT INTO error_log (error_type, status, description) " + 
                    "VALUES ('More attention than total', 'Corrected', 'Track_eyes record " + 
                    track_id + " had total number of " + result[i].TOTAL + ", attention number of " + 
                    result[i].HAS_ATTENTION + "')"
            con.query(hma, function(err,result) {
                if (err) throw err;
                //console.log("HMA inserted record");
            });
        }
        
        else
            continue;
            //console.log(result[i].TRACK_ID + ": no err detected");
    }
    for(var i = 0; i < result.length-1; i++) {
        if((result[i+1].TIMESTAMP - result[i].TIMESTAMP) > 5000) {
            //console.log((i+1) + ": timestamp err detected");
            if((result[i+1].TIMESTAMP - result[i].TIMESTAMP) > (60000)){
                //no camera input for more than a minute
                var stoppedin = "INSERT INTO error_log(error_type, status, description) " + 
                            "VALUES ('Stopped Input', 'Action Required', " + 
                            "'There is at least a 1-minute gap between track record " + 
                            result[i].TRACK_ID + " and " + result[i+1].TRACK_ID + ", data input may have stopped')";
                con.query(stoppedin, function(err,result) {
                    if (err) throw err;
                    //console.log("TSS inserted record");
                });
            }
            else{
                // no camera input for less than a minute, missing records
                var missingin = "INSERT INTO error_log(error_type, status, description) " + 
                            "VALUES ('Missing Input', 'Ignored', " + 
                            "'Missing records detected between track record " + 
                            result[i].TRACK_ID + " and " + result[i+1].TRACK_ID + ", ignored due to small impact')";
                con.query(missingin, function(err,result) {
                    if (err) throw err;
                    //console.log("TSM inserted record");
                });
            }
        }
        else
            continue;
            //console.log(result[i].TIMESTAMP);
    
    }
  });