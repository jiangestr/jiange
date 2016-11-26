<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta name="description" content="CSS3 skins for jQuery UI datapicker" />
	<meta name="keywords" content="jquery datepicker themes, jquery datepicker skins, jquery ui datepicker themes, jquery ui datepicker skins, CSS3 jquery datepicker, CSS3 datepicker, CSS3 calendar, javascript datepicker, javascript calendar" />
	<meta property="twitter:card" content="summary"/>
  <meta property="twitter:site" content="@GitHub">
  <meta property="twitter:title" content="rtsinani/jquery-datepicker-skins"/>

	<title>jquery-datepicker-skins :: CSS3 skins for jQuery UI datepicker</title>
	<link href="<%=request.getContextPath()%>/bootStrap/css/jquery-ui-1.10.1.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/bootStrap/css/siena.datepicker.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/bootStrap/css/santiago.datepicker.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/bootStrap/css/latoja.datepicker.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/bootStrap/css/lugo.datepicker.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/bootStrap/css/cangas.datepicker.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/bootStrap/css/vigo.datepicker.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/bootStrap/css/nigran.datepicker.css" rel="stylesheet">

	<style>
		
		article {
			display: block;
			width: 960px;
			margin: 20px 20px;
		}

		i
	</style>
</head>
<body>

	

	<article>
		<div>
			<input type="text" id="date-picker-input-1" />
		</div>
	</article>

	

	<script src="<%=request.getContextPath()%>/bootStrap/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/bootStrap/js/jquery-ui-1.10.1.min.js"></script>
	<script>
		$(function() {
			$( "#date-picker-input-1" ).datepicker({
				inline: true,
				showOtherMonths: true
			})
			.datepicker('widget').wrap('<div class="ll-skin-lugo"/>');
		});
	</script>
</body>
</html>