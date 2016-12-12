<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jiange.dao.DaoFactory" import="com.jiange.model.Car"
	import="com.jiange.dao.CarDao"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
<div class="row clearfix">
	<div class="col-md-12 column">
		<table class="table table-hover table-bordered">
			<thead>
				<tr>
					<th>编号</th>
					<th>id</th>
					<th>名字</th>
					<th>型号</th>
					<th>牌照</th>
					<th>载人</th>
					<th>载重</th>
					<th>价格</th>
					<th>图片地址（;号隔开）</th>


				</tr>
			</thead>
			<tbody>
				<% 
					ArrayList<Car> cars =(ArrayList<Car> )session.getAttribute("cars");
					Iterator<Car> iter = cars.iterator();
					int i = 0;
					if(iter != null){
						while(iter.hasNext()){
							i++;
							Car car = iter.next();
					%>
				<tr class="info">
					<td><%=i %></td>
					<td><%=car.getId() %></td>
					<td><%=car.getName() %></td>
					<td><%=car.getType() %></td>
					<td><%=car.getLicense() %></td>
					<td><%=car.getRide() %></td>
					<td><%=car.getLoad() %></td>
					<td><%=car.getPrice() %></td>
					<td><%=car.getPicture()%></td>
					<td><a class="btn btn-primary"
						href="<%=request.getContextPath() %>/com.jiange.servlet/AlertCarServlet?action=showCar&id=<%=car.getId() %>">修改</a></td>
					<td><a class="btn"
						href="<%=request.getContextPath() %>/com.jiange.servlet/AlertCarServlet?action=deleteCar&id=<%=car.getId() %>">删除</a></td>
				</tr>
				<%}
						}%>
			</tbody>
		</table>
		<ul class="pagination">
			<li><a
				href="<%=request.getContextPath() %>/com.jiange.servlet/AlertCarServlet?action=showCars&limit=<%=Integer.parseInt(request.getParameter("limit"))-10 %>">prev</a>
			</li>
			<li><a
				href="<%=request.getContextPath() %>/com.jiange.servlet/AlertCarServlet?action=showCars&limit=0">1</a>
			</li>
			<li><a
				href="<%=request.getContextPath() %>/com.jiange.servlet/AlertCarServlet?action=showCars&limit=10">2</a>
			</li>
			<li><a
				href="<%=request.getContextPath() %>/com.jiange.servlet/AlertCarServlet?action=showCars&limit=0">3</a>
			</li>
			<li><a
				href="<%=request.getContextPath() %>/com.jiange.servlet/AlertCarServlet?action=showCars&limit=0">4</a>
			</li>
			<li><a
				href="<%=request.getContextPath() %>/com.jiange.servlet/AlertCarServlet?action=showCars&limit=0">5</a>
			</li>
			<li><a
				href="<%=request.getContextPath() %>/com.jiange.servlet/AlertCarServlet?action=showCars&limit=<%=Integer.parseInt(request.getParameter("limit"))+10 %>">next</a>
			</li>
		</ul>
	</div>
</div>