<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="com.jiange.model.Car"%>
    <%@page import="com.jiange.model.Order"%>
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

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-hover table-bordered">
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
					<td><%=car.getPrice() %></td>
				</tr>
				<tr>
					<td colspan="8"><a class="btn btn-primary" href="<%=request.getContextPath() %>/com.jiange.servlet/OrderServlet?action=addOrder">确认订单</a></td>
				</tr>
			</tbody>
		</table>
</body>
</html>