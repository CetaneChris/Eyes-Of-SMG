<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Eyes-of-SMG Senior Design Project">
	<meta name="author" content="NightOps">

	<link href="/vendor/nightops/nightops.css" rel="stylesheet">
	<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="/vendor/datatables/css/dataTables.min.css" rel="stylesheet">
	<link href="/vendor/datatables/css/dataTables.bootstrap.css" rel="stylesheet">
	<link href="/vendor/jquery/jquery.dataTables.min.css" rel="stylesheet">
	<link href="/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="/vendor/blackrock-digital/css/sb-admin-2.css?=v8" rel="stylesheet">
	<link href="/vendor/morrisjs/morris.css" rel="stylesheet">
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<?php
date_default_timezone_set('America/Chicago');
include_once ($_SERVER['DOCUMENT_ROOT'].'/connections/db_connect8.php');
include_once ($_SERVER['DOCUMENT_ROOT'].'/class/all_classes.php');?>
</head>
<body>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0" id='navbar'>
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right"></ul>
            <!-- /.navbar-top-links -->
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="/index.php"><i class="fa fa-building fa-fw"></i> Home</a>
                        </li><li>
                            <a href="/pages/newDevice.php"><i class="fas fa-video fa-fw"></i> New Device</a>
                        </li><li>
                            <a href="/pages/reporting.php"><i class="fas fa-chart-line fa-fw"></i> Reporting</a>
                        </li><li>
                            <a href="/pages/js_reporting.php"><i class="fas fa-chart-line fa-fw"></i> NodeJS</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>