<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.jiange.dao.DaoFactory" import="com.jiange.model.Car"
	import="com.jiange.dao.CarDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<form action="<%=request.getContextPath() %>/com.jiange.servlet/AlertCarServlet?action=updateCar" method="post">
	<table class="table table-hover table-bordered">
		<%
		Car car = (Car) request.getSession().getAttribute("car");
		%>
		
		<tr class="info" >
			<td>id</td>
			<td><input type="text" class="form-control" name="id" value="<%=car.getId() %>" /></td>
		</tr>
		<tr class="info">
			<td>名字</td>
			<td><input type="text" class="form-control" name="name" value="<%=car.getName() %>"/></td>
		</tr>
		<tr class="info">
			<td>型号</td>
			<td><input type="text" class="form-control" name="type" value="<%=car.getType() %>" /></td>
		</tr>
		<tr class="info">
			<td>牌照</td>
			<td><input type="text" class="form-control" name="license" value="<%=car.getLicense() %>" /></td>
		</tr>
		<tr class="info">
			<td>载人</td>
			<td><input type="text" class="form-control" name="ride" value="<%=car.getRide() %>" /></td>
		</tr>
		<tr class="info">
			<td>载重</td>
			<td><input type="text" class="form-control" name="load" value="<%=car.getLoad() %>" /></td>
		</tr>
		<tr class="info">
			<td>价格</td>
			<td><input type="text" class="form-control" name="price" value="<%=car.getPrice() %>" /></td>
		</tr>
		<tr class="info">
			<td>图片地址（;号隔开）</td>
			<td><input type="text" class="form-control" name="picture" value="<%=car.getPicture()%>" /></td>
		</tr>
		<tr class="info">
			<td colspan="2"><input type="submit" class="form-control" value="提交修改"></td>
		</tr>
		
	</table>
</form>
