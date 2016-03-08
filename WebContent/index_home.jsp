<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
<style>

/* GLOBAL STYLES
    -------------------------------------------------- */
/* Padding below the footer and lighter body text */
body {
	padding-bottom: 40px;
	color: #5a5a5a;
}

/* CUSTOMIZE the NAVBAR
    -------------------------------------------------- */

/* Special class on .container surrounding .navbar, used for positioning it into place. */
.navbar-wrapper {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	z-index: 10;
	margin-top: 20px;
	margin-bottom: -90px;
	/* Negative margin to pull up carousel. 90px is roughly margins and height of navbar. */
}

.navbar-wrapper .navbar {
	
}

/* Remove border and change up box shadow for more contrast */
.navbar .navbar-inner {
	border: 0;
	-webkit-box-shadow: 0 2px 10px rgba(0, 0, 0, .25);
	-moz-box-shadow: 0 2px 10px rgba(0, 0, 0, .25);
	box-shadow: 0 2px 10px rgba(0, 0, 0, .25);
}

/* Downsize the brand/project name a bit */
.navbar .brand {
	padding: 14px 20px 16px;
	/* Increase vertical padding to match navbar links */
	font-size: 16px;
	font-weight: bold;
	text-shadow: 0 -1px 0 rgba(0, 0, 0, .5);
}

/* Navbar links: increase padding for taller navbar */
.navbar .nav>li>a {
	padding: 15px 20px;
}

/* Offset the responsive button for proper vertical alignment */
.navbar .btn-navbar {
	margin-top: 10px;
}

/* CUSTOMIZE the CAROUSEL
    -------------------------------------------------- */

/* Carousel base class */
.carousel {
	margin-bottom: 60px;
}

.carousel .container {
	position: relative;
	z-index: 9;
}

.carousel-control {
	height: 80px;
	margin-top: 0;
	font-size: 120px;
	text-shadow: 0 1px 1px rgba(0, 0, 0, .4);
	background-color: transparent;
	border: 0;
	z-index: 10;
}

.carousel .item {
	height: 500px;
}

.carousel img {
	position: absolute;
	top: 0;
	left: 0;
	min-width: 100%;
	height: 500px;
}

.carousel-caption {
	background-color: transparent;
	position: static;
	max-width: 550px;
	padding: 0 20px;
	margin-top: 200px;
}

.carousel-caption h1, .carousel-caption .lead {
	margin: 0;
	line-height: 1.25;
	color: #fff;
	text-shadow: 0 1px 1px rgba(0, 0, 0, .4);
}

.carousel-caption .btn {
	margin-top: 10px;
}

/* MARKETING CONTENT
    -------------------------------------------------- */

/* Center align the text within the three columns below the carousel */
.marketing .span4 {
	text-align: center;
}

.marketing h2 {
	font-weight: normal;
}

.marketing .span4 p {
	margin-left: 10px;
	margin-right: 10px;
}

/* Featurettes
    ------------------------- */
.featurette-divider {
	margin: 80px 0; /* Space out the Bootstrap <hr> more */
}

.featurette {
	padding-top: 120px;
	/* Vertically center images part 1: add padding above and below text. */
	overflow: hidden;
	/* Vertically center images part 2: clear their floats. */
}

.featurette-image {
	margin-top: -120px;
	/* Vertically center images part 3: negative margin up the image the same amount of the padding to center it. */
}

/* Give some space on the sides of the floated elements so text doesn't run right into it. */
.featurette-image.pull-left {
	margin-right: 40px;
}

.featurette-image.pull-right {
	margin-left: 40px;
}

/* thin out the marketing headings */
.featurette-heading {
	font-size: 50px;
	font-weight: 300;
	line-height: 1;
	letter-spacing: -1px;
}

/* RESPONSIVE CSS
    -------------------------------------------------- */
@media ( max-width : 979px) {
	.container.navbar-wrapper {
		margin-bottom: 0;
		width: auto;
	}
	.navbar-inner {
		border-radius: 0;
		margin: -20px 0;
	}
	.carousel .item {
		height: 500px;
	}
	.carousel img {
		width: auto;
		height: 500px;
	}
	.featurette {
		height: auto;
		padding: 0;
	}
	.featurette-image.pull-left, .featurette-image.pull-right {
		display: block;
		float: none;
		max-width: 40%;
		margin: 0 auto 20px;
	}
}

@media ( max-width : 767px) {
	.navbar-inner {
		margin: -20px;
	}
	.carousel {
		margin-left: -20px;
		margin-right: -20px;
	}
	.carousel .container {
		
	}
	.carousel .item {
		height: 300px;
	}
	.carousel img {
		height: 300px;
	}
	.carousel-caption {
		width: 65%;
		padding: 0 70px;
		margin-top: 100px;
	}
	.carousel-caption h1 {
		font-size: 30px;
	}
	.carousel-caption .lead, .carousel-caption .btn {
		font-size: 18px;
	}
	.marketing .span4+.span4 {
		margin-top: 40px;
	}
	.featurette-heading {
		font-size: 30px;
	}
	.featurette .lead {
		font-size: 18px;
		line-height: 1.5;
	}
}
</style>

</head>

<body>
<%
int i=0;
String str="";
if(application.getAttribute("num")==null){
	application.setAttribute("num","1");
	application.setAttribute("now","1");}
else{
	if(session.isNew()){
		str=application.getAttribute("num").toString();
		i=Integer.parseInt(str);
		i++;
		application.setAttribute("num",i);
	}
}

	%>


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
							<li class="active"><a href="index.jsp">主页</a></li>
							<li><a href="zuixin.jsp">最新房源信息</a></li>
							<li><a href="ershou.jsp">二手房信息</a></li>
							<li><a href="kezu.jsp">可租房信息</a></li>
							<li><a href="houseBBS.jsp">留言板块</a></li>
							<li class="dropdown" id="menutest"><a href="#menutest"
								class="dropdown-toggle" class="right" data-toggle="dropdown"><%=session.getAttribute("uname")%>您好！<b
									class="caret"></b></a>

								<ul class="dropdown-menu">
									<%
										if (session.getAttribute("admin").equals("false")) {
											out.print("<li><a href='personinfo.jsp'>基本信息</a></li>");
											out.print("<li><a href='houseinfo.jsp'>房产信息</a></li>");
											out.print("<li><a href='bbsinfo.jsp'>发言信息</a></li>");
											out.print("<li class='divider'></li>");
											out.print("<li class='nav-header'>附加</li>");
										} else

											out.print("<li><a href='admin/houtaiguanli.jsp'>后台管理</a></li>");
									%>
									<li><a href='tuichu.jsp'>退出登录</a></li>
								</ul></li>
						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
				<!-- /.navbar-inner -->
			</div>
			<!-- /.navbar -->

		</div>
		<!-- /.container -->
	</div>
	<!-- /.navbar-wrapper -->



	<!-- Carousel
    ================================================== -->
	<div id="myCarousel" class="carousel slide">
		<div class="carousel-inner">
			<div class="item active">
				<img src="assets/bootstrap/img/bg3.png" alt="">
				<div class="container">
					<div class="carousel-caption">
						<h1>总有你要的房产！</h1>
						<p class="lead">这里有最新最全的房源信息，</p>
						<a class="btn btn-large btn-primary" href="zuixin.jsp">查看详情</a>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="assets/bootstrap/img/bg2.png" alt="">
				<div class="container">
					<div class="carousel-caption">
						<h1>丰富的二手房资源！</h1>
						<p class="lead">想找一个实惠的二手房？我们这里有</p>
						<a class="btn btn-large btn-primary" href="ershou.jsp">查看详情</a>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="assets/bootstrap/img/bg.png" alt="">
				<div class="container">
					<div class="carousel-caption">
						<h1>有保障的可租房！</h1>
						<p class="lead">还是说想要租一个房子。</p>
						<a class="btn btn-large btn-primary" href="kezu.jsp">查看详情</a>
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
	</div>
	<!-- /.carousel -->



	<!-- Marketing messaging and featurettes
    ================================================== -->
	<!-- Wrap the rest of the page in another container to center all the content. -->

	<div class="container marketing">

		<!-- three columns of text below the carousel -->
		<div class="row">
			<div class="span4">
				<img class="img-circle" data-src="holder.js/140x140"
					src="assets/bootstrap/img/huanjing01.png">
				<h2>最新房源</h2>
				<p></p>
				<p>
					<a class="btn" href="zuixin.jsp">查看细节 &raquo;</a>
				</p>
			</div>
			<!-- /.span4 -->
			<div class="span4">
				<img class="img-circle" data-src="holder.js/140x140"
					src="assets/bootstrap/img/shinei02.png">
				<h2>二手房</h2>
				<p></p>
				<p>
					<a class="btn" href="zuixin.jsp">查看细节 &raquo;</a>
				</p>
			</div>
			<!-- /.span4 -->
			<div class="span4">
				<img class="img-circle" data-src="holder.js/140x140"
					src="assets/bootstrap/img/shinei.png">
				<h2>可租房</h2>
				<p></p>
				<p>
					<a class="btn" href="zuixin.jsp">查看细节 &raquo;</a>
				</p>
			</div>
			<!-- /.span4 -->

		</div>
		<!-- /.row -->


		<!-- START the FEATURETTES -->
		<div class="featurette">
			<img class="featurette-image pull-right"
				src="assets/bootstrap/img/huanjing01.png">
			<h2 class="featurette-heading">优雅的环境</h2>
			<h3>
				<span class="muted">聆听自然的声音</span>
			</h3>
			<p class="lead">我们给您舒适，安静的环境</p>
		</div>

		<hr class="featurette-divider">

		<hr class="featurette-divider">

		<div class="featurette">
			<img class="featurette-image pull-right"
				src="assets/bootstrap/img/shinei.png">
			<h2 class="featurette-heading">放心的选择</h2>
			<h3>
				<span class="muted">你需要的这里都有</span>
			</h3>
			<p class="lead">我们给你最准确、最全面的的信息</p>
		</div>

		<hr class="featurette-divider">

		<div class="featurette">
			<img class="featurette-image pull-left"
				src="assets/bootstrap/img/kefu.png">
			<h2 class="featurette-heading">周到的服务</h2>
			<h3>
				<span class="muted">体验家一样的感觉</span>
			</h3>
			<p class="lead">我们给您完善的售后服务</p>
		</div>

		<hr class="featurette-divider">


		<!-- /END the FEATURETTES -->


		<!-- FOOTER -->
		<!-- FOOTER -->
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
