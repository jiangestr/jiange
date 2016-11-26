<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script type="text/javascript" >
<%-- $("#search").click(function () {
	document.getElementById("in").innerHTML = "asas";
	alert("发生错误");
	var request = new XMLHttpRequest();
	request.open("get","<%=request.getContextPath()%>/com.jiange.servlet/json"+document.getElementById("text").value,true);
	request.send();
	request.onreadyStateChange = function(){
		if(request.readyState === 4){
			var date = JSON.parse(request.responseText)
			document.getElementById("in").innerHTML = date.name;
		}else {
			alert("发生错误");
		}
	}
}); --%>
function a(){
	
	
	var request = new XMLHttpRequest();
	request.open("GET","com.jiange.servlet/json");
	request.send();
	
	request.onreadystatechange = function(){
		if(request.readyState === 4){
			alert("发生");
			//document.getElementById("in").innerHTML = request.responseText;
			var date = JSON.parse(request.responseText);
			document.getElementById("in").innerHTML = date.id;
		}
	}
}
</script>
</head>
<body>

<input type="text" id="text">
<button id="search" onclick="a()">是是是</button>
<p id="in"></p>
</body>
</html>