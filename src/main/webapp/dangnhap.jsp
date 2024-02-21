<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
    body {
  margin: 0;
  padding: 0;
  background-color: #17a2b8;
  height: 100vh;
}
#login .container #login-row #login-column #login-box {
	padding:20px;
  margin-top: 120px;
  max-width: 600px;
  height: 320px;
  border: 1px solid #9C9C9C;
  background-color: #EAEAEA;
}
#login .container #login-row #login-column #login-box #login-form {
  padding: 20px;
}
#login .container #login-row #login-column #login-box #login-form #register-link {
  margin-top: -85px;
}
</style>
<body>
	<table width="100%">
		<td> <a href="tc.jsp">Trang chu</a>	</td>
		<td> <a href="dangnhap.jsp"></a><% 
		if(session.getAttribute("dn")!=null){%>
			<a href=""> Xin chao: <%=session.getAttribute("dn") %>
		<%}else{ %>
		<a href="dangnhap.jsp">Dang nhap</a>
		<%} %>
		<td> <a href="dangxuat.jsp">dang xuat</a> </td>
		</table>

	<form method="post" action="dnController">
		Un: <input type="text" name="txtun" placeholder="Nhap ten"><br>
		Pass: <input type="password" name="txtpass"><br>
		<input type="submit" name="b1" value="login">
	<form>
	<% if (request.getParameter("kt") != null){ %>
		<b> Ten hoac mat khau khong dung</b>
		<%} %>

	</body>
</html>