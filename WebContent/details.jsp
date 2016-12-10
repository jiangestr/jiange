<%@page import="com.jiange.dao.CarDao"%>
<%@page import="com.jiange.dao.DaoFactory"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@page import="com.jiange.model.Car"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<link
	href="<%=request.getContextPath()%>/bootStrap/css/jquery-ui-1.10.1.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/bootStrap/css/siena.datepicker.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/bootStrap/css/santiago.datepicker.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/bootStrap/css/latoja.datepicker.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/bootStrap/css/lugo.datepicker.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/bootStrap/css/cangas.datepicker.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/bootStrap/css/vigo.datepicker.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/bootStrap/css/nigran.datepicker.css"
	rel="stylesheet">

<style type="text/css">
.pictures {
	float: left;
	width: 100px;
	height: 87px;
	margin: 5px, auto, auto, 10px;
}
.marginLeft{
	margin-left: 9px;
}
</style>

<script type="text/javascript" >
	//表单提交验证
	/* $(document).ready(function(){
		$("form").submit(function(){
			if($("#date-picker-input-1").value == null||$("#days").value == "0"){
				return false;
			}
			else{
				return true;
			}
		});
	}); */
	

	//图片轮播
	function choose(t) {
		var p = document.getElementById("picture");
		p.src = t;

	}
	
	//cookie点击背景
	function mouseover(s) {
		var a = document.getElementById(s);
		a.style.backgroundColor = "#CDCDB4";
	}

	function mouseout(s) {
		var a = document.getElementById(s);
		a.style.backgroundColor = "";
	}
</script>

<style type="text/css">
article {
	display: block;
	width: 960px;
	margin: 20px 20px;
}
</style>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-12 column">

						<!-- 静态包含head页面，也就是将head里的标签移过来一起编译 -->
						<%@include file="/head.jsp"%>


					</div>
				</div>
				<div class="row clearfix" style="margin-top: 70px">
					<div class="col-md-9 column">
						<%
							Car car = (Car) session.getAttribute("car");
							String[] pictures = car.getPicture().split(";");
						%>
						<div id="outer">
							<div id="left" class="col-md-6 column">
								<div id="top">
									<img alt="156*124" width="400px" height="260px"
										src="<%=request.getContextPath()%>/image/<%=pictures[0]%>"
										id="picture">
								</div>
								<div id="bottom" style="margin-top: 5px">
									<%
										for (int i = 0; i < pictures.length; i++) {
									%>

									<div style="margin-left: 5px" class="pictures">
										<img alt="150*50" id="a<%=i%>" width="98px" height="85px"
											onclick="choose('<%=request.getContextPath()%>/image/<%=pictures[i]%>')"
											src="<%=request.getContextPath()%>/image/<%=pictures[i]%>">
									</div>

									<%
										}
									%>
								</div>

							</div>
							<div id="right" class="col-md-6 column">
								<div style="margin: 10px, auto, auto, 10px">
									<span class="spanStyle"><h5 style="font-weight: bold;">
											车名：<%=car.getName()%>
											车型：<%=car.getType()%>; 车牌：<%=car.getLicense()%>; 核载：<%=car.getRide()%>;
											载重：<%=car.getLoad()%>; 价格：<%=car.getPrice()%>/天
										</h5> </span>
								</div>


								<!-- 订单提交表单 -->
								<form
									action="<%=request.getContextPath()%>/com.jiange.servlet/OrderServlet?action=creatOrder&id=<%=car.getId()%>"
									method="post" >
									<div class="navbar navbar-default  ">
										<article>
										<div>
											<span class="marginLeft">借车时间：</span> <input type="text" class="marginLeft form-control"
												name="time_out" style="width: 200px"
												id="date-picker-input-1" readonly />
										</div>
										</article>
										<div style="margin: 20px 20px;">
											<span class="marginLeft">借车天数</span><br>
											<div style="float: left;">
												<span id="cut" onclick="cut(<%=car.getPrice()%>)"
													style="font-size: x-large; cursor: pointer;">-</span>
											</div>
											<div style="float: left;">
												<input id="days" type="text" class="form-control"
													name="days" style="width: 70px; text-align: right;"
													value="0" size="2" />
											</div>
											<div>
												<span id="add" onclick="add(<%=car.getPrice()%>)"
													style="font-size: x-large; cursor: pointer;">+</span>
											</div>
										</div>

										<div style="margin: 20px 20px;">
											<span class="marginLeft">预计总价(元)</span></br> <input type="text" class="marginLeft form-control"
												name="price" id="price"
												style="width: 70px; text-align: right;" value="0" readonly>
										</div>
										<div>
											<input class="btn btn-info btn-block" type="submit" id="submit" onclick="submit()">
										</div>
									</div>
								</form>

							</div>
						</div>

					</div>
					<div class="col-md-3 column">
						<!-- 利用cookie保存浏览记录并显示浏览记录 -->
						<%
							String list = "";
							Cookie[] cookies = request.getCookies();
							for (Cookie c : cookies) {
								if (URLDecoder.decode(c.getName(), "utf-8").equals("isCookie")) {
									list += URLDecoder.decode(c.getValue(), "utf-8");
								}
								list += request.getParameter("id") + ",";
							}
							String[] st = list.split(",");

							//如果cookie中存入的记录大于100个则，重置记录
							if (st.length > 100) {
								list = "";
							}

							Cookie cookie = new Cookie("isCookie", URLEncoder.encode(list, "utf-8"));
							response.addCookie(cookie);

							//创建数据库连接
							DaoFactory dao = new DaoFactory();
							dao.openConnection();
							CarDao carDao = dao.getCarDao();

							for (int i = st.length - 1; i >= 0 && i >= st.length - 6; i--) {
								Car carpass = carDao.selectCar(st[i]);
								String[] picture = carpass.getPicture().split(";");
						%>
						<div class="col-md-8">


							<div class="thumbnail" id="a<%=i%>"
								onmouseover="mouseover('a<%=i%>')"
								onmouseout="mouseout('a<%=i%>')">
								<a style="text-decoration: none"
									href="<%=request.getContextPath()%>/com.jiange.servlet/DetailServlet?id=<%=carpass.getId()%>">
									<%
										if (picture.length > 0) {
									%> <img width="100px" alt="300x200"
									src="<%=request.getContextPath()%>/image/<%=picture[0]%>" /> <%
										}
									%>
									<div class="caption">
										<h3>
											<%=carpass.getName()%>
										</h3>
										<p>
											车型：<%=carpass.getType()%><br /> 车牌：<%=carpass.getLicense()%><br />
											核载：<%=carpass.getRide()%><br /> 载重：<%=carpass.getLoad()%><br />
											价格：<%=carpass.getPrice()%>/天
										</p>

									</div>
								</a>
							</div>

						</div>
						<%
							}
						%>
					</div>
				</div>
				<div class="row clearfix">
					<div class="col-md-12 column"></div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="<%=request.getContextPath()%>/bootStrap/js/jquery-1.9.1.js"></script>
	<script
		src="<%=request.getContextPath()%>/bootStrap/js/jquery-ui-1.10.1.min.js"></script>
	<script>
		$(function() {
			$("#date-picker-input-1").datepicker({
				inline : true,
				showOtherMonths : true
			}).datepicker('widget').wrap('<div class="ll-skin-lugo"/>');
		});

		function add(s) {
			var num = parseInt(document.getElementById("days").value);
			if (num <= 1000) {
				document.getElementById("days").value = ++num;
			}
			document.getElementById("price").value = s*(num);
		}

		function cut(s) {
			var num = parseInt(document.getElementById("days").value);
			if (num > 1) {
				document.getElementById("days").value = --num;
			}
			document.getElementById("price").value = s*(num);
		}
	</script>

</body>

</html>