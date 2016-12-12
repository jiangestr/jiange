<%@page import="java.net.URLDecoder"%>
<%@page import="com.jiange.model.User"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

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

<style type="text/css">
h6 {
	padding: 5px 0;
	line-height: 26px;
	font-size: 12px;
	color: #666;
	line-height: 30px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%	//根据用户名找到存储在本地的cookie，从中提取用户信息，用户信息的内容用“，”隔开。
	Cookie[] cookies = request.getCookies();
	String userInf = "";
	for(Cookie c : cookies){
		if(URLDecoder.decode(c.getName(), "utf-8").equals(((User)session.getAttribute("currentUser")).getUsername())){
			userInf = URLDecoder.decode(c.getValue(), "utf-8");
		}
	}
	
	//为了防止用户信息没填导致，数组下标越界，设置长度为6的数组存储用户信息
	String[] list = userInf.split(",");
	String[] s = new String[7];
	
	int i = 0;
	for(String ss:list){
		s[i] = ss;
		i++;
	}
	%>
	<form class="form-horizontal" role="form"
		action="<%=request.getContextPath() %>/com.jiange.servlet/UserInfServlet?action=changeInf"
		method="post">

		<div>
			<h3>我的基本信息</h3>
			<h6>
				<div class="form-group " style="width: 600px; margin-left: 200px">
					<label for="petName" class="col-sm-2 control-label ">昵称：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="petName"
							placeholder="" style="width: 200px" value="<%=s[1]%>">
					</div>
				</div>
			</h6>
			<h6>
				<div class="form-group " style="width: 600px; margin-left: 200px">
					<label for="realName" class="col-sm-2 control-label">真实姓名：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="realName"
							placeholder="" style="width: 200px" value="<%=s[2]%>">
					</div>
				</div>
			</h6>
			<h6>
				<div class="form-group " style="width: 600px; margin-left: 200px">
					<label for="telphone" class="col-sm-2 control-label">电话：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="telphone"
							placeholder="" style="width: 200px" value="<%=s[3]%>">
					</div>
				</div>
			</h6>
			<h6>
				<div class="form-group " style="width: 600px; margin-left: 200px">
					<label for="ID" class="col-sm-2 control-label">证件：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="ID" placeholder=""
							style="width: 200px" value="<%=s[4]%>">
					</div>
				</div>
			</h6>
			<hr>
		</div>
		<h3>驾驶信息</h3>
		<div>
			<h6>
				<div class="form-group " style="width: 600px; margin-left: 200px">
					<label for="drivingID" class="col-sm-2 control-label">驾驶证号：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="drivingID"
							placeholder="" style="width: 200px" value="<%=s[5]%>">
					</div>
				</div>
			</h6>
			<h6>
				<div class="form-group " style="width: 600px; margin-left: 200px">
					<label for="carType" class="col-sm-2 control-label">准驾车型：</label>
					<div class="col-sm-10">
						<select class="form-control" name="carType" style="width: 200px">
							<option selected="selected"><%=s[6]%></option>
							<option>C2</option>
							<option>C1</option>
							<option>B2</option>
							<option>B1</option>
							<option>A1</option>
						</select>
					</div>
				</div>
			</h6>
		</div>
		<input type="submit" class="btn btn-warning btn-sm"
			style="width: 70px; background-color: orange; margin-left: 370px; margin-bottom: 40px"
			value="保存">
	</form>
</body>
</html>