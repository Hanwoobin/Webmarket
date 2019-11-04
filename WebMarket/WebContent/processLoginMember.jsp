<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@page import ="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ include file ="../dbconn.jsp" %>

<%
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy.MM.dd a hh:mm");
	String today = sf.format(now);
   request.setCharacterEncoding("UTF-8");
  
   String id = request.getParameter("id");
   String password = request.getParameter("password");
   

  
 	ResultSet rs = null;
	PreparedStatement pstmt = null;
	String sql = "select * from member where id= ? and password=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	rs = pstmt.executeQuery();
	
	while (rs.next()) {
		session.setAttribute("sessionId", id);
		
	}
	
	
	if (rs != null) 
		rs.close();
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
  // out.print(session.getAttribute("sessionId"));
  response.sendRedirect("welcome.jsp");
%>