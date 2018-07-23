<?php include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/header.php'); ?>
<title>Real Time View</title>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header" align='center'>Real Time View in Theater Number <?php echo $_POST['theater_num']?></h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fas fa-video fa-fw"></i> Live Feed
				</div>
				<div class="panel-body">
					<iframe src="https://giphy.com/embed/EOpZ7XsVfTN2E" style="width: 100%" height="242" frameBorder="0"></iframe>
				</div>
			</div>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fas fa-eye fa-fw"></i> Occupancy Data
                </div>
                <div class="panel-body">
                    <!--<iframe src="http://192.241.135.75:3000/d-solo/tnFgywdmz/real-time-data?orgId=1&panelId=2&var-theater_number=<?php //echo $_POST['theater_num']?>" height="450" style="width: 100%;" frameborder="0"></iframe>-->
                    <img src="/images/image.png" alt="Status Dot" height="450" style="width: 100%;">
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-4 -->
    </div>
    <!-- /.row -->
    <form name="homepage" method="POST" action="/pages/reporting.php">
		<input type='hidden' id='theater_num' name='theater_number' value=<?php echo $_POST['theater_num']?>>
		<input type='submit' class='btn btn-outline-secondary pull-left' value='Return to theater <?php echo $_POST['theater_num']?> report.'>
	</form>
</div>
<!-- /#page-wrapper -->
<?php
//Standard call for dependencies
include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/footer.php');
?>