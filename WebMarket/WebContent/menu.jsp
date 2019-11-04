<%@ page contentType="text/html; charset=utf-8"%><%-- 유니코드 : 각자의 OS에 맞게 언어가 지원됨 --%>
<%@taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%
	String sessionId = (String)session.getAttribute("sessionId");
%>
<nav class="navbar navbar-light" style="background-color: #e3f2fd;">
	
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="./welcome.jsp">Home</a>
		</div>
		<div>
		<ul class = "navbar-nav mr-auto">
			<c:choose>
				<c:when test="${empty sessionId}">
					<li class = "nav-item"><a class = "nav-link"href = "<c:url value ="/member/loginMember.jsp"/>">로그인</a></li>
					<li class = "nav-item"><a class = "nav-link" href = '<c:url value ="/member/addMember.jsp"/>'>회원 가입</a></li>
					
				</c:when>
				<c:otherwise>
				<li style = "padding-top: 7px; color: white">[<%=sessionId%>님]</li>
				<li class = "nav-item"><a class = "nav-link" href = "<c:url value = "/member/logoutMember.jsp"/>">로그아웃</a></li>
				<li class = "nav-item"><a class = "nav-link" href = "<c:url value = "/member/updateMember.jsp"/>">회원수정</a></li>
				<li class = "nav-item"><a class = "nav-link" href = "<c:url value = "/member/resultMember.jsp"/>">회원정보</a></li>
				<li class = "nav-item"><a class = "nav-link" href = "<c:url value = "/member/deleteMember.jsp"/>">회원탈퇴</a></li>
				</c:otherwise>
			</c:choose>
			
			<li class ="nav-item"><a class ="nav-link" href = "<c:url value ="/products.jsp"/>">상품 목록</a></li>
			<li class = "nav-item"><a class = "nav-link" href ="<c:url value ="/addProduct.jsp"/>">상품등록</a></li>
			<li class = "nav-item"><a class = "nav-link" href = "<c:url value ="/editProduct.jsp?edit=update"/>">상품수정</a></li>
			<li class = "nav-item"><a class = "nav-link" href = "<c:url value ="/editProduct.jsp?edit=delete"/>">상품 삭제</a></li>
			<li class = "nav-item"><a class = "nav-link" href = ""></a></li>
		</ul>
		</div>
		
	</div>
</nav>