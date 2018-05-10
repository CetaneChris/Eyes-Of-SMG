<!-- 
	Home page
 -->
<?php include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/header.php'); ?>
<title>Eyes of SMG Home</title>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Home</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-8">
            <div class="panel panel-default">
            <!-- Defines left table, filled with theater number, status, and current movie -->
                <div class="panel-heading">
                    <i class="fa fa-users fa-fw"></i> Occupancy
                </div>
                <div class="panel-body">
                    <table id="theaters" class="table table-striped table-bordered"><?php
						$query = "select * from theaters";
						$result = $mysqli->query($query);

			        	//display column headers
			            echo "<thead>";
				        	echo "<th style='text-align:center' width=\"" . 100/(mysqli_num_fields($result)+1) . "%\">Theater</th>";
	       					echo "<th style='text-align:center' width=\"" . 100/(mysqli_num_fields($result)+1) . "%\">Movie</th>";
	           				echo "<th style='text-align:center' width=\"" . 100/(mysqli_num_fields($result)+1) . "%\">Remaining Time</th></tr>";
			            echo "</thead>";

			            //display the data
			            echo "<tbody>";
			            	while($row = mysqli_fetch_array($result)){
			                  	echo "<tr>";

			                  	//Theater ID
			                  	theaters::printDot($row['ID']);

			                  	//Cost
			                  	echo "<td align='center'>placeholder</td>";

			                  	//Image
			                  	echo "<td align='center'>placeholder</td>";
				                  	
			                  	echo "</tr>";
			            	}
						?>   
			            </tbody>
					</table>
                </div>
            </div>
        </div>
        <!-- /.col-lg-8 -->
        <div class="col-lg-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                <!-- Defining table on the right, will have a key between dot color and meaning -->
                    <i class="fas fa-ticket-alt fa-fw"></i> Key
                </div>
                <div class="panel-body">
					<table id="history" class="table table-striped table-bordered"><?php
						$query = "select * from status";
						$result = $mysqli->query($query);
				
				        //display column headers
				        echo "<thead>";
					      	echo "<th style='text-align:center' width=\"" . 100/mysqli_num_fields($result) . "%\">Number</th>";
	            			echo "<th style='text-align:center' width=\"" . 100/mysqli_num_fields($result) . "%\">Messae</th></tr>";
				        echo "</thead>";

				        //display the data
				        echo "<tbody>";
				          	while($row = mysqli_fetch_array($result)){
				               	echo "<tr>";

				               	//Device Name
				               	echo "<td align='center'>" . $row['ID'] . "</td>";

        			          	//By
				               	echo "<td align='center'>" . $row['MESSAGE'] . "</td>";
							}?>   
			            </tbody>
					</table>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-4 -->
    </div>
    <!-- /.row -->
</div>
<script type="text/javascript" charset="utf-8">
	window.onload = function() {
	   	$('#theaters').DataTable();
    };
</script>
<!-- /#page-wrapper -->
<?php
//Standard call for dependencies
include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/footer.php');
?>