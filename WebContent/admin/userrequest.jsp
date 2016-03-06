<!DOCTYPE html>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.*"%>
<%@ page import="com.javaBean.*"%>
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
						<li class="active"><a href="userm.jsp">用户信息编辑</a></li>
						<li><a href="housem.jsp">房产信息编辑</a></li>
						<li ><a href="bbsm.jsp">留言信息编辑</a></li>
						<li class="active"><a href="userrequest.jsp">用戶請求處理</a></li>
					</ul>
				</div>
				<!--/.well -->
			</div>
			<!--/span-->
			
				<div class="span9">
					<div class="table">
					<form action="test" method="post">
						<table>
							<tr class="tb_title">
								<td width="10%">申请人</td>
								<td width="10%">房屋ID</td>
								<td width="15%">申请类型</td>
								<td width="10%">操作</td>
							</tr>
							<tbody>
								<%
									requestShow rs=new requestShow();
									List<requestBean> rB =rs.rlist();
									for (requestBean usb : rB) {
										out.println(
												"<tr><td>" + usb.getUsername() + "</td><td>" + usb.getHouseid() + "</td><td>" + usb.getApplytype()
														+ "</td><td>");
								%>
								<input  class="btn" type="button" onclick="agree(<%=usb.getId() %>)" value="同意" />
								<input  class="btn btn-warning" type="button" onclick="disagree(<%=usb.getId() %>)" value="拒绝" />
								<%
									out.println("</td></tr>");
									}
								%>
							</tbody>

						</table></form>
					</div>
				</div>
			
		</div>
		<hr>

		<footer>
			<strong>Copyright &copy; 2015-2016 <a href="people.jsp">Liuxingsata</a>.
			</strong> All rights reserved.
		</footer>

	</div>
	<!--/.fluid-container-->



</body>
<script type="text/javascript">
	function agree(id){
		var action="agree";
		if(confirm("确定同意申請？")){
		location.href="requestServlet?id="+id+"&action="+action;}
	}
	function disagree(id){
		var action="disagree";
		if(confirm("确定拒絕申請？")){
		location.href="requestServlet?id="+id+"&action="+action;}
	}
</script>
</html>
