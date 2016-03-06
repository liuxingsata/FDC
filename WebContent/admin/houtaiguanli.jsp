<!DOCTYPE html>
<html lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>房地产管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link href="../assets/bootstrap/css/bootstrap-responsive.css"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="../assets/bootstrap/css/bootstrap.css">

<script src="../assets/bootstrap/js/jquery-2.1.4.min.js"></script>
<script src="../assets/bootstrap/js/bootstrap.js"></script>

<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}
</style>
<link href="../assets/bootstrap/css/bootstrap-responsive.css"
	rel="stylesheet">
</head>

<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<button type="button" class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="brand" href="../index.jsp">房地产管理系统</a>
				<div class="nav-collapse collapse">
					<p class="navbar-text pull-right"></p>
					<ul class="nav">
						<li><a href="houtaiguanli.jsp">后台管理</a></li>
						<li class="dropdown" id="menutest"><a href="#menutest"
							class="dropdown-toggle" data-toggle="dropdown">管理员<%=session.getAttribute("uname")%>您好！<b
								class="caret"></b></a>
							<ul class="dropdown-menu pull-right">

								<li><a href="../index.jsp">回到主页</a></li>
								<li><a href="../tuichu.jsp">退出登录</a></li>
							</ul></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2">
				<div class="well sidebar-nav">
					<ul class="nav nav-list">
						<li class="nav-header">信息管理</li>
						<li><a href="userm.jsp">用户信息编辑</a></li>
						<li><a href="housem.jsp">房产信息编辑</a></li>
						<li><a href="bbsm.jsp">留言信息编辑</a></li>
						<li><a href="userrequest.jsp">用戶請求處理</a></li>
					</ul>
				</div>
				<!--/.well -->
			</div>
			<!--/span-->
			<div class="span9"> 
				<div class="hero-unit" >
					<h1>管理员权限</h1>
					<p></p>
					<p>
						<input id="quanxian" class="btn btn-warning" type="button" value="Learn more" />
							&raquo;
					</p>
				</div>
				<div class="row-fluid">
					<div class="span4">
						<h2>用户信息</h2>
						<p></p>
						<p>
							<a class="btn" href="userm.jsp">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
					<div class="span4">
						<h2>房产信息</h2>
						<p></p>
						<p>
							<a class="btn" href="housem.jsp">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
					<div class="span4">
						<h2>留言信息</h2>
						<p></p>
						<p>
							<a class="btn" href="bbsm.jsp">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
				</div>
				<!--/row-->
				<div class="row-fluid">
					<div class="span4">
						<h2>请求处理</h2>
						<p></p>
						<p>
							<a class="btn" href="userrequest.jsp">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
					<div class="span4">
						<h2>添加房产</h2>
						<p></p>
						<p>
							<a class="btn" href="addhouse.jsp">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
					<div class="span4">
						<h2>尚未添加</h2>
						<p></p>
						<p>
							<a class="btn" href="#">View details &raquo;</a>
						</p>
					</div>
					<!--/span-->
				</div>
				<!--/row-->
			</div>
			<!--/span-->
		</div>
		<!--/row-->

		<hr>

		<footer>
			<strong>Copyright &copy; 2015-2016 <a href="people.jsp">Liuxingsata</a>.
			</strong> All rights reserved.
		</footer>

	</div>
	<!--/.fluid-container-->



</body>
</html>
