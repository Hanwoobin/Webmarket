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
	String sql = "select * from member where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();


	while(rs.next()) {
		if(rs.getString("id") == id && rs.getString("password") == password){
			session.setAttribute("sessionId", rs.getString("id"));
		}
	}
	
	if (rs != null) 
		rs.close();
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	
   
   response.sendRedirect("../welcome.jsp");
%>