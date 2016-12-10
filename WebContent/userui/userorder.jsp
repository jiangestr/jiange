<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jiange.dao.DaoFactory"
	import="com.jiange.model.Order" import="com.jiange.dao.OrderDao"%>
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
.ucoscfr-order {
	margin: 0 10px;
	text-align: center;
	width: 100%;
	font-size: 13px;
	border-left: 1px #f1f1f1 solid;
	border-right: 1px #f1f1f1 solid;
}
</style>
</head>
<body>
	<div style="margin-top: 20px;">
		<span class="label label-default" style="font-size: x-large;">订单详情</span>
		<div class="tabbable" id="tabs-233893" style="margin-top: 50px;">
			<ul class="nav nav-tabs" style="margin-left: 10px">
				<li class="active"><a href="#panel-543668" data-toggle="tab">全部订单</a></li>
				<li ><a href="#panel-993654" data-toggle="tab">未还车订单</a></li>
				<li ><a href="#panel-223777" data-toggle="tab">已完成订单</a></li>
			</ul>
			<div class="tab-content">

				<!-- 第一个选项卡 -->
				<div class="tab-pane active" id="panel-543668">
					<table class="table table-hover table-bordered">
						<thead>
							<tr>
								<th>编号</th>
								<th>用户</th>
								<th>车名</th>
								<th>牌照</th>
								<th>出车时间</th>
								<th>租用天数</th>
								<th>预计还车时间</th>
								<th>预计价格</th>
								<th>实际还车时间</th>
								<th>实际价格</th>
							</tr>
						</thead>
						<tbody>
							<%
								ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("allOrders");
								Iterator<Order> iter = orders.iterator();
								int i = 0;
								if (iter != null) {
									while (iter.hasNext()) {
										i++;
										Order order = iter.next();

										//SimpleDateFormat设置date类型的显示格式
										SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
							%>
							<tr class="info">
								<td><%=i%></td>
								<td><%=order.getUsername()%></td>
								<td><%=order.getCarName()%></td>
								<td><%=order.getLicense()%></td>
								<td><%=format.format(order.getTime_out())%></td>
								<td><%=order.getDays()%></td>
								<td><%=format.format(order.getTime_in())%></td>
								<td><%=order.getPre_cost()%></td>
								<%
									//判断实际还车时间是否为空，为空就不用format（），否则会空指针异常
											if (order.getReal_time_in() == null) {
								%>
								<td>未还车</td>
								<%
									} else {
								%>
								<td><%=format.format(order.getReal_time_in())%></td>
								<%
									}
								%>
								<td><%=order.getReal_cost()%></td>
							</tr>
							<%
								}
								}
							%>
						</tbody>
					</table>
				</div>

				<!-- 第二个选项卡 -->
				<div class="tab-pane " id="panel-993654">
					<table class="table table-hover table-bordered">
						<thead>
							<tr>
								<th>编号</th>
								<th>用户</th>
								<th>车名</th>
								<th>牌照</th>
								<th>出车时间</th>
								<th>租用天数</th>
								<th>预计还车时间</th>
								<th>预计价格</th>
								<th>实际还车时间</th>
								<th>实际价格</th>
							</tr>
						</thead>
						<tbody>
							<%
								ArrayList<Order> orderss = (ArrayList<Order>) request.getAttribute("allOrders");
								Iterator<Order> iters = orderss.iterator();
								int t = 0;//编号
								if (iter != null) {
									while (iters.hasNext()) {
										
										Order order = iters.next();

										//SimpleDateFormat设置date类型的显示格式
										SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
										
										//显示未还车的车辆
										if(order.getReal_time_in() == null){
											t++;
							%>
							<tr class="info">
								<td><%=t%></td>
								<td><%=order.getUsername()%></td>
								<td><%=order.getCarName()%></td>
								<td><%=order.getLicense()%></td>
								<td><%=format.format(order.getTime_out())%></td>
								<td><%=order.getDays()%></td>
								<td><%=format.format(order.getTime_in())%></td>
								<td><%=order.getPre_cost()%></td>
								<td>未还车</td>
								<td><%=order.getReal_cost()%></td>
							</tr>
							<%
										}
								}
								}
							%>
						</tbody>
					</table>
				</div>

				<!-- 第三个选项卡 -->
				<div class="tab-pane " id="panel-223777">
					<table class="table table-hover table-bordered">
						<thead>
							<tr>
								<th>编号</th>
								<th>用户</th>
								<th>车名</th>
								<th>牌照</th>
								<th>出车时间</th>
								<th>租用天数</th>
								<th>预计还车时间</th>
								<th>预计价格</th>
								<th>实际还车时间</th>
								<th>实际价格</th>
							</tr>
						</thead>
						<tbody>
							<%
								Iterator<Order> iterss = orderss.iterator();
								int m = 0;//编号
								if (iter != null) {
									while (iterss.hasNext()) {
										
										Order order = iterss.next();

										//SimpleDateFormat设置date类型的显示格式
										SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
										
										//显示已还车的订单
										if(order.getReal_time_in() != null){
											m++;
							%>
							<tr class="info">
								<td><%=m%></td>
								<td><%=order.getUsername()%></td>
								<td><%=order.getCarName()%></td>
								<td><%=order.getLicense()%></td>
								<td><%=format.format(order.getTime_out())%></td>
								<td><%=order.getDays()%></td>
								<td><%=format.format(order.getTime_in())%></td>
								<td><%=order.getPre_cost()%></td>
								<td><%=format.format(order.getReal_time_in())%></td>
								<td><%=order.getReal_cost()%></td>
								<td><a class="btn  btn-warning" href="${pageContext.request.contextPath }/com.jiange.servlet/EvaluateServlet?action=showPage&orderId=<%=order.getId()%>">评价</a></td>
							</tr>
							<%
										}
								}
								}
							%>
						</tbody>
				</div>
			</div>
		</div>
	</div>
</body>
</html>