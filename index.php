<!-- 
	Home page
 -->
<?php include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/header.php'); ?>
<title>Eyes of SMG Home</title>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
        	<h1 class="page-header" align="center"><strong>Eyes of Studio Movie Grill</strong></h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
            <!-- Defines left table, filled with theater number, status, and current movie -->
                <div class="panel-heading">
                    <i class="fa fa-users fa-fw"></i> Occupancy
                </div>
                <div class="panel-body">
                	<form name="homepage" method="POST"  action="/pages/reporting.php">
                        <table id="theaters" class="table table-striped table-bordered"><?php
    						$query = "SELECT t.ID, s.message FROM theaters t inner join `status` s on t.status=s.id order by t.id asc";
    						$result = $mysqli->query($query);
    
    			        	//display column headers
    			            echo "<thead>";
    				        	echo "<th style='text-align:center' width=\"" . 100/6 . "%\">Theater Number</th>";
    				        	echo "<th style='text-align:center' width=\"" . 100/6 . "%\">Status</th>";
    	       					echo "<th style='text-align:center' width=\"" . 3*(100/6) . "%\">Movie</th>";
    	           				echo "<th style='text-align:center' width=\"" . 100/6 . "%\">Remaining Time</th>";
    			            echo "</thead>";
    
    			            //display the data
    			            echo "<tbody>";
    			            	while($row = mysqli_fetch_array($result)){
    			                  	echo "<tr>";
    
    			                  	//Theater ID
    			                  	//theaters::printDot($row['ID']);
    			                  	echo "<td align = 'center'><input type='submit' class='btn btn-block' id='theater_number' name='theater_number'  value='" . $row['ID'] . "'></td>";
    
    			                  	//Status
    			                  	echo "<td align = 'center'>" . $row['message'] . "</td>";
    			                  	
    			                  	//Movie
    			                  	echo "<td align='center'>placeholder" . $row['ID'] . "</td>";
    
    			                  	//Remaining Time
    			                  	echo "<td align='center'>placeholder" . $row['ID'] . "</td>";
    				                  	
    			                  	echo "</tr>";
    			            	}
    						?>   
    			            </tbody>
    					</table>
					</form>
                </div>
            </div>
        </div>
        <!-- /.col-lg-8 ->
    </div>
    <!-- /.row -->
</div>
<script type="text/javascript" charset="utf-8">
	window.onload = function() {
	   	$('#theaters').DataTable({
	   		"columnDefs": [
				{"sType": "num-html", targets: 0},
				{"type": "num-html", targets: 0}
			]
	   	});
    };
</script>
<!-- /#page-wrapper -->
<?php
//Standard call for dependencies
include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/footer.php');
?>