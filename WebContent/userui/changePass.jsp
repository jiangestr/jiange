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
		action="<%=request.getContextPath() %>/com.jiange.servlet/ChangePassWordServlet?action=changePassWord"
		method="post" onsubmit="return check('${currentUser.getPassword()}')">

		<div>
			<h3>修改密码</h3>
			<h6>
				<div class="form-group " style="width: 600px; margin-left: 200px">
					<label for="petName" class="col-sm-2 control-label ">旧密码：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="oldPassWord"
							name="oldPassWord" placeholder="" style="width: 200px" value=""
							onmousemove="checkOld()"> <span id="oldPassWordAlert"></span>
					</div>
				</div>
			</h6>
			<h6>
				<div class="form-group " style="width: 600px; margin-left: 200px">
					<label for="realName" class="col-sm-2 control-label">新密码：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="newPassWord"
							name="newPassWord" placeholder="密码由6~16位数字，英文字母，基本符号组成"
							style="width: 200px" value="" onmouseout="checkNew()"> <span
							id="newPassWordAlert"></span>
					</div>
				</div>
			</h6>
			<h6>
				<div class="form-group " style="width: 600px; margin-left: 200px">
					<label for="telphone" class="col-sm-2 control-label">确认密码：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="newPassword2"
							name="newPassword2" placeholder="" style="width: 200px" value=""
							onmouseout="checkNewTwo()"> <span id="newPassword2Alert"></span>
					</div>
				</div>
			</h6>
			<input type="submit" class="btn btn-warning btn-sm"
				style="width: 70px; background-color: orange; margin-left: 370px; margin-bottom: 40px"
				value="保存">
		</div>
	</form>
</body>
<script type="text/javascript">


	//提交表单前验证输入内容是否正确
	function check(oldpass){
		var oldP = document.getElementById("oldPassWord");
		var oldPA = document.getElementById("oldPassWordAlert");
		var	newP1 = document.getElementById("newPassWord");
		var newP1A = document.getElementById("newPassWordAlert");
		var newP2 = document.getElementById("newPassword2");
		var newP2A = document.getElementById("newPassword2Alert");
		
		
		if(oldP.value != oldpass){
			oldPA.textContent = "旧密码输入错误";
			oldP.value = null;
			return false;
		}
		else{
			oldPA.textContent = null;
			return false;
		}
		if(checkOld()&&checkNew()&&checkNewTwo()){
			return true;
		}
		else{
			return false;
		}
	}
	//验证旧密码是否为空
	function checkOld(){
		var oldP = document.getElementById("oldPassWord");
		var oldPA = document.getElementById("oldPassWordAlert");
		
		if(oldP.value == ""){
			oldPA.textContent = "请输入旧密码";
			return false;
		}
		else{
			oldPA.textContent= "";
			return true;
		}
	}
	//验证新密码是否为空
	function checkNew(){
		var	newP1 = document.getElementById("newPassWord");
		var newP1A = document.getElementById("newPassWordAlert");
		
		if(newP1.value == ""){
			newP1A.textContent = "请输入新密码";
			return false;
		}
		else{
			newP1A.textContent = "";
			return true;
		}
	}
	//验证第二次输入的密码是否为空，并且和第一个密码是否一样
	function checkNewTwo(){
		var	newP1 = document.getElementById("newPassWord");
		var newP1A = document.getElementById("newPassWordAlert");
		var newP2 = document.getElementById("newPassword2");
		var newP2A = document.getElementById("newPassword2Alert");
		
		if(newP1.value == ""){
			newP2A.textContent = "请输入新密码";
			return false;
		}
		
		
		if(newP1.value != newP2.value){
			newP2A.textContent = "两次输入密码不一致重新输入";
			newP1.value = null;
			newP2.value = null;
			return false;
		}
		else{
			newP2A.textContent = "";
			return true;
		}
	}
</script>
</html>