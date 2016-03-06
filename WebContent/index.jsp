
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<!--[if IE 7]>         <html class="ie7 old-ie no-js" lang="en"> <![endif]-->
<!--[if lte IE 8]>     <html class="old-ie no-js" lang="en">     <![endif]-->
<!--[if gt IE 8]><!-->
<html class="not-ie no-js" lang="en">
<!--<![endif]-->
<head>
<style>
body {
	height: 100%;
	margin: 0;
	overflow: hidden;
	padding: 0;
	width: 100%;
}

.viewlist {
	margin: 0;
}
</style>
<link rel="stylesheet" href="assets/css/all.min.css" type="text/css"
	media="screen" />
<script type='text/javascript' src="assets/js/jquery.min.js"></script>
<script>
	var global_contextPath = '/gb';
	//function to fix height of iframe!
	var calcHeight = function() {
		var headerDimensions = $('#header-bar').outerHeight();
		$('#preview-frame').height($(window).height() - headerDimensions);
	}
	$(window).load(function() {
		calcHeight();
		$('#header-bar a.close').mouseover(function() {
			$('#header-bar a.close').addClass('activated');
		}).mouseout(function() {
			$('#header-bar a.close').removeClass('activated');
		});
	});

	$(window).resize(function() {
		calcHeight();
	}).load(function() {
		calcHeight();
	});
</script>


<script>
	$(function() {
		$.jResize({
			viewPortSizes : [ '320px', '480px', '540px', '600px', '768px',
					'960px', '1024px', '1280px', '1920px' ], // ViewPort widths
			backgroundColor : 'F8F8F8',
			fontColor : '777777', // HEX Code
			postid : '1196'
		});
	});
</script>

</head>

<body>
	<iframe id="preview-frame" height="1000" src="index01.jsp"
		name="preview-frame" ></iframe>

	<iframe src="http://www.gbtags.com/gb/networks/gbdemotongji.html"></iframe>
</body>
</html>