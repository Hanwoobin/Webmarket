<%@page contentType="text/html; charset=utf-8" %>
<%

	session.removeAttribute("sessionId");
	session.invalidate();

response.sendRedirect("../welcome.jsp");
%>
