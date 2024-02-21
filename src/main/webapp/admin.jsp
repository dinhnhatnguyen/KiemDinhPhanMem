<%@page import="bean.xacnhanbean"%>
<%@page import="bean.kh_bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.sach_bean"%>
<%@page import="bo.sach_bo"%>
<%@page import="bean.loai_bean"%>
<%@ page import="bo.loai_bo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
.reduce {
	width: 30%;
	text-align: center;
}

.search-navbar {
	display: none;
	padding-right: 10px;
}

.reduce .card-img-top {
	height: 300px;
}

@media ( max-width : 1023px) {
	.reduce {
		width: 40%;
		text-align: center;
	}
	.nav {
		display: flex;
		flex-direction: row;
	}
	.nav {
		display: block;
	}
	.search {
		display: none;
	}
	.search-navbar {
		display: flex;
		flex-wrap: none;
	}
	.reduce .card-img-top {
		height: 250px;
	}
}

@media ( max-width : 739px) {
	.reduce {
		width: 50%;
		text-align: center;
	}
	.body {
		display: flex;
		flex-direction: column;
		align-items: center;
		line-height: 1;
	}
	.reduce .card-img-top {
		height: 180px;
	}
	.theloai {
		width: 120%;
	}
}
</style>
</head>
<body>
	<%
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
	
	%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark"
		style="margin-bottom: 20px;">
		<a class="navbar-brand" href="#">Booking</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="AdminQLLoaiController">Quản lý loại sách</a></li>
				<li class="nav-item"><a class="nav-link" href="AdminQLSach">Quản lý sách
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="AdminXacNhanController">Xác nhận hoá đơn</a></li>
				<li class="nav-item"><a class="nav-link"
					href="AdminKHdaTT">Khách hàng đã chuyển tiền</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-toggle="dropdown" aria-expanded="false"> <i
						class="fa-solid fa-user"></i>
				</a>
					<div class="dropdown-menu">
						<%
						if (session.getAttribute("dn") != null) {
							kh_bean name = (kh_bean) session.getAttribute("dn");
						%>
						<a class="dropdown-item" href="#"><span
							class="glyphicon glyphicon-user"></span> Hello <%=name.getHoten()%></a>
						<%
						} else {
						%>
						<a class="dropdown-item" href="dangky.jsp"><span
							class="glyphicon glyphicon-user"></span> Đăng ký</a>
						<a class="dropdown-item" data-toggle="modal"
							data-target="#smallModalLogin"><span
								class="glyphicon glyphicon-log-in"></span> Đăng nhập</a>
						<%
						}
						%>
						<a class="dropdown-item" href="dnkhController?kt=1"><span
							class="glyphicon glyphicon-log-out"></span> Đăng xuất</a>
					</div></li>
			</ul>

			<form class="form-inline my-2 my-lg-0 search-navbar"
				action="sachController" method="post">
				<input type="text" name="txttim" class="form-control mr-sm-2"
					placeholder="Nhập key cần tìm"> <br> <input
					type="submit" name="bt1" class="btn-primary">
			</form>
		</div>
	</nav>
	<% String err=(String)request.getAttribute("loi"); 
	String err2=(String)request.getAttribute("loi2");
			if(err!=null)
				out.println("<script>alert('Đăng nhập thất bại');</script>");
			if(err2!=null)
				out.println("<script>alert('Đăng nhập thành công');</script>");

			%>
	<!-- Modal -->
	<div class="modal fade" role="dialog" id="smallModalLogin" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<form style="margin: 20px" id="login-form" action="dnkhController"
					method="post">
					<h3 class="text-center text-info">Login</h3>
					<div class="form-group">
						<label class="form-label" for="form2Example1">User:</label> <input
							type="text" name="txtus" id="form2Example1" class="form-control" />

					</div>
					<div class="form-group">
						<label class="form-label" for="form2Example2">Password:</label> <input
							type="password" name="txtpass" id="form2Example2"
							class="form-control" />
					</div>
					<div class="form-group">
						<label for="remember-me" class="text-info"><span>Remember
								me</span> <span><input id="remember-me" name="remember-me"
								type="checkbox"></span></label><br> <input type="submit"
							name="submit" class="btn btn-info btn-md" value="submit">
					</div>
				</form>

			</div>
		</div>
	</div>

	<div style="display: flex; justify-content: center;">
	<table class="table" style="width: 80%; ">
		<thead class="thead-dark">
			<tr style="text-align: center;">
				<th scope="col">Họ tên</th>
				<th scope="col">Tên sách</th>
				<th scope="col">Giá</th>
				<th scope="col">Số lượng mua</th>
				<th scope="col">Thành tiền</th>
			</tr>
		</thead>
		<tbody>
		<%-- <%ArrayList<xacnhanbean> ds=(ArrayList<xacnhanbean>)request.getAttribute("dshoadon");
		kh_bean kh=(kh_bean)session.getAttribute("dn");
			for(xacnhanbean xn:ds){%>
			<tr>
				<td><%=xn.getHoten() %></td>
				<td style="text-align: center;"><%=xn.getTensach()%></td>
				<td style="text-align: center;"><%=xn.getGia()%></td>
				<td style="text-align: center;"><%=xn.getSoLuongMua() %></td>
				<td style="text-align: center;"><%=xn.getThanhTien() %></td>
				<td>
					<a href="AdminXacNhanController?mact=<%=xn.getMaChiTietHD()%>">Xác Nhận</a>
				</td>
			</tr>
			<%}%> --%>
			<c:forEach var="xn" items="${dshoadon }">
				<tr>
					<td>${xn.getHoten()}</td>
					<td>${xn.getTensach()}</td>
					<td>${xn.getGia()}</td>
					<td>${xn.getSoLuongMua()}</td>
					<td>${xn.getThanhTien()}</td>
					<td>
						<a href="AdminXacNhanController?mact=${xn.getMaChiTietHD()}">Xác Nhận</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>


</body>
</html>