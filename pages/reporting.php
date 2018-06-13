<?php include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/header.php');?>
<title>Reporting</title>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header" align="center">Total and Engaged Customers in Theater Number <?php echo $_POST['theater_number']?></h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <iframe src="http://192.241.135.75:3000/d-solo/Y68s4yMmk/primary-display?orgId=1&panelId=2&var-theater_number=<?php echo $_POST['theater_number']?>" style="width: 100%;" height="700"></iframe>
                </div>
            </div>
        </div>
        <!-- /.col-lg-8 -->
    </div>
    <!-- /.row -->
</div>
<!-- /#page-wrapper -->
<?php
//Standard call for dependencies
include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/footer.php')?>
