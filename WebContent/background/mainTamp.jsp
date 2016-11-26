<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<%
	String mainPage=(String)request.getAttribute("mainPage");
	if(mainPage==null || mainPage.equals("")){
		mainPage="result/success.jsp";
	}
%>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-12 column">
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-1 column">
				</div>
				<div class="col-md-3 column">
					<div class="list-group">
						 <a href="#" class="list-group-item active">首页</a>
						 
						<div class="list-group-item">
							<h4 class="list-group-item-heading">
								<strong>车辆管理</strong>
							</h4>
						</div>
						<div class="list-group-item">
							&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/com.jiange.servlet/AlertCarServlet?action=showCars&limit=0"><span>车辆修改</span></a>
						</div>
						<div class="list-group-item">
							&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/com.jiange.servlet/AlertCarServlet?action=showadd"><span>车辆添加</span></a>
						</div>
						
						<div class="list-group-item">
							<h4 class="list-group-item-heading">
								<strong>订单管理</strong>
							</h4>
						</div>
						<div class="list-group-item">
							&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/com.jiange.servlet/AlterOrderServlet?action=showOrders&limit=0"><span>订单修改</span></a>
						</div>
						
						
						<div class="list-group-item">
							<h4 class="list-group-item-heading">
								<strong>评价管理</strong>
							</h4>
						</div>
						<div class="list-group-item">
							&nbsp;&nbsp;<span>评价修改</span>
						</div>
						
						
						
						<div class="list-group-item">
							 <span class="badge">14</span> Help
						</div> <a class="list-group-item active"> <span class="badge">14</span> Help</a>
					</div>
				</div>
				<div class="col-md-8 column">
					<jsp:include page="<%=mainPage %>"></jsp:include>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>