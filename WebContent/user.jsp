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

<style type="text/css">
#head {
	margin: 20px auto auto 100px;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 给mainPage设置一个默认页面 -->
	<%
		String mainPage = (String) request.getAttribute("mainPage");
		if (mainPage == null || mainPage.equals("")) {
			mainPage = "userui/success.jsp";
		}
	%>

	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-12 column" style="height: 80px;">
					<img alt="140x140" style="margin-left: 100px" width="200px"
						height="100px" src="/jiange/image/head.jpg" />
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-12 column"
					style="height: 85px; background-color: #FFD700">
					<div id="head">
						<img alt="" style="height: 50px; width: 50px"
							src="${pageContext.request.contextPath }/image/x-man.jpg">
						<span>欢迎光临用户：${currentUser.username} </span>
					</div>
				</div>
			</div>
			<div class="row clearfix"
				style="height: 700px; background-color: #DCDCDC">

				<!-- 左列表 -->
				<div class="col-md-2 column"
					style="background-color: white; margin-left: 8%; margin-top: 15px">
					<div class="panel-group" id="panel-809758" style="height: 400px">
						<div class="panel panel-default" style="margin-top: 10px;">
							<div class="panel-heading">
								<a class="panel-title collapsed" data-toggle="collapse"
									data-parent="#panel-809758" href="#panel-element-195636">我的订单</a>
							</div>
							<div id="panel-element-195636" class="panel-collapse collapse">
								<div class="panel-body">
									<a
										href="<%=request.getContextPath()%>/com.jiange.servlet/UserOrderServlet">订单详情</a>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<a class="panel-title" data-toggle="collapse"
									data-parent="#panel-809758" href="#panel-element-498043">我的账户</a>
							</div>
							<div id="panel-element-498043" class="panel-collapse in">
								<div class="panel-body">
									<a
										href="<%=request.getContextPath() %>/com.jiange.servlet/UserInfServlet?action=showInf">基本信息</a>
								</div>
								<div class="panel-body">
									<a
										href="<%=request.getContextPath() %>/com.jiange.servlet/ChangePassWordServlet?action=showPage">修改密码</a>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<a class="panel-title" data-toggle="collapse"
									data-parent="#panel-809758" href="#panel-element-498055">会员条例</a>
							</div>
							<div id="panel-element-498055" class="panel-collapse in">
								<div class="panel-body">会员章程</div>
								<div class="panel-body">
									<a
										href="${pageContext.request.contextPath}/com.jiange.servlet/UserOthersServlet?action=rules">会员细则</a>
								</div>
							</div>

						</div>
					</div>
				</div>

				<!-- mainPage -->
				<div class="col-md-8 column"
					style="background-color: white; margin-left: 10px; margin-top: 15px">
					<jsp:include page="<%=mainPage%>"></jsp:include>

				</div>

			</div>

			<!-- 页尾 -->
			<div class="row clearfix">
				<div class="col-md-12 column"></div>
			</div>
		</div>
	</div>

</body>
</html>