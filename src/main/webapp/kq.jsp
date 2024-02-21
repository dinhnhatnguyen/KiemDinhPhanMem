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
		String ta=(request.getParameter("txta"));
		String tb=request.getParameter("txtb");
		double kq=0;
		if(ta!=null||tb!=null){
			int a=Integer.parseInt(ta);
			int b=Integer.parseInt(tb);
			if(request.getParameter("butc")!=null)
			{
				kq=a+b;
				out.print("kq = "+kq);
			}
			if(request.getParameter("butt")!=null)
			{
				kq=a-b;
				out.print("kq = "+kq);
			}
			if(request.getParameter("butn")!=null)
			{
				kq=a*b;
				out.print("kq = "+kq);
			}
			if(request.getParameter("butch")!=null){
				kq=a/b;
				out.print("kq = "+kq);
			}
			response.sendRedirect("maytinh.jsp?kq="+kq+"&a="+a+"&b="+b);
		}
		
		%>
</body>
</html>