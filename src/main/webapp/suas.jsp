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
	ghang_bo g = (ghang_bo)session.getAttribute("giohang");
	String ms=request.getParameter("ms");
	String sl=request.getParameter("txtsl");
	long slmoi=Long.parseLong(sl);
	g.Sua(ms, slmoi);
	session.setAttribute("giohang", g);
	response.sendRedirect("htgio.jsp");
	%>
</body>
</html>