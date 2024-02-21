<%@page import="bean.kh_bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.sach_bean"%>
<%@page import="bo.sach_bo"%>
<%@page import="bean.loai_bean"%>
<%@ page import="bo.loai_bo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tạp hoá sách</title>
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
					href="sachController">Trang chủ</a></li>
				<%
				String sls = request.getParameter("sls");
				if (sls == null)
					sls = "0";
				%>
				<li class="nav-item"><a class="nav-link" href="htgioController">Giỏ
						hàng (<%=sls%>)
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="xacnhanController">Xác nhận thanh toán</a></li>
				<li class="nav-item"><a class="nav-link"
					href="lsmuahangController">Lịch sử mua hàng</a></li>
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
<form style="margin: 20px" id="login-form" action="dnkhController" method="post">
    <h3 class="text-center text-info">Login</h3>
    <div class="form-group">
        <label class="form-label" for="form2Example1">User:</label>
        <input type="text" name="txtus" id="form2Example1" class="form-control" />
    </div>
    <div class="form-group">
        <label class="form-label" for="form2Example2">Password:</label>
        <input type="password" name="txtpass" id="form2Example2" class="form-control" />
    </div>
    <div class="form-group">
        <label for="remember-me" class="text-info">
            <span>Remember me</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span>
        </label><br>
        <%
            Integer loginAttempts = (Integer) session.getAttribute("loginAttempts");
            if (loginAttempts != null && loginAttempts >= 3) {
        %>
        <img src="simpleCaptcha.jpg" /> <!-- Hiển thị Captcha -->
        <input type="text" name="answer" /><br> <!-- Input để người dùng nhập Captcha -->
        <%
            } else {
        %>
        <input type="hidden" name="answer" value="skip" /> <!-- Giá trị ẩn nếu không cần Captcha -->
        <%
            }
        %>
        <input type="submit" name="submit" class="btn btn-info btn-md" value="Submit">
    </div>
</form>

			</div>
		</div>
	</div>

	<div class="body" style="width: 100%; display: flex;">
		<div class="body--left" style="width: 20%;">
			<div style="display: flex; justify-content: center; margin: 10px 0;"
				class="dropdown">
				<button style="width: 80%"
					class="theloai btn btn-primary dropdown-toggle" type="button"
					data-toggle="dropdown">
					Thể loại <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<%
					ArrayList<loai_bean> dsloai = (ArrayList<loai_bean>) request.getAttribute("dsloai");
					for (loai_bean loai : dsloai) {
					%>
					<li style="padding: 0 20px;"><a
						href="sachController?maloai=<%=loai.getMaloai()%>"><%=loai.getTenloai()%></a>
					</li>
					<%
					}
					%>
				</ul>
			</div>
		</div>

		<div class="body--center" style="width: 60%;">

			<div
				style="display: flex; flex-wrap: wrap; justify-content: space-around;">
				<%
				//hàm trên luôn có 
				ArrayList<sach_bean> ds = (ArrayList<sach_bean>) request.getAttribute("dssach");
				int n = ds.size();
				for (int i = 0; i < n; i++) {
					sach_bean s = ds.get(i);
				%>
				<div class="reduce">
					<img class="card-img-top" style="width: 90%; margin-bottom: 10px"
						alt="" src="<%=s.getAnh()%>"> <br> <a
						href="gioController?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>&anh=<%=s.getAnh()%>&tg=<%=s.getTacgia()%>&ml=<%=s.getMaloai()%>&sl=<%=s.getSoluong()%>">
						<img alt="" src="http://minhkhai.com.vn/store/images/buynow.jpg">
					</a>
					<p>
						Tên sách:
						<%=s.getTensach()%></p>
					<p>
						Giá bán:
						<%=s.getGia()%></p>
				</div>
				<%
				}
				if(n==0){%>
					<h1 style="display: flex;margin: auto;">Không tìm thấy mặt hàng</h1>
				<%} %>
			</div>
		</div>
		<div style="width: 20%;" class="grid-item search">
			<form style="display: flex;" action="sachController" method="post">
				<input oninput="searchByName(this)" type="text" name="txttim"
					class="form-control" placeholder="Nhập key cần tìm">
				<button type="submit" class="btn btn-primary">
					<i class="fas fa-search"></i>
				</button>
			</form>

		</div>
	</div>


</body>
</html>