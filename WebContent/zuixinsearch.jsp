<!DOCTYPE html>

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



			<div class="span11" id="01">
				<div  >
					<table  style='text-align:center'>
						<tr class="tb_title">

							<td width="10%">房屋型号</td>
							<td width="10%">房屋面积</td>
							<td width="10%">所在楼层</td>
							<td width="20%">房屋地址</td>
							
							<td width="25%">参考图片</td>

						</tr>
						<tbody>
							<%
							List<houseBean> hB = new ArrayList<houseBean>();
							newOperation nop = new newOperation();
							houseShow ms = new houseShow();
							String tablename = "house";
							String value =request.getParameter("search");
							String sql = "select * from " + tablename + " where house_all like '%" + value + "%' and house_owner=''";
							System.out.println(sql);
							if(value==null||value==""){
								ms.setTablename(tablename);
								ms.setUsername("house_owner");
								hB=ms.houselist();
							}else{
								ResultSet sqlRst = nop.select(sql);
								try {
									while (sqlRst.next()) {
										houseBean hb = new houseBean();
										hb.setHousetype(sqlRst.getString(2));
										hb.setHousearea(sqlRst.getString(3));
										hb.setHousefloor(sqlRst.getString(4));
										hb.setHouseadd(sqlRst.getString(5));
										hb.setHouseowner(sqlRst.getString(6));
										hb.setHousephoto(sqlRst.getString(7));
										hB.add(hb);
									}
									sqlRst.close();

								} catch (SQLException e) {
									
									e.printStackTrace();
								}}
							
							for (houseBean hsb : hB) {
									out.println("<tr><td>" + hsb.getHousetype() + "</td><td>" + hsb.getHousearea() + "</td><td>"
											+ hsb.getHousefloor() + "</td><td>" + hsb.getHouseadd() + "</td><td>");
							%><img src="<%=hsb.getHousephoto()%>">
							<%
								out.println("</td></tr>");

								}
							%>
						</tbody>

					</table>
				</div>
			</div>
		
</body>


</html>