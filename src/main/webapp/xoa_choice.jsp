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
	ghang_bo s=(ghang_bo)session.getAttribute("giohang");
	String[] selected=request.getParameterValues("checkb");
	if(selected!=null)
	{	
		int n = selected.length;
		for(int i=0;i<n;i++)
		{
			s.Xoa(selected[i]);
		}
		session.setAttribute("giohang", s);
		response.sendRedirect("gioController");
	}
	%>
</body>
</html>