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
                    <iframe src="http://192.241.135.75:3000/d/Y68s4yMmk/primary-display?orgId=1&var-theater_number=<?php echo $_POST['theater_number']?>" style="width: 100%;" height="1050"></iframe>
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
			                  	echo "<td align = 'center'>" . $row['ad_timestamp'] . " AM</td>";

                                echo "</tr>";
			            	}
						?>
			            </tbody>
					</table>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
            <!-- <form name="homepage" method="POST" action="/pages/realtime.php">
	            <div class="panel panel-default">
	            	<input type='hidden' id='theater_num' name='theater_num' value=<?php echo $_POST['theater_number']?>>
					<input type='submit' class='btn btn-block btn-outline-secondary' style='white-space: normal;' value='For a real time view into the theater, and occupancy information. Click here.'></input>
	            </div>
            </form>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-2 -->
    </div>
</div>
<!-- /#page-wrapper -->
<?php
//Standard call for dependencies
include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/footer.php')?>