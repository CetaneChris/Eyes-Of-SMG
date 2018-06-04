<!-- 
	Will insert new devices to the database
 -->
<?php include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/header.php'); ?>
<title>Food Service Vendor New Device</title>

<?php
	if ($mysqli->connect_errno) {
		echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
		exit ();
	}
	$stmt = $mysqli->prepare("INSERT INTO `devices` VALUES (?, ?, ?)");
	$stmt->bind_param("sss", $D_ID, $LOC_ID, $theater_num);
	
	$D_ID        = $_POST['D1_ID'];
	$LOC_ID      = $_POST['LOC_ID'];
	$theater_num = $_POST['theater_num'];

	if($stmt->execute()){
    	$D_ID        = $_POST['D2_ID'];
    	$LOC_ID      = $_POST['LOC_ID'];
    	$theater_num = $_POST['theater_num'];
    	$stmt->execute();

    	if($stmt->execute())
		    $fieldReport = "Theater number " . $theater_num . " has been submitted!";
	    else
	        $fieldReport = "Error: Device 2 not submitted";
	}else
		$fieldReport = "Error: Device 1 not submitted";
	header("refresh:10; url=/pages/newDevice.php");

?>


<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"><?php echo $fieldReport; ?></h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
        	<p>This page will be redirected in 10 seconds</p>
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