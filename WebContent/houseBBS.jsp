<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page info="database handler"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.List.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="com.Servlet.*"%>
<%@ page import="oracle.jdbc.*"%>
<%@ page import="com.javaBean.*"%>


<html lang="en">
<head>
<title>房地产管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">
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

.center {
	width: auto;
	display: table;
	margin-left: auto;
	margin-right: auto;
}

.text-center {
	text-align: center;
}
</style>
<link href="assets/bootstrap/css/bootstrap-responsive.css"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="assets/bootstrap/css/bootstrap.css">

<script src="assets/bootstrap/js/jquery-2.1.4.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.js"></script>

<script>
	function valiMESSAGE_DATECompose() {
		var MB_CONTENT = document.frmCompose.CONTENT.value;
		if (MB_CONTENT == "") {
			$(function() {
				$('#myPopover').popover({
					content : "请输入正确的内容 ",
					placement : "right"
				});
			});
			return false;
		}
		window.opener.location.reload();
	}
</script>

</head>
<body>
	<!-- NAVBAR
    ================================================== -->
	<div class="navbar-wrapper">
		<!-- Wrap the .navbar in .container to center it within the absolutely positioned parent. -->
		<div class="container">

			<div class="navbar navbar-inverse">
				<div class="navbar-inner">
					<!-- Responsive Navbar Part 1: Button for triggering responsive navbar (not covered in tutorial). Include responsive CSS to utilize. -->
					<button type="button" class="btn btn-navbar" data-toggle="collapse"
						data-target=".nav-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="brand" href="index.jsp">房地产管理系统</a>
					<!-- Responsive Navbar Part 2: Place all navbar contents you want collapsed withing .navbar-collapse.collapse. -->
					<div class="nav-collapse collapse">
						<ul class="nav">
							<li><a href="index.jsp">主页</a></li>
							<li><a href="zuixin.jsp">最新房源信息</a></li>
							<li><a href="ershou.jsp">二手房信息</a></li>
							<li><a href="kezu.jsp">可租房信息</a></li>
							<li class="active"><a href="houseBBS.jsp">留言板块</a></li>
							<li class="dropdown" id="menutest"><a href="#menutest"
								class="dropdown-toggle" data-toggle="dropdown"><%=session.getAttribute("uname")%>您好！<b
									class="caret"></b></a>
								<ul class="dropdown-menu">
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
							<li><a href="houseBBS.jsp"></a></li>
						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
				<!-- /.navbar-inner -->
		<table class="table table-responsive">



			<tr class="title">
				<th width="20">发言时间</th>
				<th width="8%">发言用户</th>
				<th width="72%">发言内容</th>
			</tr>


			<tbody id="table2">
				<%
					
					String CONTENT = "";
					msgShow ms = new msgShow();
					String tablename = "messageboard";
					ms.setTablename(tablename);
					List<msgBean> mB = ms.msglist();
					for (msgBean msb : mB) {
						CONTENT = msb.getContent();

						out.println("<tr><td>" + msb.getMsgdate() + "</td><td>" + msb.getUsername() + "</td><td>" + CONTENT
								+ "</td></tr>");

					}
				%>
			</tbody>

		</table>
		<span id="spanFirst"><button class="btn btn-primary">第一页</button></span>
		<span id="spanPre"><button class="btn btn-primary">上一页</button></span>
		<span id="spanNext"><button class="btn btn-primary">下一页</button></span>
		<span id="spanLast"><button class="btn btn-primary">最后一页</button></span>
		第<span id="spanPageNum"></span>页/共<span id="spanTotalPage"></span>页
		<span class="pull-right">当前在线人数：<%=application.getAttribute("num") %></span>				
			</div>
			<!-- /.navbar -->

		</div>
		<!-- /.container -->
	</div>
	<!-- /.navbar-wrapper -->


		<!-- Wrap the .navbar in .container to center it within the absolutely positioned parent. -->
		
		
	<!--<div style="display: table; width: auto; margin-left: auto; margin-right: auto;">-->

	
	<form name="frmCompose" method="POST" action="bbsServlet"
		onSubmit="javaScript:return valiMESSAGE_DATECompose();">
		<div class="form-group">
			<div class="form-group" style="text-align: center;">
				<textarea class="form-control" rows="10" style="width: 70%"
					name="CONTENT"></textarea>
			</div>

		</div>

		<div class="btn-group"
			style="display: table; width: auto; margin-left: auto; margin-right: auto;">
			<button type="submit" class="btn btn-primary popover-show"
				title="所写留言不能为空" id="myPopover">发表留言</button>
			<button type="reset" class="btn btn-warning" title="重置您所写留言">重置留言</button>

		</div>
	</form>
	<!-- FOOTER -->
	<footer>
		<p class="pull-right">
			<a href="#">回顶部</a>
		</p>
		<strong>Copyright &copy; 2015-2016 <a href="#">Liuxingsata</a>.
		</strong> All rights reserved.<a href="admin/people.jsp">开发人员名单</a>
	</footer>

</body>
<script>
	var theTable = document.getElementById("table2");
	var totalPage = document.getElementById("spanTotalPage");
	var pageNum = document.getElementById("spanPageNum");

	var spanPre = document.getElementById("spanPre");
	var spanNext = document.getElementById("spanNext");
	var spanFirst = document.getElementById("spanFirst");
	var spanLast = document.getElementById("spanLast");

	var numberRowsInTable = theTable.rows.length;
	var pageSize = 10;
	var page = 1;

	//下一页
	function next() {

		hideTable();

		currentRow = pageSize * page;
		maxRow = currentRow + pageSize;
		if (maxRow > numberRowsInTable)
			maxRow = numberRowsInTable;
		for (var i = currentRow; i < maxRow; i++) {
			theTable.rows[i].style.display = '';
		}
		page++;

		if (maxRow == numberRowsInTable) {
			nextText();
			lastText();
		}
		showPage();
		preLink();
		firstLink();
	}

	//上一页
	function pre() {

		hideTable();

		page--;

		currentRow = pageSize * page;
		maxRow = currentRow - pageSize;
		if (currentRow > numberRowsInTable)
			currentRow = numberRowsInTable;
		for (var i = maxRow; i < currentRow; i++) {
			theTable.rows[i].style.display = '';
		}

		if (maxRow == 0) {
			preText();
			firstText();
		}
		showPage();
		nextLink();
		lastLink();
	}

	//第一页
	function first() {
		hideTable();
		page = 1;
		for (var i = 0; i < pageSize; i++) {
			theTable.rows[i].style.display = '';
		}
		showPage();

		preText();
		nextLink();
		lastLink();
	}

	//最后一页
	function last() {
		hideTable();
		page = pageCount();
		currentRow = pageSize * (page - 1);
		for (var i = currentRow; i < numberRowsInTable; i++) {
			theTable.rows[i].style.display = '';
		}
		showPage();

		preLink();
		nextText();
		firstLink();
	}

	function hideTable() {
		for (var i = 0; i < numberRowsInTable; i++) {
			theTable.rows[i].style.display = 'none';
		}
	}

	function showPage() {
		pageNum.innerHTML = page;
	}

	//总共页数
	function pageCount() {
		var count = 0;
		if (numberRowsInTable % pageSize != 0)
			count = 1;
		return parseInt(numberRowsInTable / pageSize) + count;
	}

	//显示链接
	function preLink() {
		spanPre.innerHTML = "<a href='javascript:pre();'><button class='btn btn-primary'>上一页</button></a>";
	}
	function preText() {
		spanPre.innerHTML = "上一页";
	}

	function nextLink() {
		spanNext.innerHTML = "<a href='javascript:next();'><button class='btn btn-primary'>下一页</button></a>";
	}
	function nextText() {
		spanNext.innerHTML = "下一页";
	}

	function firstLink() {
		spanFirst.innerHTML = "<a href='javascript:first();'><button class='btn btn-primary'>第一页</button></a>";
	}
	function firstText() {
		spanFirst.innerHTML = "第一页";
	}

	function lastLink() {
		spanLast.innerHTML = "<a href='javascript:last();'><button class='btn btn-primary'>最后一页</button></a>";
	}
	function lastText() {
		spanLast.innerHTML = "最后一页";
	}

	//隐藏表格
	function hide() {
		for (var i = pageSize; i < numberRowsInTable; i++) {
			theTable.rows[i].style.display = 'none';
		}

		totalPage.innerHTML = pageCount();
		pageNum.innerHTML = '1';

		nextLink();
		lastLink();
	}

	hide();
</script>
</html>
