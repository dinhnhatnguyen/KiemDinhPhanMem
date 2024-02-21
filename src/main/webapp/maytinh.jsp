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
		int a=0, b=0, kq=0;
		if (request.getAttribute("a")!=null && request.getAttribute("b")!=null && request.getAttribute("kq")!=null){
		a=(int)request.getAttribute("a");
		b=(int)request.getAttribute("b");
		kq=(int)request.getAttribute("kq");}
	%>
	<form method="post" action="kqController">
		<h>A=</h> 
		<input type="number" name="txta" placeholder="0" value="<%=a%>"><br>
		<h>B=</h>
		<input type="number" name="txtb" placeholder="0" value="<%=b%>"><br>
		<h>KQ=</h>
		<input type="number" name="txtkq" value="<%=kq%>"><br>
			<input type="submit" name="btc" value="+" class="btn-primary">
			<input type="submit" name="btt" value="-" class="btn-primary">
			<input type="submit" name="btn" value="*" class="btn-primary">
			<input type="submit" name="bth" value="/" class="btn-primary">
	</form>
		

</body>
</html>