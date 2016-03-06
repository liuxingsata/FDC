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
<script type="text/javascript">
$(document).ready(function(){
	$("#openfile").click(function(){
		$.get("test");
	})
})
</script>
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
						<li><a href="userm.jsp">用户信息编辑</a></li>
						<li class="active"><a href="housem.jsp">房产信息编辑</a></li>
						<li><a href="bbsm.jsp">留言信息编辑</a></li>
						<li><a href="userrequest.jsp">用戶請求處理</a></li>
						
					</ul>
				</div>
				<!--/.well -->
			</div>
			<!--/span-->
			<%
						String id=request.getParameter("id");
						newOperation nop = new newOperation();
				 		String sql="select * from house where house_id="+id;
				 		ResultSet sqlRst = nop.select(sql);
				 		houseBean hb=new houseBean();
						while (sqlRst.next()) {
							
							hb.setId(sqlRst.getString(1));
							hb.setHousetype(sqlRst.getString(2));
							hb.setHousearea(sqlRst.getString(3));
							hb.setHousefloor(sqlRst.getString(4));
							hb.setHouseadd(sqlRst.getString(5));
							hb.setHouseowner(sqlRst.getString(6));
							hb.setHousephoto(sqlRst.getString(7));
							hb.setHouseall(sqlRst.getString(8));
					}
						sqlRst.close();
				 	%>
			<div class="span9">
				<div class="table">
				<form action="editHouseServlet" method="post">
				<input  value="<%=id %>" type="hidden" name="id" >
					<table>
					
							
							<tr><td>房屋型号</td><td><input  value="<%=hb.getHousetype() %>" type="text" name="housetype" required="required"></td></tr>
							<tr><td>房屋面积</td><td><input  value="<%=hb.getHousearea() %>" type="text" name="housearea" required="required"></td></tr>
							<tr><td>所在楼层</td><td><input  value="<%=hb.getHousefloor() %>" type="text" name="housefloor" required="required"></td></tr>
							<tr><td>房屋地址</td><td><input  value="<%=hb.getHouseadd() %>" type="text" name="houseadd" required="required"></td></tr>
							<tr><td>房屋所有者</td><td><input  value="<%=hb.getHouseowner() %>" type="text" name="houseowner"></td></tr>
							<tr><td>参考图片</td><td><div><img src="../<%=hb.getHousephoto()%>"><input id="openfile" type="file" name="housephoto"></div></td></tr>
							<tr><td><button type="submit" class="btn btn-primary popover-show">提交修改</button></td><td><button type="reset" class="btn btn-warning" >重置信息</button></td></tr>
						
						

					</table></form>
				</div>
			</div>
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
