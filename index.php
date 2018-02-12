<!-- 
	Christopher Raymond & Laramie DeBaun	
	Databases 2017 fall
	Homepage
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
                <div class="panel-heading">
                    <i class="fa fa-users fa-fw"></i> Occupancy
                </div>
                <div class="panel-body">
                    <table id="products" class="table table-striped table-bordered"><?php
							$query = "SELECT * FROM DEVICES";
        
							$result = $mysqli->query($query);
				
				        	//display column headers
				            echo "<thead>";
					        	echo "<th style='text-align:center' width=\"" . 100/mysqli_num_fields($result) . "%\">Theater</th>";
	        					echo "<th style='text-align:center' width=\"" . 100/mysqli_num_fields($result) . "%\">Movie</th>";
	            				echo "<th style='text-align:center' width=\"" . 100/mysqli_num_fields($result) . "%\">Remaining Time</th></tr>";
				            echo "</thead>";

				            //display the data
				            echo "<tbody>";
				            	while($row = mysqli_fetch_array($result)){
				                  	echo "<tr>";
				                  	
				                  	//Theater ID
				                  	echo "<td align='center'>" . $row['description'] . "</td>";

				                  	//Cost
				                  	echo "<td align='center'>$" . $row['cost'] . "</td>";

				                  	//Image
				                  	echo "<td align='center'><img src=\"/images/" . $row['product_image'] . "\" alt=\"" . $row['description'] . "\" style=\"width:50px;height:50px\"></td>";
				                  	
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
                    <i class="fas fa-ticket-alt fa-fw"></i> Theaters
                </div>
                <div class="panel-body">
					<table id="history" class="table table-striped table-bordered"><?php
						$query = "SELECT * FROM DEVICES";
        
						$result = $mysqli->query($query);
				
				        //display column headers
				        echo "<thead>";
					      	echo "<th style='text-align:center' width=\"" . 100/(mysqli_num_fields($result)+2) . "%\">Number</th>";
	            			echo "<th style='text-align:center' width=\"" . 100/(mysqli_num_fields($result)+2) . "%\">Status</th></tr>";
				        echo "</thead>";

				        //display the data
				        /*echo "<tbody>";
				          	while($row = mysqli_fetch_array($result)){
				               	echo "<tr>";

				               	//Device Name
				               	echo "<td align='center'>" . $row['name'] . "</td>";

        			          	//By
				               	echo "<td align='center'>" . $row['idnumber'] . "</td>";
							}*/
			                  ?>   
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
<!-- /#page-wrapper -->
<?php
//Standard call for dependencies
include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/footer.php');
?>