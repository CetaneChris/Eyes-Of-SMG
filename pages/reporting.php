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
    <?php if($_POST['theater_number'] == 1){?>
    <?php if("" == trim($_POST['starting'])){?>
    <div class="col-lg-10">
		<h3 align="center">Most Recent Three Hours</h3>
	</div>
    <?php }?>
    <div class="row">
        <div class="col-lg-10">
            <div class="panel panel-default">
                <div class="panel-body">
                    <iframe src="http://192.241.135.75:3000/d-solo/Y68s4yMmk/primary-display?orgId=1&panelId=2&var-theater_number=<?php echo $_POST['theater_number']?>" style="width: 100%;" height="700"></iframe>
                </div>
            </div>
        </div>
        <!-- /.col-lg-10 -->
        <div class="col-lg-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="far fa-clock fa-fw"></i> Ad Timestamps
                </div>
                <div class="panel-body">
                    <table id="theaters" class="table table-striped table-bordered"><?php
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
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="far fa-clock fa-fw"></i> Custom Times
                </div>
                <form name="newtimes" method="POST"  action="/pages/reporting.php" onsubmit="return validateForm();">
						<table class="table table-striped">
							<tr>
								<td>Starting</td>
								<td>
									<div class='input-group date' id='starting' name='starting'>
					                    <input type='text' class="form-control" />
						                    <span class="input-group-addon">
					                        <span class="glyphicon glyphicon-calendar"></span>
					                    </span>
					                </div>
								</td>
							</tr>
							<tr>
								<td>Ending</td>
								<td>
									<div class='input-group date' id='ending' name='ending'>
					                    <input type='text' class="form-control" />
						                    <span class="input-group-addon">
					                        <span class="glyphicon glyphicon-calendar"></span>
					                    </span>
					                </div>
								</td>
							</tr>
							<tr>
								<td><input type="hidden" id="theater_number" name="theater_number" value="<?php echo $_POST['theater_number']?>"></td>
								<td><input class="btn btn-primary" type="reset" value="Reset"><input class="btn btn-primary pull-right" type="submit" value="Submit"></td>
							</tr>
						</table>
					</form>
                <!-- /.panel-body -->
                <script type="text/javascript">
					$(function () {
						$('#datetimepicker1').datetimepicker();
					});
                </script>
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-2 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
        	<iframe src="http://192.241.135.75:3000/d-solo/Y68s4yMmk/primary-display?orgId=1&panelId=8&var-theater_number=<?php echo $_POST['theater_number']?>" style="width: 24.5%;" height="250" frameborder="0"></iframe>
        	<iframe src="http://192.241.135.75:3000/d-solo/Y68s4yMmk/primary-display?orgId=1&panelId=9&var-theater_number=<?php echo $_POST['theater_number']?>" style="width: 24.5%;" height="250" frameborder="0"></iframe>
        	<iframe src="http://192.241.135.75:3000/d-solo/Y68s4yMmk/primary-display?orgId=1&panelId=10&var-theater_number=<?php echo $_POST['theater_number']?>" style="width: 24.5%;" height="250" frameborder="0"></iframe>
        	<iframe src="http://192.241.135.75:3000/d-solo/Y68s4yMmk/primary-display?orgId=1&panelId=11&var-theater_number=<?php echo $_POST['theater_number']?>" style="width: 24.5%;" height="250" frameborder="0"></iframe>
        </div>
    </div>
    <?php }elseif($_POST['theater_number'] == 2){?>
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
        </div>
        <!-- /.col-lg-2 -->
    </div>
    <?php }else{?>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <iframe src="http://192.241.135.75:3000/d/Y68s4yMmk/primary-display?orgId=1&var-theater_number=<?php echo $_POST['theater_number']?>" style="width: 100%;" height="900"></iframe>
                </div>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="far fa-clock fa-fw"></i> Ad Timestamps
                </div>
                <div class="panel-body">
                    <table id="ads2" class="table table-striped table-bordered"><?php
                        $query = "select ad_comp, ad_timestamp from ad_timestamps where theater_num = " . $_POST['theater_number'];
						$result = $mysqli->query($query);

						echo "<tr>";
						echo "<td align = 'center'>Ad</td>";
						while($row = mysqli_fetch_array($result)){
						    //Ad company
						    echo "<td align = 'center'>" . $row['ad_comp'] . "</td>";
						}
						echo "</tr>";

						/*echo "<tr>";
						echo "<td align = 'center'>Timestamp</td>";
						while($row = mysqli_fetch_array($result)){
						    //Timestamp
						    echo "<td align = 'center'>" . $row['ad_timestamp'] . "</td>";
						}
						echo "</tr>";*/
						?>
					</table>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <?php }?>
</div>
<!-- /#page-wrapper -->
<script type="text/javascript">
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
</script>
<?php
//Standard call for dependencies
include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/footer.php')?>