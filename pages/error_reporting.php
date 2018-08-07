<?php include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/header.php');
if(ISSET($_POST['log_id'])){
    $mysqli->query('UPDATE `error_log` SET `STATUS` = \'Corrected\' WHERE `error_log`.`LOG_ID` = ' . $_POST['log_id']);
    unset($_POST['log_id']);
}?>
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
                <div class="alert alert-danger" role = "alert" id="errordiv" style="display:none">
					<p id="errormessage"></p>
				</div>
                <div class="panel-heading">
                    <i class="fas fa-exclamation-circle fa-fw"></i> Errors
                </div>
                <div class="panel-body">
                	<form name="errors" method="POST" action="/pages/error_reporting.php" onsubmit="return validateForm();">
                        <table id="errors" class="table table-striped table-bordered"><?php
    						$query = "select log_id, error_type, description, time_found, status from error_log order by log_id asc";
    			        	$result = $mysqli->query($query);
    			            
    			        	//display column headers
                            echo "<thead>";
                                echo "<th style='text-align:center' width=\"4%\">Update</th>";
    				        	echo "<th style='text-align:center' width=\"" . 100/(mysqli_num_fields($result)+3) . "%\">Error Type"?>
    				        		<select>
										<option value="none">No Selection</option>
										<option value="missing">Missing Input</option>
										<option value="stopped">Stopped Input</option>
									</select> <?php "</th>";
                                echo "<th style='text-align:center' width=\"" . 4*(100/(mysqli_num_fields($result)+3)) . "%\">Description</th>";
                                echo "<th style='text-align:center' width=\"" . 100/(mysqli_num_fields($result)+3) . "%\">Time Found</th>";
                                echo "<th style='text-align:center' width=\"" . 100/(mysqli_num_fields($result)+3) . "%\">Status</th>";
                            echo "</thead>";
    			
    			            //display the data
    			            echo "<tbody>";
    			            	while($row = mysqli_fetch_array($result)){
    			                  	echo "<tr>";
    			                  	
    			                  	//Radio Button
                                    if($row['status'] == 'Action Required')
                                        echo "<td align='center'><input type='radio' id='log_id' name='log_id' value='" . $row['log_id'] . "'></td>";
    			                  	else
    			                  	    echo "<td align='center'></td>";
    			                  	
    			                  	//Error Type
    			                  	echo "<td align='center'>" . $row['error_type'] . "</td>";
    			                  	
    			                  	//Description
    			                  	echo "<td align='center'>" . $row['description'] . "</td>";
    			                  	
    			                  	//Time Found
    						    	echo "<td align='center'>" . $row['time_found'] . "</td>";
    						    	
    						    	//Status
    		                  		echo "<td align='center'>" . $row['status'] . "</td>";
    
    		                  		echo "</tr>";
    			                  }?>
    			            </tbody>
    					</table>
    					<input class="btn btn-primary pull-right" type="submit" value="Correct">
					</form>
                </div>
            </div>
			<div class="panel-body">
				<table id="filters" class="table table-bordered">
					<th>Error Type:</th>
					<th><select style='width:100%;'>
						<option value="none">No Selection</option>
						<option value="missing">Missing Input</option>
						<option value="stopped">Stopped Input</option>
					</select></th>
					
					<th>After Date:</th>
					<th>PLACEHOLDER</th>
					
					<th>Before Date:</th>
					<th>PLACEHOLDER</th>
					
					<th>Status:</th>
					<th><select style='width:100%;'>
						<option value="none">No Selection</option>
						<option value="action">Action Required</option>
						<option value="ignore">Ignored</option>
						<option value="correct">Corrected</option>
					</select></th>
				</table>
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

    function validateForm(){
    	var log_id = document.getElementById("log_id");
    	    
    	if(!log_id.checked){
    		document.getElementById('errordiv').style.display = 'block';
    		document.getElementById("errormessage").innerHTML = "No Error Selected";

    		return false;
    	}
    }
</script>
<?php
//Standard call for dependencies
include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/footer.php');
?>