<!-- 
	Home page
 -->
<?php include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/header.php');
$times = array();?>
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
                	<form name="homepage" method="POST" action="/pages/reporting.php">
                        <table id="theaters" class="table table-striped table-bordered"><?php
    						$query = "SELECT t.ID, s.message, t.movie, t.remaining_time FROM theaters t inner join `status` s on t.status=s.id order by t.id asc";
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
    			                  	echo "<td align = 'center'><input type='submit' class='btn btn-lg btn-block active' aria-pressed='true' id='theater_number' name='theater_number'  value='" . $row['ID'] . "'></td>";

    			                  	//Status
    			                  	echo "<td align = 'center'><p style='font-size:26px'>" . $row['message'] . "</td>";

    			                  	//Movie
    			                  	echo "<td align = 'center'><p style='font-size:26px'><b><i>" . $row['movie'] . "</b></i></td>";

    			                  	//Remaining Time
    			                  	echo "<td align = 'center'><div id='th" . $row['ID'] . "'><p style='font-size:26px'>" . $row['remaining_time'] . "</div></td>";

    			                  	echo "</tr>";

    			                  	//Start countdown timer
    			                  	$str_time = preg_replace("/^([\d]{1})\:([\d]{2})\:([\d]{2})$/", "$1:$2:$3", $row["remaining_time"]);
    			                  	sscanf($str_time, "%d:%d:%d", $hours, $minutes, $seconds);
    			                  	$time_seconds = $hours * 3600 + $minutes * 60 + $seconds;
    			                  	array_push($times, array($row["ID"], $time_seconds));
    			            	}
    						?>
    			            </tbody>
    					</table>
					</form>
                </div>
            </div>
        </div>
        <!-- /.col-lg-8 -->
    <!-- /.row -->
</div>
<!-- /#page-wrapper -->
<?php
//Standard call for dependencies
include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/footer.php');?>
<script>
    window.onload = function () {
        <?php foreach ($times as $da) { ?>
                var time = <?php echo $da[1];?>;
                var display = document.getElementById('th<?php echo $da[0];?>');
                startTimer(time, display);
        <?php } ?>
    };
</script>
<!-- <script type="text/javascript" charset="utf-8">
	window.onload = function() {
	   	$('#theaters').DataTable({
	   		"columnDefs": [
				{"sType": "num-html", targets: 0},
				{"type": "num-html", targets: 0}
			]
	   	});
    };
</script>