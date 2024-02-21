<%@page import="bean.kh_bean"%>
<%@page import="bean.lichsu_bean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
</head>
<body>
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
					href="AdminQLSach">Quản lý loại sách</a></li>
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

		</div>
	</nav>
	<div style="display: flex; justify-content: center;">
	<table class="table" style="width: 80%; ">
		<thead class="thead-dark">
			<tr style="text-align: center;">
				<th scope="col">Khách Hàng</th>
				<th scope="col">Tên sách</th>
				<th scope="col">Số lượng mua</th>
				<th scope="col">Giá</th>
				<th scope="col">Ngày Mua</th>
				<th scope="col">Thành Tiền</th>
				
			</tr>
		</thead>
		<tbody>
		<%ArrayList<lichsu_bean> ds=(ArrayList<lichsu_bean>)request.getAttribute("lichsuMH");
			for(lichsu_bean ls:ds){
				if(ls.isDamua()){%>
			<tr>
				<td><%=ls.getHoten() %></td>
				<td><%=ls.getTensach() %></td>
				<td style="text-align: center;"><%=ls.getSoLuongMua() %></td>
				<td style="text-align: center;"><%=ls.getGia() %></td>
				<td style="text-align: center;"><%=ls.getNgayMua() %></td>
				<td style="text-align: center;"><%=ls.getThanhTien() %></td>
			</tr>
			<%		}
				}	
			 %>
		</tbody>
	</table>
	</div>
</body>
</html>