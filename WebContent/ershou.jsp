<!DOCTYPE html>
<%@ page import="java.util.Collection,java.util.Iterator"%>
<%@ page info="database handler"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.Servlet.*"%>
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
	href="assets/bootstrap/css/bootstrap.css">

<script src="assets/bootstrap/js/jquery-2.1.4.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#searchbutton").click(function(){
			$("#01").load("searchhouse.jsp",{search:$("#search").val(),tablename:"oldhouse"});
		})
	})
</script>
<style type="text/css">
table {
	text-align:center;
	valign:center;
}
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

					<ul class="nav">
						<li><a href="index.jsp">主页</a></li>
						<li><a href="zuixin.jsp">最新房源信息</a></li>
						<li class="active"><a href="ershou.jsp">二手房信息</a></li>
						<li><a href="kezu.jsp">可租房信息</a></li>
						<li><a href="houseBBS.jsp">留言板块</a></li>
						<li class="dropdown" id="menutest"><a href="#menutest"
							class="dropdown-toggle" data-toggle="dropdown"><%=session.getAttribute("uname")%>您好！<b
								class="caret"></b></a>
							<ul class="dropdown-menu pull-right">
								<%
									if (session.getAttribute("admin") == "false") {
										out.print("<li><a href='personinfo.jsp'>基本信息</a></li>");
										out.print("<li><a href='houseinfo.jsp'>房产信息</a></li>");
										out.print("<li><a href='bbsinfo.jsp'>发言信息</a></li>");
										out.print("<li class='divider'></li>");
										out.print("<li class='nav-header'>附加</li>");
									} else

										out.print("<li><a href='admin/houtaiguanli.jsp'>后台管理</a></li>");
								%>
								<li><a href="tuichu.jsp">退出登录</a></li>
							</ul></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>
	

	<div class="container-fluid" >
		<div class="row-fluid" >
			<div class="span3">
				<div class="well sidebar-nav">
					<ul class="nav nav-list">
						<li class="nav-header">关键词查询</li>
						<li class="active">
							<div>
								<input id="search" class="" type="text" name="search">
								</div><div>
								<input id="searchbutton" value="查询" class="btn btn-warning"  type="button" >
							</div>
						</li>
						
					</ul>
				</div>
				<!--/.well -->
			</div>
			<!--/span-->

			<div class="span9" id="01">
			
				<div >
					<table  style='text-align:center'>
						<tr class="tb_title">

							<td width="10%" >房屋型号</td>
							<td width="10%">房屋面积</td>
							<td width="10%">所在楼层</td>
							<td width="20%">房屋地址</td>
							<td width="10%">房屋所有者</td>
							<td width="25%">参考图片</td>

						</tr>
						<tbody>
							<%
							houseShow ms = new houseShow();
							String tablename = "oldhouse";
							
							ms.setTablename(tablename);
							List<houseBean> hB = ms.houselist();

								for (houseBean hsb : hB) {
									out.println("<tr><td >" + hsb.getHousetype() + "</td><td>" + hsb.getHousearea() + "</td><td>"
											+ hsb.getHousefloor() + "</td><td>" + hsb.getHouseadd() + "</td><td>" + hsb.getHouseowner()
											+ "</td><td>");
							%><img src="<%=hsb.getHousephoto()%>">
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
			<p class="pull-right">
				<a href="#">回顶部</a>
			</p>
			<strong>Copyright &copy; 2015-2016 <a href="#">Liuxingsata</a>.
			</strong> All rights reserved.<a href="admin/people.jsp">开发人员名单</a>
		</footer>
		
	</div>

</body>

</html>