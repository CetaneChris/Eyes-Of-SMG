<?php include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/header.php');?>
<title>Errors Found</title>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header" align="center"><strong>Errors Found</strong></h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fas fa-exclamation-circle fa-fw"></i> Errors
                </div>
                <div class="panel-body">
                    <table id="errors" class="table table-striped table-bordered"><?php
						$query = "select log_id, error_type, description, time_found, status from error_log order by log_id asc";
			        	$result = $mysqli->query($query);
			            
			        	//display column headers
			            echo "<thead>";
				        	echo "<th style='text-align:center' width=\"" . 100/(mysqli_num_fields($result)+3) . "%\">Error Type</th>";
				            echo "<th style='text-align:center' width=\"" . 4*(100/(mysqli_num_fields($result)+3)) . "%\">Description</th>";
				        	echo "<th style='text-align:center' width=\"" . 100/(mysqli_num_fields($result)+3) . "%\">Time Found</th>";
				        	echo "<th style='text-align:center' width=\"" . 100/(mysqli_num_fields($result)+3) . "%\">Status</th>";
			            echo "</thead>";
			
			            //display the data
			            echo "<tbody>";
			            	while($row = mysqli_fetch_array($result)){
			                  	echo "<tr>";
			                  	
			                  	//Error Type
			                  	echo "<td align='center' style='padding: 15px'>" . $row['error_type'] . "</td>";
			                  	
			                  	//Description
			                  	echo "<td align='center' style='padding: 15px'>" . $row['description'] . "</td>";
			                  	
			                  	//Time Found
						    	echo "<td align='center' style='padding: 15px'>" . $row['time_found'] . "</td>";
						    	
						    	//Status
		                  		echo "<td align='center' style='padding: 15px'>" . $row['status'] . "</td>";

		                  		echo "</tr>";
			                  }
			                  ?>   
			            </tbody>
					</table>
                </div>
            </div>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>
<!-- /#page-wrapper -->
<script type="text/javascript" charset="utf-8">
	window.onload = function() {
		$('#errors').dataTable();
    };
</script>
<?php
//Standard call for dependencies
include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/footer.php');
?>