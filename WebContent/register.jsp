<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.javaBean.*"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<title>房地产-注册</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">


<!-- CSS -->
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/style.css">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9] -->
<script src="assets/js/html5.js"></script>
<!--[endif]-->

</head>

<body>

	<div class="header">
		<div class="container">
			<div class="row">
				<div class="logo span4">
					<h1>
						<a href="">注册 </a>
					</h1>
				</div>
				<div class="links span8">
					<a class="home" href="index.jsp" rel="tooltip"
						data-placement="bottom" data-original-title="主页"></a>

				</div>
			</div>
		</div>
	</div>


	<div class="register-container container">
		<div class="row">
			<div class="iphone span5">
				<img src="assets/img/index.png">
			</div>
			<div class="register span6">
				<form action="registerServlet" method="post">

					<h2>
						注册 <span class="red"><strong>新用户</strong></span>
					</h2>
					<label for="username">Username</label> 
					<input type="text" id="username" name="username" placeholder="（必填）请输入用户名..." required="required"> 
					<label for="password">Password</label>
					<input type="password" id="password" name="password" placeholder="（必填）请输入密码..." required="required"> 
					<label for="confirm">Confirm Password</label> 
					<input type="password" id="confirm" name="confirm" placeholder="（必填）请确认密码..." required="required"> 
					<label for="name">Name</label> 
					<input type="text" id="name" name="name" placeholder="（必填）请填写真实姓名..." required="required"> 
					<label for="phone">Phone</label> 
					<input type="text" id="phone" name="phone" pattern="^[1][3578][0-9]{9}$" placeholder="请输入11位电话号码..."> 
					<label for="sex">Sex</label>
					<input type="text" id="sex" name="sex" pattern="^男|女$" placeholder="（必填）请输入你的性别" required="required"> 
					<label for="email">Email</label> 
					<input type="text" id="email" name="email" pattern="^\w+[@]\w+[.]\w+$" placeholder="请输入你的电子邮箱">
					<button type="submit">提交注册</button>
				</form>
			</div>
		</div>
	</div>


	<!-- Javascript -->
	<script src="assets/js/jquery-1.8.2.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"></script>
	<script src="assets/js/scripts.js"></script>
</body>

</html>

