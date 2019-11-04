<%@page contentType="text/html; charset=utf-8"%>
<%@page import = "java.sql.*"%>
<%@ include file = "../dbconn.jsp"%>

<html>
<head>
	<title>회원탈퇴</title>
	<link rel = "stylesheet" href ="../resources/css/bootstrap.min.css"	/>
</head>
<body>
<script type = "text/javascript">
	function deleteDB() {
		if (confirm("회원을 삭제하시겠습니까?")) {
			document.addForm.submit();
			
		}else {
			document.addForm.reset();
		}
	}
</script>

<%
	String sessionID = (String)session.getAttribute("sessionId");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from member";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	if (rs.next()){
		sql = "delete from member where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sessionID);
		pstmt.executeUpdate();
		session.invalidate();
	}
	
	if(rs != null) 
		rs.close();
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
%>
	<p><a href="../welcome.jsp" class="btn btn-info" onclick="deleteDB()"> 회원 탈퇴 &raquo;</a> </p>
	<p><a href="../welcome">취소</a>
</body>
</html>