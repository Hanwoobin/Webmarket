<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.sql.*"%>
<%@ include file="../dbconn.jsp"%>

<html>
<head>
<title>회원탈퇴</title>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
</head>
<body>
	

	<%
		String sessionID = (String) session.getAttribute("sessionId");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		
		String sql = "select * from member";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		if (rs.next()) {
	%>
	<script type="text/javascript">
		function deleteDB() {
			var confirmResult = confim("정말 삭제하시겠습니까?");
			if (confirm == true) {
				document.addForm.submit();
				<%
				sql = "delete from member where id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					pstmt.executeUpdate();
					session.invalidate();
				}

				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			%>

			} else {
				document.addForm.reset();
			}
		}
	</script>
	

	<p>
		<a href="../welcome.jsp" class="btn btn-info" onclick="deleteDB()">회원 탈퇴 &raquo;</a>
	</p>
	<p>
		<a href="../welcome.jsp">취소</a></p>
</body>
</html>