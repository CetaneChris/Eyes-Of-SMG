<!-- 
	Will create the form for adding a device
 -->
<?php include_once ($_SERVER ['DOCUMENT_ROOT'] . '/pages/header.php'); ?>
<title>Insert Device</title>

<body>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">New Device</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-10">
				<div class="alert alert-danger" role = "alert" id="errordiv" style="display:none">
					<p id="errormessage"></p>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-shopping-cart fa-fw"></i> All fields are required
					</div>
					<form name="newcustomer" method= "POST"  action="/pages/insertCustomer.php" onsubmit="return validateForm();">
						<table class="table table-striped">
							<tr>
								<td>Device ID</td>
								<td>
									<div class="form-group">
										<input type="number" class="form-control" id="D_ID" name="D_ID"  min="1" step="1">
									</div>
								</td>
							</tr>
							<tr>
								<td>Room Number</td>
								<td>
									<div class="form-group">
										<input type="number" class="form-control" id="room_num" name="room_num"  min="1" step="1">
									</div>
								</td>
							</tr>
							<tr>
								<td>Location ID</td>
								<td>
									<div class="form-group">
										<input type="number" class="form-control" id="theater_num" name="theater_num"  min="1" step="1">
									</div>
								</td>
							</tr>
							<tr>
								<td><input class="btn btn-primary pull-right" type="reset" value="Reset"></td>
								<td><input class="btn btn-primary" type="submit" value="Submit"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
        </div>
        <!-- /.col-lg-8 -->
    </div>
    <!-- /.row -->
    <!-- /#page-wrapper -->
</body>
<script type="text/javascript">
    function validateForm(){
    	var D_ID        = document.getElementById("D_ID").value;
    	var room_num    = document.getElementById("room_num").value;
    	var theater_num = document.getElementById("theater_num").value;
    	    
    	if(D_ID == "" || room_num == "" || theater_num == ""){
    		document.getElementById('errordiv').style.display = 'block';
    		document.getElementById("errormessage").innerHTML = "All fields are required";

    		return false;
    	}
    }
</script>
<!-- The following script gets the response for device dropdown using dg_id from the group selection -->
<?php
// Standard call for dependencies
include_once ($_SERVER ['DOCUMENT_ROOT'] . '/pages/footer.php');
?>