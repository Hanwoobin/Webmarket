<%@page contentType="text/html; charset=utf-8" %>
<%@page import ="java.io.*, java.util.*" %>
<html>
<head>
	<title></title>
</head>
<body>
	<table border="1">
		<tr>
			<th>요청 파라미터 이름 </th>
			<th>요청 파라미터 값 </th>
		</tr>
	<%
		request.setCharacterEncoding("UTF-8");
	
		Enumeration paramNames = request.getParameterNames();
		//Enumeration 인터페이스는 객체들의 집합(Vector)에서 각각의 객체들을 한순간에 하나씩 처리할 수 있는 메소드를 제공하는 켈렉션이다.
		//인터페이스이므로, 직접 new 연산자를 이용하여 객체를 생성할 수 없으며, Enumeration 인터페이스에 선언된 메소드는 그 인터페이스를 사용하는 클래스로 구현해서 사용해야만 한다.
		while(paramNames.hasMoreElements()) {//paramNames 가 값을 가지고 있는지 물어서 있으면 true / while 문이 반복된다. Vector로 부터 생성된 Enumeration의 요소가 있으면 true, 아니면 false 반환
			//뒤에 남은 데이터가 있으면 True, 없으면 False를 반환한다. while 루프를 통한 제어처리시 사용한다.
			String name = (String) paramNames.nextElement();// 자료구조의 다음 데이터를 반환하여, 다음 객체의 레퍼런스를 얻는다.

			out.print("<tr><td>" + name +"</td>\n");
			String paramValue = request.getParameter(name);
			out.println("<td>"+ paramValue + "</td></tr>\n");
		}
	%>
	
	</table>
	
	<a href = "./welcome.jsp" type="button" class="btn btn-info">처음 화면으로</a>
</body>

</html>