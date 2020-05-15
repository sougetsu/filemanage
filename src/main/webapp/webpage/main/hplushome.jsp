<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> 文件管理系统</title>
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="plug-in/themes/adminlte/css/home/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plug-in/themes/adminlte/css/home/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="plug-in/themes/adminlte/css/home/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="plug-in/themes/adminlte/css/home/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="plug-in/themes/adminlte/css/home/_all-skins.min.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="plug-in/themes/adminlte/css/home/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="plug-in/themes/adminlte/css/home/jquery-jvectormap.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="plug-in/themes/adminlte/css/home/bootstrap-datepicker.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plug-in/themes/adminlte/css/home/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="plug-in/themes/adminlte/css/home/bootstrap3-wysihtml5.min.css">

  <!-- Google Font -->
  <link rel="stylesheet" href="plug-in/themes/adminlte/css/home/family.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       统计看板
        <small>控制面板</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-3">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>150</h3>

              <p>总文件数</p>
            </div>
            <div class="icon">
              <i class="ion ion-document"></i>
            </div>
            <a href="#" class="small-box-footer">查看详细 <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-3">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>44</h3>

              <p>今日新增文件数</p>
            </div>
            <div class="icon">
              <i class="ion ion-folder"></i>
            </div>
            <a href="#" class="small-box-footer">查看详细<i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-3">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>53<sup style="font-size: 20px">%</sup></h3>

              <p>增长</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="#" class="small-box-footer">月增长文件比率<i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        
        <!-- ./col -->
        <div class="col-lg-3 col-xs-3">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>65</h3>
              <p>原材料库文件数</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="#" class="small-box-footer">查看详细<i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
      </div>
      <!-- /.row -->
      <!-- Main row -->
      <div class="row">
        <!-- Left col -->
        <section class="col-lg-7 connectedSortable">
          <!-- Custom tabs (Charts with tabs)-->
          <div class="nav-tabs-custom">
            <!-- Tabs within a box -->
            <ul class="nav nav-tabs pull-right">
              <li class="active"><a href="#revenue-chart" data-toggle="tab">文件数</a></li>
              <li class="pull-left header"><i class="fa fa-inbox"></i> 每日文件增长</li>
            </ul>
            <div class="tab-content no-padding">
              <!-- Morris chart - Sales -->
              <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 300px;"></div>
              <div class="chart tab-pane" id="sales-chart" style="position: relative; height: 300px;"></div>
            </div>
          </div>
          <!-- /.nav-tabs-custom -->
        </section>
        <!-- /.Left col -->

      </div>
      <!-- /.row (main row) -->

    </section>
    <!-- /.content -->
  

<!-- jQuery 3 -->
<script src="plug-in/jquery/jquery-1.9.1.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plug-in/themes/adminlte/js/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="plug-in/themes/adminlte/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="plug-in/themes/adminlte/js/raphael.min.js"></script>
<script src="plug-in/themes/adminlte/js/morris.min.js"></script>
<!-- Sparkline -->
<script src="plug-in/themes/adminlte/js/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="plug-in/themes/adminlte/js/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plug-in/themes/adminlte/js/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="plug-in/themes/adminlte/js/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="plug-in/themes/adminlte/js/moment.min.js"></script>
<script src="plug-in/themes/adminlte/js/daterangepicker.js"></script>
<!-- datepicker -->
<script src="plug-in/themes/adminlte/js/bootstrap-datepicker.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="plug-in/themes/adminlte/js/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="plug-in/themes/adminlte/js/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plug-in/themes/adminlte/js/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="plug-in/themes/adminlte/js/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="plug-in/themes/adminlte/js/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="plug-in/themes/adminlte/js/demo.js"></script>
</body>
</html>
