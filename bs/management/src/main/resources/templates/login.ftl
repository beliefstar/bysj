<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap Login Form Template</title>

        <!-- CSS -->
        <link rel="stylesheet" href="/login_assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="/login_assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="/login_assets/css/form-elements.css">
        <link rel="stylesheet" href="/login_assets/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <link rel="shortcut icon" href="/login_assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/login_assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/login_assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/login_assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="/login_assets/ico/apple-touch-icon-57-precomposed.png">
    </head>

    <body>

        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong><sup>┏ </sup> 深度 <sub> ┛</sub></strong> 人事管理系统</h1>
                            <div class="description">
                            	<p>
	                            	让人事管理更加<strong>简单</strong>
                            	</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>系统入口</h3>
                            		<p>输入你的邮箱和密码:</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-lock"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="/account/login" method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">Username</label>
			                        	<input type="email" name="email" placeholder="email..." class="form-username form-control" id="form-username">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<input type="password" name="password" placeholder="Password..." class="form-password form-control" id="form-password">
			                        </div>
                                    <div class="form-group">
			                            <button type="submit" class="btn">登 录</button>
                                    </div>
                                    <div class="form-group" id="info" style="display: none">
                                        <div class="alert alert-danger" role="alert"></div>
                                    </div>
			                    </form>
		                    </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="/login_assets/js/jquery-1.11.1.min.js"></script>
        <script src="/login_assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="/login_assets/js/jquery.backstretch.min.js"></script>
        <script src="/login_assets/js/scripts.js"></script>

    </body>

</html>