<%@page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel ="stylesheet" href = "./resources/css/bootstrap.min.css"/>
<title>페이지 오류</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class = "jumbotron">
		<div class = "container">
			<h2 class = "alert alert-danger">요청하신 Page를  찾을수가 없습니다 끼루룩</h2>
		</div>
	</div>
	<div class = "container">
		<p><%=request.getRequestURL() %>
		<p> <a href ="products.jsp" class = "btn btn-secondary">상품 목록 &raquo;</a>
	</div>
</body>

</html>