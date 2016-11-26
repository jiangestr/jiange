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

<style type="text/css">
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color: white;">
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-12 column">
						<img alt="140x140" width="200px" height="100px"
							src="/jiange/image/head.jpg" />
					</div>
				</div>
				<div class="row clearfix">
					<div class="col-md-12 column"
						style="height: 768px; background-image: url('image/login.jpg');">
						<div class="tabbable form-control" id="tabs-131233"
							style="width: 300px; height: 430px; margin-top: 100px; margin-left: 800px; background-color: #fffff4;">
							<ul class="nav nav-tabs">
								<li class="active" onclick="changeColor('session1','session2')"><a
									id="session1" href="#panel-399460" data-toggle="tab"
									style="background-color: orange;">密码登录</a></li>
								<li onclick="changeColor('session2','session1')"><a
									id="session2" href="#panel-735429" data-toggle="tab">用户注册</a></li>
							</ul>
							<div class="tab-content"
								style="border: solid; border-color: orange;">
								<div class="tab-pane active" id="panel-399460"
									style="height: 320px">
									<form role="form" method="post"
										action="com.jiange.servlet/UserServlet"
										style="margin-top: 30px; margin-left: 10px; margin-right: 10px">
										<div class="form-group" style="margin-top: 30px">
											<label for="exampleInputEmail1">用户名</label><input type="text"
												class="form-control" name="username" maxlength="32" />
										</div>
										<div class="form-group">
											<label for="exampleInputPassword1">密码</label><input
												type="password" class="form-control" name="password" />
										</div>

										<div class="checkbox">
											<label><input type="checkbox" />记住密码</label>
										</div>
										<button type="submit" class="btn form-control btn-warning">登录</button>
										</br> <br> <a href="signin.jsp" style="margin-left: 120px;">进入注册页面注册>></a>

									</form>
								</div>
								<div class="tab-pane" id="panel-735429" style="height: 350px">
									<jsp:include page="signin.jsp"></jsp:include>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
<!-- 设置选项卡的颜色 -->
<script type="text/javascript">
	function changeColor(s, t) {
		document.getElementById(s).style.backgroundColor = "orange";
		document.getElementById(t).style.backgroundColor = "#fffff4";

	}
</script>

</html>