<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Depth | 人事管理系统</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.5 -->
  <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">

  <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css">

  <link rel="stylesheet" href="/css/main.css">

    <link rel="stylesheet" href="/plugins/pace/pace.min.css">

</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">

    <a href="/index" class="logo">
      <span class="logo-mini"><b>D</b>EP</span>Depth
      <span class="logo-lg"><b>Depth</b></span>
    </a>

    <nav class="navbar navbar-static-top" role="navigation">
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">

          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="<#if emp.img?? && emp.img != "">${imgServer}${emp.img}<#else >dist/img/user_img.jpg</#if>" class="user-image" alt="User Image">
              <span class="hidden-xs">${emp.name!}</span>
            </a>
            <ul class="dropdown-menu">
              <li class="user-header">
                <img src="<#if emp.img?? && emp.img != "">${imgServer}${emp.img}<#else >dist/img/user_img.jpg</#if>" class="img-circle" alt="User Image">

                <p>
                  ${emp.name!} - ${emp.post!}
                  <small><#if emp.joinTime??>${emp.joinTime?string("yyyy-MM-dd")}</#if></small>
                </p>
              </li>

              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="javascript:void(0)" onclick="showLab('/account/profile')" class="btn btn-default btn-flat">修改密码</a>
                </div>
                <div class="pull-right">
                  <a href="/account/logout" class="btn btn-default btn-flat">退出</a>
                </div>
                  <div class="text-center">
                      <a href="javascript:void(0)" onclick="showLab('/emp/edit?id=${emp.id}')" class="btn btn-default btn-flat">个人资料</a>
                  </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <aside class="main-sidebar">

    <section class="sidebar">

      <div class="user-panel">
        <div class="pull-left image">
          <img src="<#if emp.img?? && emp.img != "">${imgServer}${emp.img}<#else >dist/img/user_img.jpg</#if>" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${emp.name!}</p>
          <a href="/account/lockscreen"><i class="fa fa-circle text-success"></i> 在线</a>
        </div>
      </div>


      <ul class="sidebar-menu">
        <li class="header">菜单 - MENU</li>
        <#list moduleList as item>
          <li <#if item.list?size gt 0>class="treeview"</#if>>
              <a href="javascript:void(0);" onclick="showLab('${item.url!}', '${item.name}')">
                  <i class="fa fa-th"></i>
                  <span>${item.name}</span>
                  <#if item.list?size gt 0>
                  <i class="fa fa-angle-left pull-right"></i>
                      <ul class="treeview-menu">
                          <#list item.list as v>
                              <li>
                                  <a href="javascript:void(0);" onclick="showLab('${v.url}', '${item.name}', '${v.name}')">
                                      <i class="fa fa-circle-o"></i>
                                      ${v.name}
                                  </a>
                              </li>
                          </#list>
                      </ul>
                  </#if>
              </a>
          </li>
        </#list>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
      <section class="content-header">
          <h1 id="content-header">
              <small>Optional description</small>
          </h1>
          <ol class="breadcrumb">
              <#--<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>-->
              <#--<li class="active">Here</li>-->
          </ol>
      </section>

    <!-- Main content -->
      <section class="content" id="container-view">

          <!-- Your Page Content Here -->
          <img src="/css/index_bg.png" style="width: 85%; margin-left: 20px;">
      </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
      Anything you want
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2015 <a href="#">Company</a>.</strong> All rights reserved.
  </footer>

</div>

<div class="modal fade modal-primary" id="message-box" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="showdata-box">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Default Modal</h4>
            </div>
            <div class="modal-body">
                <p>One fine body&hellip;</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="modal fade" id="form-box">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form class="form-horizontal">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title">Default Modal</h4>
              </div>
              <div class="modal-body">
                  <p>One fine body&hellip;</p>
              </div>
              <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                  <button type="submit" class="btn btn-primary">确定</button>
              </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="/plugins/pace/pace.min.js"></script>
<script src="dist/js/app.min.js"></script>
<script src="/js/index.js"></script>
<script>
    $(document).ajaxStart(function() { Pace.restart(); });
</script>
</body>
</html>
