<%@page import="com.jiange.model.User"%>
<%@page import="com.jiange.model.Car"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

</head>
<body onload="checkUser(<%=session.getAttribute("user")%>)">

	<nav class="navbar navbar-default navbar-inverse navbar-fixed-top"
		role="navigation">

	<div class="navbar-header">

		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
				class="icon-bar"></span><span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">剑哥车行</a>
	</div>

	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li class="active"><a
				href="<%=request.getContextPath()%>/index.jsp">首页</a></li>
			<li><a href="#">用户须知</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown">车型<strong class="caret"></strong></a>
				<ul class="dropdown-menu">
					<!-- a标签中根据carType来查询相应车辆 -->
					<li><a
						href="<%=request.getContextPath()%>/com.jiange.servlet/CarServlet?limit=0&carType=1">轿车</a>
					</li>
					<li><a
						href="<%=request.getContextPath()%>/com.jiange.servlet/CarServlet?limit=0&carType=3">超跑</a></li>
					<li><a
						href="<%=request.getContextPath()%>/com.jiange.servlet/CarServlet?limit=0&carType=4">SUV</a></li>
					<li class="divider"></li>
					<li><a
						href="<%=request.getContextPath()%>/com.jiange.servlet/CarServlet?limit=0&carType=5">卡车</a></li>
					<li class="divider"></li>
					<li><a
						href="<%=request.getContextPath()%>/com.jiange.servlet/CarServlet?limit=0&carType=2">客车</a></li>
					<li class="divider"></li>
					<li><a
						href="<%=request.getContextPath()%>/com.jiange.servlet/CarServlet?limit=0&carType=6">挖掘机</a></li>
				</ul></li>
		</ul>
		<form class="navbar-form navbar-left" role="search">
			<div class="form-group" style="display:">
				<input type="text" class="form-control" id="text" />
			</div>
			<button type="submit" class="btn btn-default">搜索</button>
		</form>
		<ul class="nav navbar-nav navbar-right" id="color">
			<li id="login" style="margin-right: 30px;"><a
				href="/jiange/login.jsp">登录/注册</a></li>
			<li class="dropdown" id="currentUser" style="margin-right: 30px;"><a
				href="#" class="dropdown-toggle" data-toggle="dropdown">个人信息<strong
					class="caret"></strong></a>
				<ul class="dropdown-menu">
					<li><a href="<%=request.getContextPath()%>/user.jsp">个人中心</a></li>
					<li><a href="#">我的订单</a></li>
					<li><a href="#">我的收藏</a></li>
					<li class="divider"></li>
					<li><a
						href="<%=request.getContextPath()%>/com.jiange.servlet/RemoveUserServlet">退出登录</a></li>
				</ul></li>
		</ul>
	</div>
	</nav>

</body>
<script type="text/javascript">



//checkUser检查当前页面中用户是否存在，再选择显示登录or个人信息。
function checkUser(ss){
  
  var login = document.getElementById("login");
  var user = document.getElementById("user");
  
  
  if(ss == 1){
	  document.getElementById("currentUser").style.display= "block";
	  document.getElementById("login").style.display = "none";
  }
  else{
	  document.getElementById("currentUser").style.display= "none";
	  document.getElementById("login").style.display = "block";
  }
}

</script>
</html>