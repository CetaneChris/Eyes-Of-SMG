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
                    <table id="theaters" class="table table-striped table-bordered"><?php
						$query = "SELECT t.ID, s.message FROM theaters t left outer join `status` s on t.status=s.id order by t.id asc";
						$result = $mysqli->query($query);

			        	//display column headers
			            echo "<thead>";
				        	echo "<th style='text-align:center' width=\"" . 100/6 . "%\">Theater Number</th>";
				        	echo "<th style='text-align:center' width=\"" . 100/6 . "%\">Status</th>";
	       					echo "<th style='text-align:center' width=\"" . 3*(100/6) . "%\">Movie</th>";
	           				echo "<th style='text-align:center' width=\"" . 100/6 . "%\">Remaining Time</th></tr>";
			            echo "</thead>";

			            //display the data
			            echo "<tbody>";
			            	while($row = mysqli_fetch_array($result)){
			                  	echo "<tr>";

			                  	//Theater ID
			                  	//theaters::printDot($row['ID']);
			                  	echo "<td align = 'center'><a href = '/pages/reporting.php?theater_number=".$row['ID']."'>" . $row['ID'] . "</a></td>";

			                  	//Status
			                  	echo "<td align = 'center'>" . $row['message'] . "</td>";
			                  	
			                  	//Movie
			                  	echo "<td align='center'>placeholder</td>";

			                  	//Remaining Time
			                  	echo "<td align='center'>placeholder</td>";
				                  	
			                  	echo "</tr>";
			            	}
						?>   
			            </tbody>
					</table>
                </div>
            </div>
        </div>
        <!-- /.col-lg-8 ->
        <div class="col-lg-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                <!-- Defining table on the right, will have a key between dot color and meaning ->
                    <i class="fas fa-ticket-alt fa-fw"></i> Key
                </div>
                <div class="panel-body">
					<table id="history" class="table table-striped table-bordered"><?php /*
						$query = "select * from status";
						$result = $mysqli->query($query);
				
				        //display column headers
				        echo "<thead>";
					      	echo "<th style='text-align:center' width=\"" . 100/mysqli_num_fields($result) . "%\">Symbol</th>";
	            			echo "<th style='text-align:center' width=\"" . 100/mysqli_num_fields($result) . "%\">Displayed on Screen</th></tr>";
				        echo "</thead>";

				        //display the data
				        echo "<tbody>";
				          	while($row = mysqli_fetch_array($result)){
				               	echo "<tr>";

				               	//Symbol
				               	$color = "white";
				               	$symbol = "circle";
				               	if($row['ID'] == 1)
				               		$color = "black";
			               		elseif($row['ID'] == 2){
			               			$symbol = "check";
			               			$color = "green";
			               		}elseif($row['ID'] == 3){
			               			$color = "red";
			               			$symbol = "times";
			               		}
				               	echo "<td align='center'><i class='fas fa-".$symbol." fa-fw' style='color:".$color."'></i></td>";

        			          	//Message
				               	echo "<td align='center'>" . $row['MESSAGE'] . "</td>";
							}*/?>   
			            </tbody>
					</table>
                </div>
                <!-- /.panel-body ->
            </div>
            <!-- /.panel ->
        </div>
        <!-- /.col-lg-4 -->
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