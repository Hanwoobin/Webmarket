<%@page contentType="text/html; charset=utf-8"%>
<%@page import = "com.oreilly.servlet.*"%>
<%@page import = "com.oreilly.servlet.multipart.*"%>
<%@page import = "java.util.*"%>
<%@page import = "java.sql.*"%>
<%@include file = "../dbconn.jsp" %>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String brith = request.getParameter("brith");
	String mail = request.getParameter("mail");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	
	String SessionId = (String)session.getAttribute("sessionId");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from member where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, SessionId);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		sql = "UPDATE member SET name=?, gender=?, birth=?, mail=?, phone=?, address=? WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2,gender);
		pstmt.setString(3,brith);
		pstmt.setString(4, mail);
		pstmt.setString(5, phone);
		pstmt.setString(6, address);
		pstmt.setString(7, SessionId);
		pstmt.executeUpdate();
	}else {
		out.println("아이디나 비밀번호를 다시 입력해주세요");
	}
	if (rs!= null) 
		rs.close();	
	if (pstmt != null)
		pstmt.close();
	if (conn != null) 
		conn.close();
	
	response.sendRedirect("resultMember.jsp?id="+SessionId);
%>