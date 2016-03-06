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
	href="../assets/bootstrap/css/Iframe.css">
<link rel="stylesheet" type="text/css"
	href="../assets/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="../assets/bootstrap/css/bootstrap.min.css" media="screen">
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
<link href="assets/bootstrap/css/bootstrap-responsive.css"
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
						<li><a href="#">项目小组信息</a></li>
						<li class="dropdown" id="menutest"><a href="#menutest"
							class="dropdown-toggle" data-toggle="dropdown"><%=session.getAttribute("uname")%>您好！<b
								class="caret"></b></a>
							<ul class="dropdown-menu pull-right">
						
								<li class="divider"></li>
								<li class="nav-header">附加</li>
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
						<li class="nav-header">组长</li>
						<li>54130608</li>
						<li>王同鹤</li>
					</ul>
				</div>
				<!--/.well -->
			</div>
			<!--/span-->
			
				<div class="span10">
					<div class="table">
						<table>
							<tr class="tb_title">
								<td width="20%">班级</td>
								<td width="30%">学号</td>
								<td width="30%">姓名</td>
							</tr>
							
							<tr>
								<td width="20%">六班</td>
								<td width="30%">54130613</td>
								<td width="30%">王宁</td>

							</tr>
							<tr>
								<td width="20%">六班</td>
								<td width="30%">54130603</td>
								<td width="30%">蔡睿</td>
							</tr>
							<tr>
								<td width="20%">六班</td>
								<td width="30%">54130604</td>
								<td width="30%">吴广亮</td>
							</tr>
							<tr>
								<td width="20%">六班</td>
								<td width="30%">54130602</td>
								<td width="30%">何子墨</td>
							</tr>
							<tr>
								<td width="20%">六班</td>
								<td width="30%">54130615</td>
								<td width="30%">孙大伟</td>
							</tr>
						</table>
					</div>
				</div>
			
		</div>
		<hr>

		<footer>
			<strong>Copyright &copy; 2015 <a href="#">Liuxingsata</a>.
			</strong> All rights reserved.
		</footer>

	</div>
	<!--/.fluid-container-->



</body>
</html>
