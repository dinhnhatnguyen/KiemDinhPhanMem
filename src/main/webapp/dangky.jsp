<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body style="display:flex; justify-content:center;">

<form action="dkController" method="post" style="width:30%; margin-top: 30px;box-shadow: 8px 8px 2px 1px #66CCFF;padding:20px">
      <!-- Username input -->
      <div class="form-outline mb-4">
      	<label class="form-label" for="registerUsername">Họ tên</label>
        <input type="text" id="registerUsername" name="txtht" class="form-control" />
        
      </div>
      
      <div class="form-outline mb-4">
      	<label class="form-label" for="registerName">Tài khoản</label>
        <input type="text" id="registerName" name="txtus" class="form-control" />
        
      </div>
      <!-- Password input -->
      <div class="form-outline mb-4">
      	<label class="form-label" for="registerPassword">Password</label>
        <input type="password" id="registerPassword" name="txtpass" class="form-control" />
        
      </div>

      <!-- Repeat Password input -->
      <div class="form-outline mb-4">
      	<label class="form-label" for="registerRepeatPassword">Repeat password</label>
        <input type="password" id="registerRepeatPassword" name="txtrp" class="form-control" />
      </div>
		<% String loi=request.getParameter("kq");
      		if(loi!=null)
      		{%>
      		<p style="color:red;"><%=loi %></p>
      		<%} %>
      <!-- Submit button -->
      <button type="submit" class="btn btn-primary btn-block mb-3">Sign in</button>
      <a href="sachController">Back Shop</a>
    </form>
</body>
</html>