<?php include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/header.php');?>
<title>Reporting</title>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header" align="center">Total and Engaged Customers in Theater Number <?php echo $_GET['theater_number']?></h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <iframe src="http://192.241.135.75:3000/d-solo/Y68s4yMmk/testing?panelId=2&orgId=1&tab=metrics&var-theater_number=<?php echo $_GET['theater_number']?>" style="width: 100%;" height="500" frameborder="3"></iframe>
                </div>
            </div>
        </div>
        <!-- /.col-lg-8 -->
        <?php /*<div class="col-lg-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-calculator fa-fw"></i> Col 4
                </div>
                <div class="panel-body">
                    
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>*/?>
        <!-- /.col-lg-4 -->
    </div>
    <!-- /.row -->
</div>
<!-- /#page-wrapper -->
<?php
//Standard call for dependencies
include_once ($_SERVER['DOCUMENT_ROOT'].'/pages/footer.php')?>

<!-- 
select 
    t.timestamp,
    sum(t.has_attention),
    sum(t.total) from track_eyes t
	inner join devices d on d.D_ID = t.D_ID
	where d.THEATER_NUM = 1
    group by t.TIMESTAMP
 -->