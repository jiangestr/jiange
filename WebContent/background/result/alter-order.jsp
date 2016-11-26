<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"
	import="com.jiange.model.Order"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<form
	action="<%=request.getContextPath()%>/com.jiange.servlet/AlterOrderServlet?action=updateOrder"
	method="post">
	<table class="table table-hover table-bordered">

		<%
			//SimpleDateFormat设置date类型的显示格式
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

			Order order = (Order) request.getAttribute("order");
		%>
		<tr class="info">
			<td>id</td>
			<td><input type="text" class="form-control" name="id"
				value="${order.id}" /></td>
		</tr>
		<tr class="info">
			<td>用户</td>
			<td><input type="text" class="form-control" name="username"
				value="${order.username} " /></td>
		</tr>
		<tr class="info">
			<td>车名</td>
			<td><input type="text" class="form-control" name="carName"
				value="${order.carName} " /></td>
		</tr>
		<tr class="info">
			<td>牌照</td>
			<td><input type="text" class="form-control" name="license"
				value="${order.license} " /></td>
		</tr>
		<tr class="info">
			<td>出车时间</td>
			<td><input type="text" class="form-control" name="time_out"
				value="<%=format.format(order.getTime_out())%>" /></td>
		</tr>
		<tr class="info">
			<td>租用天数</td>
			<td><input type="text" class="form-control" name="days"
				value="${order.days}" /></td>
		</tr>
		<tr class="info">
			<td>预计还车时间</td>
			<td><input type="text" class="form-control" name="time_in"
				value="<%=format.format(order.getTime_in())%>" /></td>
		</tr>
		<tr class="info">
			<td>预计价格</td>
			<td><input type="text" class="form-control" name="pre_cost"
				value="${order.pre_cost }" /></td>
		</tr>
		<tr class="info">
			<td>实际还车时间</td>
			<%
				//判断实际还车时间是否为空，为空就不用format（），否则会空指针异常
				if (order.getReal_time_in() == null) {
			%>
			<td><input type="text" class="form-control" name="real_time_in"
				value="未还车" /></td>
			<%
				} else {
			%>
			<td><input type="text" class="form-control" name="real_time_in"
				value="<%=format.format(order.getReal_time_in())%>" /></td>

			<%
				}
			%>
		</tr>
		<tr class="info">
			<td>实际价格</td>
			<td><input type="text" class="form-control" name="real_cost"
				value="${order.real_cost }" /></td>
		</tr>
		<tr class="info">
			<td colspan="2"><input type="submit" class="form-control"
				value="提交修改"></td>
		</tr>

	</table>
</form>
