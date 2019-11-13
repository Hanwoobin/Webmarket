<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@page import ="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ include file ="../dbconn.jsp" %>

<%

   String id = request.getParameter("id");
   String password = request.getParameter("password");
   
  
 	ResultSet rs = null;
	PreparedStatement pstmt = null;
	String sql = "select * from member where id= ? and password=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	rs = pstmt.executeQuery();
	String msg = "";
	while (rs.next()) {
		String name = rs.getString("name");
		session.setAttribute("sessionId", id);
		session.setAttribute("sessionName",name);
		if(session.getAttribute("sessionId")!=null) {
			msg = "../welcome.jsp";	
		}
	}
	if(session.getAttribute("sessionId")== null) {
		request.setAttribute("sessionId","아이디 또는 비밀번호가 일치하지 않습니다");
		msg = "loginMember.jsp?error=1";
	}
	
	
	if (rs != null) 
		rs.close();
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	response.sendRedirect(msg);
  
%>