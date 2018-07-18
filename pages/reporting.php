<?php include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/header.php');?>
<title>Reporting</title>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header" align="center">Total and Engaged Customers in Theater Number <?php echo $_POST['theater_number']?></h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-10">
            <div class="panel panel-default">
                <div class="panel-body">
                    <iframe src="http://192.241.135.75:3000/d/Y68s4yMmk/primary-display?orgId=1&var-theater_number=<?php echo $_POST['theater_number']?>" style="width: 100%;" height="900"></iframe>
                </div>
            </div>
        </div>
        <div class="col-lg-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="far fa-clock fa-fw"></i> Ad Timestamps
                </div>
                <div class="panel-body">
                    <table id="ads" class="table table-striped table-bordered"><?php
                        $query = "select ad_comp, ad_timestamp from ad_timestamps where theater_num = " . $_POST['theater_number'];
						$result = $mysqli->query($query);

			        	//display column headers
			            echo "<thead>";
				        	echo "<th style='text-align:center' width='40%'>Ad</th>";
				        	echo "<th style='text-align:center' width='60%'>Timestamp</th>";
	       				echo "</thead>";

			            //display the data
			            echo "<tbody>";
			            	while($row = mysqli_fetch_array($result)){
			                  	echo "<tr>";

			                  	//Ad company
			                  	echo "<td align = 'center'>" . $row['ad_comp'] . "</td>";

			                  	//Timestamp
			                  	echo "<td align = 'center'>" . $row['ad_timestamp'] . "</td>";

                                echo "</tr>";
			            	}
						?>
			            </tbody>
					</table>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
            <form name="homepage" method="POST" action="/pages/realtime.php"></form>
	            <div class="panel panel-default">
					<input type='submit' class='btn btn-block btn-outline btn-primary' style='white-space: normal;' id='theater_num' name='theater_num' value='For a real time view into the theater, and occupancy information. Click here.'>
	            </div>
            </form>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-2 -->
    </div>
</div>
<!-- /#page-wrapper -->
<!-- <script type="text/javascript">
    function validateForm(){
    	var D1_ID       = document.getElementById("D1_ID").value;
    	var D2_ID       = document.getElementById("D2_ID").value;
    	var LOC_ID      = document.getElementById("LOC_ID").value;
    	var theater_num = document.getElementById("theater_num").value;
    	    
    	if(D1_ID == "" || D2_ID == "" || LOC_ID == "" || theater_num == ""){
    		document.getElementById('errordiv').style.display = 'block';
    		document.getElementById("errormessage").innerHTML = "All fields are required";

    		return false;
    	}else if(D1_ID == D2_ID){
    		document.getElementById('errordiv').style.display = 'block';
    		document.getElementById("errormessage").innerHTML = "Device IDs match";

    		return false;
    	}
    }
</script> -->
<?php
//Standard call for dependencies
include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/footer.php')?>