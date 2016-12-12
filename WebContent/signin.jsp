<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

<!-- javascript代码 -->
<script type="text/javascript">
	
	function check(){
		
		if(checkPassFi() && checkPassSe() &&checkUsername()){
			return true;
		}
		else{
			return false;
		}
	}
	
	function checkUsername(){
		var username = document.getElementById("username");
		var userPro = document.getElementById("userPro");
		if(username.value == ""){
			userPro.textContent = "请输入用户名";
			return false;
		}
		else{
			userPro.textContent = null;
			return true;
		}
	}
	
	function checkPassFi(){
		var passProFi = document.getElementById("passProFi");
		var passwordFi = document.getElementById("passwordFi");
		
		if(passwordFi.value == ""){
			passProFi.textContent = "请输入密码";
			return false;
		}
		else{
			passProFi.textContent = null;
			return true;
		}
	}
	
	function checkPassSe(){
		var passProSe = document.getElementById("passProSe");
		var passwordSe = document.getElementById("passwordSe");
		var passwordFi = document.getElementById("passwordFi");
		if(passwordSe.value == ""){
			passProSe.textContent = "请输入确认密码";
			return false;
		}
		else if(passwordFi.value != passwordSe.value && passwordSe.value!= null){
			passProSe.textContent = "两次密码不一致";
			return false;
		}
		else{
			passProSe.textContent = null;
			return true;
		}
	}
	
</script>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column"></div>
		</div>
		<div class="row clearfix">
			<div class="col-md-12 column">
				<form role="form" method="post"
					action="<%=request.getContextPath() %>/com.jiange.servlet/SignUpServlet"
					onsubmit="return check()">
					<div class="form-group">
						<label for="exampleInputEmail1">请输入邮箱</label><input
							style="width: 240px" type="email" class="form-control"
							id="username" name="username" onmouseout="checkUsername()" /> <span
							id="userPro"></span>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">请输入密码</label><input
							style="width: 240px" type="password" class="form-control"
							id="passwordFi" name="password" onmouseout="checkPassFi()" /> <span
							id="passProFi"></span>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">请再次确认密码</label><input
							style="width: 240px" type="password" class="form-control"
							id="passwordSe" onmouseout="checkPassSe()" /> <span
							id="passProSe"></span>
					</div>
					<div class="checkbox">
						<label><input type="checkbox" />同意注册</label>
					</div>
					<button type="submit" class="btn form-control btn-warning"
						style="width: 240px" id="submit">注册</button>
					</br>
				</form>
			</div>
		</div>
	</div>

</body>
</html>