<%@ page contentType ="text/html; charset=utf-8" %><%-- 유니코드 : 각자의 OS에 맞게 언어가 지원됨 --%>
<%@ page import ="java.util.Date" %>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<jsp:useBean id ="productDAO" class = "dao.ProductRepository" scope="session"/>
<html>
<head>
<link rel="stylesheet" <%--페이지 스타일 --%>
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> <%--부트스트랩 링크 (링크 1이라도 틀리면 안됨) --%>
<title>Welcome</title> <%--  --%>
</head>
<body>
	
	<%@ include file = "menu.jsp" %> <%-- 모듈화 (파츠 불러오기) --%>
	
	
	<div class="jumbotron" > <%-- 스타일 코드  --%>
		<div class="container">
			<h1 class="display-3"><%-- 스타일 코드 --%>
		
			</h1>
		</div>
	</div>
	
	<div class="container"> <%--부트스트랩  --%>
		<div class="text-center"> <%-- 가운데 정렬(문자를 정렬) + (text-center일때 띄어쓰기 하면 적용X) --%>
			
			<h3>
			
				
			</h3>
			<div class="card-group">
  <div class="card">
    <img src="https://cdn.discordapp.com/attachments/354194179557163019/615187138295889931/1500273400889.jpg" class="card-img-top" alt="..."
    height= "600px" width="600px">
    <div class="card-body">
      <h5 class="card-title">상품</h5>
      <p class="card-text"> 과제의 노예가<p>
       
      <a href="./products.jsp" class="btn btn-primary stretched-link">상품 목록보기</a>
    </div>
  </div>
  <div class="card">
    <img src="https://cdn.discordapp.com/attachments/354194179557163019/615187138757132328/1500273393219.jpg" class="card-img-top" alt="..."
     height = "250px" width = "600px">
    <div class="card-body">
      <h4 class="card-title">상품(이름)</h4>
      <p class="card-text"> 되어서</p>
       <a href="./products.jsp" class="btn btn-primary stretched-link">상품 목록보기</a>
    </div>
  </div>
  <div class="card">
    <img src="https://cdn.discordapp.com/attachments/354194179557163019/615187138295889930/1500273404170.jpg" class="card-img-top" alt="..."
     height = "250px" width ="549px">
    <div class="card-body">
      <h5 class="card-title">상품(이름명)</h5>
       <p class="card-text"> 좀비가 되거라</p>
      
      <a href="./products.jsp" class="btn btn-primary stretched-link">상품 목록보기</a>
      
    </div>
  </div>
</div>
			
			<%
				response.setIntHeader("Refresh", 10);
				Date day = new java.util.Date();
				String am_pm;
				int hour = day.getHours();
				int minute = day.getMinutes();
				int second = day.getSeconds();
					if(hour / 12 == 0) {
					am_pm = "AM";
					}
					else
					{
						am_pm = "PM";
						hour -= 12;
					}
				String CT = hour + ": "+ minute+":"+ second +" : "+am_pm;
				out.println("현재 접속    시각 " + CT + "\n");
					
			%>
		</div>
		<hr>
	</div>
	
	</main>


	<%@ include file = "footer.jsp" %>
	<script>
	function startTime() {
	    var today = new Date();
	    var h = today.getHours();
	    var m = today.getMinutes();
	    var s = today.getSeconds();
	    m = checkTime(m);
	    s = checkTime(s);
	    if(h / 12 == 0) {
	    	aa = "오전";
	    }
	    else {
	    	
	    	h -= 12;
	    	aa = "오후"
	    }
	    document.getElementById('clock').innerHTML =
	  "현재 시간 : "+aa +" "+  + "시" + m + "분" + s +"초";
	    var t = setTimeout(startTime, 500);
	}
	function checkTime(i) {
	    if (i < 10) {i = "0" + i};
	    return i;
	}

	</script>
</body>
</html>