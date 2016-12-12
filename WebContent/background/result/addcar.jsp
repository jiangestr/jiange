<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<form
	action="<%=request.getContextPath() %>/com.jiange.servlet/AlertCarServlet?action=addCar"
	method="post">
	<table class="table table-hover table-bordered">

		<%request.setCharacterEncoding("utf-8") ;
				response.setCharacterEncoding("utf-8");
		%>

		<tr class="info">
			<td>名字</td>
			<td><input type="text" class="form-control" name="name" value="" /></td>
		</tr>
		<tr class="info">
			<td>型号</td>
			<td><input type="text" class="form-control" name="type" value="" /></td>
		</tr>
		<tr class="info">
			<td>牌照</td>
			<td><input type="text" class="form-control" name="license"
				value="" /></td>
		</tr>
		<tr class="info">
			<td>载人</td>
			<td><input type="text" class="form-control" name="ride" value="" /></td>
		</tr>
		<tr class="info">
			<td>载重</td>
			<td><input type="text" class="form-control" name="load" value="" /></td>
		</tr>
		<tr class="info">
			<td>价格</td>
			<td><input type="text" class="form-control" name="price"
				value="" /></td>
		</tr>
		<tr class="info">
			<td>图片地址（;号隔开）</td>
			<td><input type="text" class="form-control" name="picture"
				value="" /></td>
		</tr>
		<tr class="info">
			<td colspan="2"><input type="submit" class="form-control"
				value="添加车辆"></td>
		</tr>

	</table>
</form>