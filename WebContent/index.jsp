<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>





<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">



<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<style type="text/css">
.show {
	float: left;
	height: 280px;
	width: 380px;
	margin: 10px 5px;
	
}

a>div {
	height: 60px;
	background-color: black;
	margin-bottom: 2px;
	opacity: 0.7;
	margin-top: 220px;
}
</style>
<title>Insert title here</title>
</head>
<body>

	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-12 column">

					<!-- 静态包含head页面，也就是将head里的标签移过来一起编译 -->
					<%@include file="/head.jsp"%>



				</div>
			</div>
			<div class="row clearfix" style="margin-top: 70px">
				<div class="col-md-12 column">

					<div class="carousel slide" id="carousel-904594">
						<ol class="carousel-indicators">
							<li data-slide-to="0" data-target="#carousel-904594"></li>
							<li data-slide-to="1" data-target="#carousel-904594"></li>
							<li data-slide-to="2" data-target="#carousel-904594"
								class="active"></li>
						</ol>
						<div class="carousel-inner">
							<div class="item">
								<img alt="" src="<%=request.getContextPath() %>/image/show1.jpg" />
								<div class="carousel-caption">
									<h4>First Thumbnail label</h4>
									<p>Cras justo odio, dapibus ac facilisis in, egestas eget
										quam. Donec id elit non mi porta gravida at eget metus. Nullam
										id dolor id nibh ultricies vehicula ut id elit.</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="<%=request.getContextPath() %>/image/show2.jpg" />
								<div class="carousel-caption">
									<h4>Second Thumbnail label</h4>
									<p>Cras justo odio, dapibus ac facilisis in, egestas eget
										quam. Donec id elit non mi porta gravida at eget metus. Nullam
										id dolor id nibh ultricies vehicula ut id elit.</p>
								</div>
							</div>
							<div class="item active">
								<img alt="" src="<%=request.getContextPath() %>/image/show3.jpg" />
								<div class="carousel-caption">
									<h4>Third Thumbnail label</h4>
									<p>Cras justo odio, dapibus ac facilisis in, egestas eget
										quam. Donec id elit non mi porta gravida at eget metus. Nullam
										id dolor id nibh ultricies vehicula ut id elit.</p>
								</div>
							</div>
						</div>
						<a class="left carousel-control" href="#carousel-904594"
							data-slide="prev"><span
							class="glyphicon glyphicon-chevron-left"></span></a> <a
							class="right carousel-control" href="#carousel-904594"
							data-slide="next"><span
							class="glyphicon glyphicon-chevron-right"></span></a>
					</div>

				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-12 column" style="margin: 10px 5px;">
					<div class="" style="text-align: center; height: 800px">
						<h2 id="ye" style="color: #FFD700;">
							<strong>优惠车型大搜罗</strong>
						</h2>
						<h3>每天，特价，劲爆优惠天天推荐，值得你关注</h3>
						<div style="margin: 20px 80px">
							<div id="show1" class="show"
								style="background-image: url('image/3.jpg'); background-size: 100% 100%;">
								<a
									href="<%=request.getContextPath()%>/com.jiange.servlet/DetailServlet?id=8"><img
									style="display: none;" id="index1" class="index"
									src="${pageContext.request.contextPath }/image/index03.png">
									<div id="inf1">威震天</div> </a>
							</div>
							<div id="show2" class="show"
								style="background-image: url('image/login.jpg'); background-size: 100% 100%;">
								<a
									href="<%=request.getContextPath()%>/com.jiange.servlet/DetailServlet?id=8"><img
									style="display: none;" id="index2" class="index"
									src="${pageContext.request.contextPath }/image/index03.png">
									<div id="inf2"></div> </a>
							</div>
							<div id="show3" class="show"
								style="background-image: url('image/2.jpg'); background-size: 100% 100%;">
								<a
									href="<%=request.getContextPath()%>/com.jiange.servlet/DetailServlet?id=8">
									<img style="display: none;" id="index3" class="index"
									src="${pageContext.request.contextPath }/image/index03.png">
									<div id="inf3"></div>
								</a>
							</div>
							<div id="show4" class="show"
								style="background-image: url('image/3.jpg'); background-size: 100% 100%;">
								<a
									href="<%=request.getContextPath()%>/com.jiange.servlet/DetailServlet?id=8"><img
									style="display: none;" id="index4" class="index"
									src="${pageContext.request.contextPath }/image/index03.png">
									<div id="inf4"></div></a>
							</div>
							<div id="show5" class="show"
								style="background-image: url('image/login.jpg'); background-size: 100% 100%;">
								<a
									href="<%=request.getContextPath()%>/com.jiange.servlet/DetailServlet?id=8"><img
									style="display: none;" id="index5" class="index"
									src="${pageContext.request.contextPath }/image/index03.png">
									<div id="inf5"></div></a>
							</div>
							<div id="show6" class="show"
								style="background-image: url('image/2.jpg'); background-size: 100% 100%;">
								<a
									href="<%=request.getContextPath()%>/com.jiange.servlet/DetailServlet?id=8"><img
									style="display: none;" id="index6" class="index"
									src="${pageContext.request.contextPath }/image/index03.png">
									<div id="inf6"></div></a>
							</div>


						</div>
					</div>
				</div>
			</div>
			<div>

				<jsp:include page="roll.jsp"></jsp:include>


			</div>
		</div>
	</div>
</body>

<script>
	//显示、影藏藏信息。
	$(document).ready(function() {
		//1
		$("#show1").mouseenter(function() {
			$("#index1").show();
			$("#inf1").hide();
		});
		$("#show1").mouseleave(function() {
			$("#index1").hide();
			$("#inf1").show();
		});

		//2
		$("#show2").mouseenter(function() {
			$("#index2").show();
			$("#inf2").hide();
		});
		$("#show2").mouseleave(function() {
			$("#index2").hide();
			$("#inf2").show();
		});

		//3
		$("#show3").mouseenter(function() {
			$("#index3").show();
			$("#inf3").hide();
		});
		$("#show3").mouseleave(function() {
			$("#index3").hide();
			$("#inf3").show();
		});

		//4
		$("#show4").mouseenter(function() {
			$("#index4").show();
			$("#inf4").hide();
		});
		$("#show4").mouseleave(function() {
			$("#index4").hide();
			$("#inf4").show();
		});

		//5
		$("#show5").mouseenter(function() {
			$("#index5").show();
			$("#inf5").hide();
		});
		$("#show5").mouseleave(function() {
			$("#index5").hide();
			$("#inf5").show();
		});

		//6
		$("#show6").mouseenter(function() {
			$("#index6").show();
			$("#inf6").hide();
		});
		$("#show6").mouseleave(function() {
			$("#index6").hide();
			$("#inf6").show();
		});
	});
</script>

</html>