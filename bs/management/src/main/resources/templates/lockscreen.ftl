<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>depth | 锁定</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.5 -->
  <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/dist/css/AdminLTE.min.css">

</head>
<body class="hold-transition lockscreen">
<!-- Automatic element centering -->
<div class="lockscreen-wrapper">
  <div class="lockscreen-logo">
    <b>Depth</b>
  </div>
  <!-- User name -->
  <div class="lockscreen-name">${emp.name}</div>

  <!-- START LOCK SCREEN ITEM -->
  <div class="lockscreen-item">
    <!-- lockscreen image -->
    <div class="lockscreen-image">
      <img src="<#if emp.img?? && emp.img != "">${imgServer}${emp.img}<#else >/dist/img/user_img.jpg</#if>" alt="User Image">
    </div>
    <!-- /.lockscreen-image -->

    <!-- lockscreen credentials (contains the form) -->
    <form class="lockscreen-credentials" id="loginForm">
      <div class="input-group">
          <input type="hidden" name="email" value="${emp.email}">
          <input type="password" name="password" class="form-control" placeholder="密码">

        <div class="input-group-btn">
          <button type="submit" class="btn"><i class="fa fa-arrow-right text-muted"></i></button>
        </div>
      </div>
    </form>
    <!-- /.lockscreen credentials -->

  </div>
  <!-- /.lockscreen-item -->
  <div class="help-block text-center">
    输入密码解锁
    <div id="info" style="display: none">
        <div class="alert alert-danger" role="alert"></div>
    </div>
  </div>
  <div class="text-center">
    <a href="/account/login">登录其他帐号</a>
  </div>
  <div class="lockscreen-footer text-center">
    Copyright &copy; 2017-2018 <b><a href="http://almsaeedstudio.com" class="text-black">ZhenXin Studio</a></b><br>
    All rights reserved
  </div>
</div>
<!-- /.center -->

<!-- jQuery 2.1.4 -->
<script src="/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script src="/bootstrap/js/bootstrap.min.js"></script>

<script>
    $(function () {
        $("#loginForm").submit(function () {

            var data = $(this).serialize();
            $.post("/account/login", data, function (rel) {
                if (rel.status === 200) {
                    window.location.href = "/";
                } else {
                    $("#info").find("div").html(rel.message);
                    $("#info").slideDown();
                }
            })

            return false;
        });
    })
</script>
</body>
</html>
