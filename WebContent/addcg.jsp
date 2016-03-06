<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%
	String url="";
	if(session.getAttribute("admin")=="false"){url="houseinfo.jsp";}else{url="admin/housem.jsp";}
%>
<meta charset="utf-8">
<title>房地产-通知</title>
<meta http-equiv="refresh" content="3;url=<%=url%>">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/style.css">
</head>
<%
	long current_time = 0;
	long end_time = 3000;
	long time = end_time - current_time;
%>

<body>
	<div class="header">
		<div class="container">
			<div class="row">
				<div class="logo span4">
					<h1>
						<a href="">通知</a>
					</h1>
				</div>
				<div class="links span8">
					<a class="home" href="index.jsp" rel="tooltip"
						data-placement="bottom" data-original-title="主页"></a>

				</div>
			</div>
		</div>
	</div>
	<div
		style="display: table; width: auto; margin-left: auto; margin-right: auto;">
		<table>
			<tr>
				<td><h1>
						<span class="red">添加成功</span>
					</h1></td>
			</tr>
			<tr>
				<td><h2>
						<span class="red" id="showTimes"></span><span class="red">秒后自动返回房产信息界面</span>
					</h2></td>
			</tr>
			<tr>
				<td><a class="btn btn-large btn-primary" href="<%=url%>">手动返回</a></td>
			</tr>
		</table>
	</div>
	<!-- Javascript -->
	<script src="assets/js/jquery-1.8.2.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"></script>
	<script src="assets/js/scripts.js"></script>
</body>
<script>
	var second =
<%=time / 1000%>
	;

	window.setInterval(function() {
		second--;
		document.getElementById("showTimes").innerHTML = second;
	}, 1000);
</script>
</html>

