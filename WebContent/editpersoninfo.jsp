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
						<li class="active"><a href="personinfo.jsp">用户基本信息</a></li>
						<li><a href="houseinfo.jsp">用户房产信息</a></li>
						<li><a href="bbsinfo.jsp">用户留言信息</a></li>
					</ul>
				</div>
				<!--/.well -->
			</div>
			<!--/span-->
			<div class="span9">
				<div class="table">
				<%	
					String username=session.getAttribute("uname").toString();
					newOperation nop = new newOperation();
				 	String sql="select * from users where user_name='"+username+"'";
				 	System.out.println(sql);
				 	ResultSet sqlRst = nop.select(sql);
				 	userBean hb = new userBean();
					while (sqlRst.next()) {
							
							hb.setId(sqlRst.getString(1));
							hb.setUsername(sqlRst.getString(2));
							hb.setPassword(sqlRst.getString(3));
							hb.setTruename(sqlRst.getString(4));
							hb.setSex(sqlRst.getString(5));
							hb.setPhonenumber(sqlRst.getString(6));
							hb.setEmail(sqlRst.getString(7));
					}
						sqlRst.close();
				nop.close();
				%>
				<form action="editUserServlet" method="post">
					<input  value="users" type="hidden" name="tablename" >
					<input  value="<%=hb.getId() %>" type="hidden" name="id" >
					<table>
						
							<tr><td>用户名</td><td><input  value="<%=hb.getUsername() %>" type="text" name="username" required="required"></td></tr>
							<tr><td>密码</td><td><input value="<%=hb.getPassword() %>" type="text"  name="password" required="required"></td></tr>
							<tr><td>真实姓名</td><td><input  value="<%=hb.getTruename()%>" type="text" name="truename" required="required"></td></tr>
							<tr><td>性別</td><td><input  value="<%=hb.getSex()%>" type="text" name="sex" pattern="^男|女$" required="required"></td></tr>
							<tr><td>联系电话</td><td><input  value="<%=hb.getPhonenumber()%>" type="text" name="phone" pattern="^[1][3578][0-9]{9}$" required="required"></td></tr>
							<tr><td>电子邮箱</td><td><input  value="<%=hb.getEmail()%>" type="text" name="email" pattern="^\w+[@]\w+[.]\w+$"></td></tr>
							<tr><td><button type="submit" class="btn btn-primary popover-show">提交修改</button></td><td><button type="reset" class="btn" >全部重置</button></td></tr>
						

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
