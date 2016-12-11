<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jiange.dao.DaoFactory"
	import="com.jiange.model.Order" import="com.jiange.dao.OrderDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

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
					ArrayList<Order> orders =(ArrayList<Order> )session.getAttribute("orders");
					Iterator<Order> iter = orders.iterator();
					int i = 0;
					if(iter != null){
						while(iter.hasNext()){
							i++;
							Order order = iter.next();
							
							//SimpleDateFormat设置date类型的显示格式
							SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					%>
				<tr class="info">
					<td><%=i %></td>
					<td><%=order.getId() %></td>
					<td><%=order.getUsername() %></td>
					<td><%=order.getCarName() %></td>
					<td><%=order.getLicense() %></td>
					<td><%=format.format(order.getTime_out())%></td>
					<td><%=order.getDays()%></td>
					<td><%=format.format(order.getTime_in())%></td>
					<td><%=order.getPre_cost()%></td>
					<%
							//判断实际还车时间是否为空，为空就不用format（），否则会空指针异常
							    if(order.getReal_time_in() ==null){
							%>
					<td>未还车</td>
					<%
							    }
							    else{
							%>
					<td><%=format.format(order.getReal_time_in())%></td>
					<%
							    }
							%>
					<td><%=order.getReal_cost()%></td>
					<td><a class="btn btn-primary"
						href="<%=request.getContextPath() %>/com.jiange.servlet/AlterOrderServlet?action=showOrder&id=<%=order.getId() %>">修改</a></td>
					<td><a class="btn"
						href="<%=request.getContextPath() %>/com.jiange.servlet/AlterOrderServlet?action=deleteOrder&id=<%=order.getId() %>">删除</a></td>
				</tr>
				<%}
						}%>
			</tbody>
		</table>
		<ul class="pagination">
			<li><a
				href="<%=request.getContextPath() %>/com.jiange.servlet/AlterOrderServlet?action=showOrders&limit=<%=Integer.parseInt(request.getParameter("limit"))-10 %>">prev</a>
			</li>
			<li><a
				href="<%=request.getContextPath() %>/com.jiange.servlet/AlterOrderServlet?action=showOrders&limit=0">1</a>
			</li>
			<li><a
				href="<%=request.getContextPath() %>/com.jiange.servlet/AlterOrderServlet?action=showOrders&limit=10">2</a>
			</li>
			<li><a
				href="<%=request.getContextPath() %>/com.jiange.servlet/AlterOrderServlet?action=showOrders&limit=0">3</a>
			</li>
			<li><a
				href="<%=request.getContextPath() %>/com.jiange.servlet/AlterOrderServlet?action=showOrders&limit=0">4</a>
			</li>
			<li><a
				href="<%=request.getContextPath() %>/com.jiange.servlet/AlterOrderServlet?action=showOrders&limit=0">5</a>
			</li>
			<li><a
				href="<%=request.getContextPath() %>/com.jiange.servlet/AlterOrderServlet?action=showOrders&limit=<%=Integer.parseInt(request.getParameter("limit"))+10 %>">next</a>
			</li>
		</ul>
	</div>
</div>