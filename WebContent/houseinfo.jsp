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

<link href="assets/bootstrap/css/bootstrap-responsive.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="assets/bootstrap/css/Iframe.css">
<link rel="stylesheet" type="text/css"
	href="assets/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="assets/bootstrap/css/bootstrap.min.css" media="screen">
<script src="assets/bootstrap/js/jquery-2.1.4.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.js"></script>
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
				<a class="brand" href="index.jsp">房地产管理系统</a>
				<div class="nav-collapse collapse">
					<p class="navbar-text pull-right"></p>
					<ul class="nav">
						<li><a href="#">个人信息管理</a></li>
						<li class="dropdown" id="menutest"><a href="#menutest"
							class="dropdown-toggle" data-toggle="dropdown">用户<%=session.getAttribute("uname")%>您好！<b
								class="caret"></b></a>
							<ul class="dropdown-menu pull-right">
	
								<li class="divider"></li>
								<li class="nav-header">附加</li>
								<li><a href="index.jsp">回到主页</a></li>
								<li><a href="tuichu.jsp">退出登录</a></li>
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
						<li class="active"><a href="#">用户名：<%=session.getAttribute("uname")%></a></li>
						<li><a href="personinfo.jsp">用户基本信息</a></li>
						<li class="active"><a href="houseinfo.jsp">用户房产信息</a></li>
						<li><a href="bbsinfo.jsp">用户留言信息</a></li>
						
					</ul>
				</div>
				<!--/.well -->
			</div>
			<!--/span-->
			<div class="span9">
				<div >

					<table style='text-align:center'>
						<thead>
							<tr class="title">
								<td width="10%">房屋型号</td>
								<td width="10%">房屋面积</td>
								<td width="10%">所在楼层</td>
								<td width="20%">房屋地址</td>
								<td width="25%">参考图片</td>
								<td width="10%">操作</td>
								
							</tr>
						</thead>
						<tbody>
							<%
								houseShow ms = new houseShow();
								String tablename = "house";
								String username = "house_owner";
								String value = (String) session.getAttribute("uname");
								ms.setTablename(tablename);
								ms.setUsername(username);
								ms.setValue(value);
								List<houseBean> mB = ms.houselist();
								for (houseBean hsb : mB) {

									out.println("<tr><td>" + hsb.getHousetype() + "</td><td>" + hsb.getHousearea() + "</td><td>"
											+ hsb.getHousefloor() + "</td><td>" + hsb.getHouseadd() + "</td><td>");
							%><img src="<%=hsb.getHousephoto()%>">
							<%out.println("</td><td>");
							%><div class="btn-group">
							<input  class="btn" type="button" onclick="edit(<%=hsb.getId() %>)" value="编辑" />
							<input  class="btn" type="button" onclick="add()" value="添加" />
							<input  class="btn btn-warning" type="button" onclick="deletehouse(<%=hsb.getId() %>)" value="删除" /></div>
							<%
							
								out.println("</td></tr>");

								}
							%>
						</tbody>

					</table>

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
	function edit(id){
		location.href="edithouseinfo.jsp?id="+id;
	}
	function deletehouse(id){
		var tablename="house";
		if(confirm("确定删除？")){
		location.href="deleteServlet?id="+id+"&tablename="+tablename;}
	}
	function add(id){
		location.href="addhouseinfo.jsp";
	}
</script>
</html>
