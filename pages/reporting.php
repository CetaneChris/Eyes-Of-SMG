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
    <?php if($_POST['theater_number'] % 2 != 0){?>
    <div class="row">
        <div class="col-lg-10">
            <div class="panel panel-default">
                <div class="panel-body">
                    <iframe src="http://192.241.135.75:3000/d-solo/Y68s4yMmk/primary-display?orgId=1&panelId=2&var-theater_number=<?php echo $_POST['theater_number']?>" style="width: 100%;" height="700"></iframe>
                </div>
            </div>
        </div>
        <!-- /.col-lg-8 -->
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
        </div>
        <!-- /.col-lg-2 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
        	<iframe src="http://192.241.135.75:3000/d-solo/Y68s4yMmk/primary-display?orgId=1&panelId=8&var-theater_number=<?php echo $_POST['theater_number']?>" style="width: 24.5%;" height="300" frameborder="0"></iframe>
        	<iframe src="http://192.241.135.75:3000/d-solo/Y68s4yMmk/primary-display?orgId=1&panelId=9&var-theater_number=<?php echo $_POST['theater_number']?>" style="width: 24.5%;" height="300" frameborder="0"></iframe>
        	<iframe src="http://192.241.135.75:3000/d-solo/Y68s4yMmk/primary-display?orgId=1&panelId=10&var-theater_number=<?php echo $_POST['theater_number']?>" style="width: 24.5%;" height="250" frameborder="0"></iframe>
        	<iframe src="http://192.241.135.75:3000/d-solo/Y68s4yMmk/primary-display?orgId=1&panelId=11&var-theater_number=<?php echo $_POST['theater_number']?>" style="width: 24.5%;" height="250" frameborder="0"></iframe>
        </div>
    </div>
    <?php }else{?>
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
        </div>
        <!-- /.col-lg-2 -->
    </div>
    <?php }?>
</div>
<!-- /#page-wrapper -->
<?php
//Standard call for dependencies
include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/footer.php')?>