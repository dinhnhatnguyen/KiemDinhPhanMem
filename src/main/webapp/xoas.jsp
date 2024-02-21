<%@page import="bo.ghang_bo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String ms=request.getParameter("ms");
	ghang_bo g=(ghang_bo)session.getAttribute("giohang");
	if(g!=null)
	{
		g.Xoa(ms);
	}
	else {
	    g = new ghang_bo();
	  }
	session.setAttribute("giohang", g);
	response.sendRedirect("gioController");
%>
</body>
</html>