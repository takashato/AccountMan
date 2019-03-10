{# layouts/main-layouts.volt #}
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>{% block title %}{% endblock %} - AccountMan</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="node_modules/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="node_modules/ionicons/dist/css/ionicons.min.css">
    {% block css %}{% endblock %}
    <link rel="stylesheet" href="css/AdminLTE.min.css">
    <link rel="stylesheet" href="css/skins/skin-blue.min.css">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <!-- Main Header -->
    <header class="main-header">

        <!-- Logo -->
        <a href="index2.html" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>Acc</b>M</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>Account</b>Man</span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar Menu -->
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">MENU</li>
                <li class="treeview">
                    <a href="#"><i class="fa fa-user"></i> <span>Accounts</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="./"><i class="fa fa-list"></i> Manage</a></li>
                        <li><a href="./#modal-add"><i class="fa fa-user-plus"></i> Create new account</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#"><i class="fa fa-list"></i> <span>Departments</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="./department"><i class="fa fa-list"></i> Manage</a></li>
                    </ul>
                </li>
            </ul>
            <!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                {% block content_header %}{% endblock %}
            </h1>
            <ol class="breadcrumb">
                {% block breadcrumb %}{% endblock %}
            </ol>
        </section>

        <!-- Main content -->
        <section class="content container-fluid">
            {% block content %}{% endblock %}
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
            Account Management
        </div>
        <!-- Default to the left -->
        <strong>Copyright &copy; 2019.</strong> All rights reserved.
    </footer>
    <!-- Add the sidebar's background. This div must be placed
    immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3 -->
<script src="node_modules/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="js/adminlte.min.js"></script>
{% block js %}{% endblock %}
</body>
</html>