<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.jiange.model.Car"%>
<%@page import="com.jiange.model.Order"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Insert title here</title>
<style type="text/css">
.divHeigt {
	background-color: white;
}

.margin {
	margin: 40px auto auto 0px;
}

.float {
	float: left;
}

.lightblue {
	background-color: #e4f2fa;
	text-align: center;
	width: 100px;
}

.text1 {
	line-height: 30px !important;
	font-size: 18px !important;
	font-weight: bolder !important;
}

.text2 {
	font-size: 14px !important;
	font-weight: normal;
	color: #61a1df !important;
}

.x-block-tit {
	height: 28px;
	line-height: 28px;
	padding: 10px 5px 10px;
}

.x-block-tit .tith1 {
	font-size: 16px;
	color: #fbce00;
	border-bottom: 2px solid #fbce00;
	width: 70px;
	text-align: center;
}

.x-block-main {
	padding: 5px 15px;
	margin-top: 20px;
	width: 100%;
}

.color {
	background: #f4f7fc !important;
	height: 200px;
}

h2, .x-h2 {
	font-size: 20px !important;
	font-weight: normal;
	color: #ef8201 !important;
}

.text3 {
	text-align: right;
}

.max-h1 {
	font-size: 30px;
	font-weight: normal;
	color: #ef8201 !important;
}

.width1 {
	width: 200px;
}

body {
	
}
</style>
</head>
<body>
	<% 
					Car car = (Car)request.getSession().getAttribute("car");
				    Order order = (Order)request.getSession().getAttribute("order");
				    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				    String[] pictures = car.getPicture().split(";");
				    String picture = null;
				    if(pictures.length > 0){
				    picture = pictures[0];
				    System.out.print(picture);
				    }
				    
					%>
	<%-- <table class="table table-hover table-bordered">
		<thead>
			<tr>
				<th>用户</th>
				<th>车名</th>
				<th>型号</th>
				<th>牌照</th>
				<th>出车时间</th>
				<th>租用天数</th>
				<th>预计还车时间</th>
				<th>预计价格</th>


			</tr>
		</thead>
		<tbody>
			<% 
					Car car = (Car)request.getSession().getAttribute("car");
				    Order order = (Order)request.getSession().getAttribute("order");
				    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				    
					%>
			<tr class="info">
				<td><%=order.getUsername() %></td>
				<td><%=car.getName() %></td>
				<td><%=car.getType() %></td>
				<td><%=car.getLicense() %></td>
				<td><%=dateFormat.format(order.getTime_out()) %></td>
				<td><%=order.getDays() %></td>
				<td><%=dateFormat.format(order.getTime_in()) %></td>
				<td><%=order.getPre_cost() %></td>
			</tr>
			<tr>
				<td colspan="8"><a class="btn btn-primary"
					href="<%=request.getContextPath() %>/com.jiange.servlet/OrderServlet?action=addOrder">确认订单</a></td>
			</tr>
		</tbody>
	</table> --%>
	<div class="row clearfix">
		<div class="col-md-12 column" style="height: 80px;">
			<img alt="140x140" style="margin-left: 100px" width="200px"
				height="100px" src="/jiange/image/head.jpg" />
		</div>
	</div>

	<div class="col-md-12 column " style="background-color: #d8d9dd;">
		<div class="container ">


			<div class="col-md-12 column margin divHeigt">
				<div class="row clearfix  margin">
					<div>
						<div>
							<div class="x-block-tit">
								<div class="tith1">预定信息</div>
							</div>
							<table class="table table-bordered x-block-main">
								<tr>
									<td rowspan="5" width="400px" height="250px;">
										<div>
											<img width="300px" height="185px" alt=""
												src="${pageContext.request.contextPath }/image/<%=picture%>">
										</div>
										<div class="text1">${car.name }&nbsp;${car.license }</div>
										<div class="text2">${car.type }/${car.load }/${car.ride }</div>
									</td>
									<td class="lightblue">取车时间</td>
									<td><%=dateFormat.format(order.getTime_out())%></td>
								</tr>
								<tr>
									<td class="lightblue">还车时间</td>
									<td><%=dateFormat.format(order.getTime_in()) %></td>
								</tr>
								<tr>
									<td class="lightblue">取车地点</td>
									<td>周庄大学路一号</td>
								</tr>
								<tr>
									<td class="lightblue">还车地点</td>
									<td>周庄大学路一号</td>
								</tr>
								<tr>
									<td class="lightblue">订单说明</td>
									<td>超过天数按${car.price}/天算</td>
								</tr>

							</table>
						</div>
					</div>
					<div class="color">
						<div class="x-block-tit">
							<div class="tith1">用车信息</div>
						</div>
						<div class="input-group x-block-main">
							<span class="input-group-btn">
								<button class="btn " type="button" disabled="disabled">用车人姓名</button>
							</span> <input type="text" class="form-control width1" width="200px">
						</div>
						<div class="input-group x-block-main">
							<span class="input-group-btn">
								<button class="btn " type="button" disabled="disabled">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;证件&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
							</span> <input type="text" class="form-control width1" width="200px">
						</div>
						<!-- /input-group -->
					</div>
					<div>
						<div class="x-block-tit">
							<div class="tith1">费用明细</div>
						</div>
						<table class="table  x-block-main">
							<tr>
								<td>费用名称</td>
								<td>说明</td>
								<td class="text3">小计</td>
							</tr>
							<tr>
								<td>手续费</td>
								<td>30元/次，共1次</td>
								<td class="x-h2 text3">￥30</td>
							</tr>
							<tr>
								<td>基本保险金额</td>
								<td>均价30元</td>
								<td class="x-h2 text3">￥30</td>
							</tr>
							<tr>
								<td>车辆租金</td>
								<td>均价${car.price }/天，共${order.days }</td>
								<td class="x-h2 text3">￥${order.pre_cost }</td>
							</tr>
						</table>
					</div>
					<div>
						<div class="x-block-tit">
							<div class="tith1">订单总额</div>
						</div>
						<div class=" x-block-main text3">
							<span>订单总额：</span><span class=" x-h2">￥</span><span
								class=" max-h1">${order["pre_cost"]+30+30 }</span>
							&nbsp;&nbsp;&nbsp; <a class="btn  btn-warning"
								href="${pageContext.request.contextPath }/com.jiange.servlet/OrderServlet?action=addOrder">确认订单</a>
						</div>
					</div>
				</div>
			</div>
			<!-- 页尾 -->
			<div class="row clearfix">
				<div class="col-md-12 column"></div>
			</div>
		</div>
	</div>
</body>
</html>