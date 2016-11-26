<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jiange.dao.DaoFactory" import="com.jiange.model.Car"
	import="com.jiange.dao.CarDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<script type="text/javascript">
//实现排行榜悬浮效果
var adverTop; //层距页面顶端距离
var adverObject; //层对象
var adverTop; //层距页面顶端距离
var adverObject; //层对象

	function inix() {
		var adverObject = document.getElementById("fly"); //获得层对象
		if (adverObject.currentStyle) {
			adverTop = parseInt(adverObject.currentStyle.top);
		} else {
			adverTop = parseInt(document.defaultView.getComputedStyle(
					adverObject, null).top);
		}
	}
	function move() {
		
		inix();
		var adverObject = document.getElementById("fly"); //获得层对象
		adverObject.style.top = window.pageYOffset+ "px";
	}

	window.onscroll = move;//不能写move（）
</script>

<head>
<style type="text/css">
#fly{
	position: absolute;
	top: 0px;
	right: 10px;
	z-index: 2;
}
body{ background-color: #272727; }
</style>
<!-- 引入排行榜样式 -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/ranking/normalize3.0.2.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/ranking/css.css?v=15" />

<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<span id="aaa"></span>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-12 column">

						<!-- 静态包含head页面，也就是将head里的标签移过来一起编译 -->
						<%@include file="/head.jsp"%>



					</div>
				</div>
				<div class="row clearfix">
					<div class="col-md-8 column" style="margin-top: 100px">
						<div class="row">
							<%
								ArrayList<Car> cars = (ArrayList<Car>) session.getAttribute("cars");
								Iterator<Car> iter = cars.iterator();

								if (iter != null) {
									while (iter.hasNext()) {
										Car car = iter.next();
										String[] picture = car.getPicture().split(";");
							%>
							<div class="col-md-4">
								<div class="thumbnail">
									<%
										if (picture.length > 0) {
									%>
									<img alt="300x200" style="width: 200px; height: 130px"
										src="/jiange/image/<%=picture[0]%>" />
									<%
										}
									%>
									<div class="caption">
										<h3>
											<strong> <%=car.getName()%></strong>
										</h3>
										<p>
											车型：<%=car.getType()%><br /> 车牌：<%=car.getLicense()%><br />
											核载：<%=car.getRide()%><br /> 载重：<%=car.getLoad()%><br /> 价格：<%=car.getPrice()%>/天
										</p>
										<p>
											<a class="btn btn-primary"
												href="${pageContext.request.contextPath }/com.jiange.servlet/DetailServlet?id=<%=car.getId()%>">详情</a>
											<a class="btn" href="#">租赁</a>
										</p>
									</div>
								</div>
							</div>

							<%
								}
								}
							%>

						</div>

						<ul class="pagination">
							<li><a
								href="${pageContext.request.contextPath }/com.jiange.servlet/CarServlet?limit=<%=Integer.parseInt(request.getParameter("limit")) - 10%>">Prev</a>
							</li>
							<li><a
								href="${pageContext.request.contextPath }/com.jiange.servlet/CarServlet?limit=0">1</a>
							</li>
							<li><a
								href="${pageContext.request.contextPath }/com.jiange.servlet/CarServlet?limit=10">2</a>
							</li>
							<li><a
								href="${pageContext.request.contextPath }/com.jiange.servlet/CarServlet?limit=10">3</a>
							</li>
							<li><a
								href="${pageContext.request.contextPath }/com.jiange.servlet/CarServlet?limit=10">4</a>
							</li>
							<li><a
								href="${pageContext.request.contextPath }/com.jiange.servlet/CarServlet?limit=10">5</a>
							</li>
							<li><a
								href="${pageContext.request.contextPath }/com.jiange.servlet/CarServlet?limit=<%=Integer.parseInt(request.getParameter("limit")) + 10%>">Next</a>
							</li>
						</ul>

					</div>
					<div class="col-md-4 column" style="margin-top: 100px;" id="fly">

						<section id="ranking" style="height: 500px">
							<span id="ranking_title">本月热门车辆排行</span>
							
							<section id="ranking_list">
								
								
								<section class="box">
									<section class="col_1" title="1">1</section>
									<section class="col_2">
										<img src="${pageContext.request.contextPath }/images/pic.jpg" />
									</section>
									<section class="col_3">${rankings[1].name }</section>
									<section class="col_4">${rankings[1].times }</section>
								</section>
								<section class="box">
									<section class="col_1" title="2">2</section>
									<section class="col_2">
										<img src="${pageContext.request.contextPath }/images/pic.jpg" />
									</section>
									<section class="col_3">${rankings[2].name }</section>
									<section class="col_4">${rankings[2].times }</section>
								</section>
								<section class="box cur">
									<section class="col_1" title="3">3</section>
									<section class="col_2">
										<img src="${pageContext.request.contextPath }/images/pic.jpg" />
									</section>
									<section class="col_3">${rankings[3].name }</section>
									<section class="col_4">${rankings[3].times }</section>
								</section>
								
								<!-- 循环打印排名4-10的车辆 -->
								<c:set var="num" value="3"></c:set>
								<c:forEach var="ranking" items="${rankings }" begin="3">
								<section class="box">
									<section class="col_1">${num+1 }</section>
									<c:set var="num" value="${num+1 }"></c:set>
									<section class="col_2">
										<img src="${pageContext.request.contextPath }/images/pic.jpg" />
									</section>
									<section class="col_3">${ranking.name}</section>
									<section class="col_4">${ranking.times }</section>
								</section>
								</c:forEach>
							</section>
							<a id="play_game" href="#" title="开始游戏">开始游戏</a>
						</section>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</html>