<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; ">
<title>退出</title>
</head>
<body>
	<%	
		String str=application.getAttribute("num").toString();
		int i=Integer.parseInt(str);
		i--;
		application.setAttribute("num",i);
	
		session.removeAttribute("uname");
		session.removeAttribute("login");
		session.invalidate();
		response.sendRedirect("index.jsp");
	%>
</body>
</html>