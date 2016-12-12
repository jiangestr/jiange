<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.jiange.model.User"%>
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
span {
	color: red;
}
</style>
<title>Insert title here</title>
</head>
<body>

	<form class="form-horizontal" role="form"
		action="<%=request.getContextPath() %>/com.jiange.servlet/EvaluateServlet?action=insert&orderId=<%=request.getParameter("orderId") %>"
		method="post">

		<div>
			<h3>填写评价</h3>
			<input type="hidden" value="${id }">
			<h6>
				<div class="form-group">
					<label for="name">文本框</label>
					<textarea class="form-control" rows="3" name="context"><%=request.getParameter("orderId") %></textarea>
				</div>
			</h6>

			<input type="submit" class="btn btn-warning btn-sm"
				style="width: 70px; background-color: orange; margin-left: 370px; margin-bottom: 40px"
				value="保存">
		</div>
	</form>



</body>

</html>