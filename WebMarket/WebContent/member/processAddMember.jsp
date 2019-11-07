<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@page import ="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ include file ="../dbconn.jsp" %>

<%
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy.MM.dd hh:mm");

	String today = sf.format(now);

   request.setCharacterEncoding("UTF-8");
  
   String id = request.getParameter("id");
   String name = request.getParameter("name");
   String password = request.getParameter("password");
   String phone = request.getParameter("phone");
   String gender = request.getParameter("gender");
   String brith = request.getParameter("birth");
   String mail = request.getParameter("mail");
   String address = request.getParameter("address");
   
  
   
	PreparedStatement pstmt = null;
	String sql = "insert into member values(?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.setString(2,password);
	pstmt.setString(3,name);
	pstmt.setString(4, gender);
	pstmt.setString(5, brith);
	pstmt.setString(6, mail);
	pstmt.setString(7, phone);
	pstmt.setString(8, address);
	pstmt.setString(9, today);

	pstmt.executeUpdate();
	
	if(pstmt != null)
		pstmt.close();
	if(conn != null) 
		pstmt.close();
	
   
   response.sendRedirect("add_resultMember.jsp?id="+id);
%>