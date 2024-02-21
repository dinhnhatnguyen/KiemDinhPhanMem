<%@page import="bean.loai_bean"%>
<%@page import="bean.kh_bean"%>
<%@page import="bean.sach_bean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Quản lý loại sách</title>
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
	<div style="display: flex;justify-content: center;">
	<%	String msc="";
		String tsc="";
		String mlc="";
		String tgc="";
		String giac="";
		String slc="";
		String anhc="";
		if((String)request.getAttribute("msc")!=null&&(String)request.getAttribute("tsc")!=null
				&&(String)request.getAttribute("mlc")!=null&&(String)request.getAttribute("tgc")!=null
				&&(String)request.getAttribute("giac")!=null&&(String)request.getAttribute("slc")!=null
				&&(String)request.getAttribute("anhc")!=null){
			msc=(String)request.getAttribute("msc");
			tsc=(String)request.getAttribute("tsc");
			mlc=(String)request.getAttribute("mlc");
			tgc=(String)request.getAttribute("tgc");
			giac=(String)request.getAttribute("giac");
			slc=(String)request.getAttribute("slc");
			anhc=(String)request.getAttribute("anhc");
		}
		%>
    <form action="AdminQLSach" method="post" enctype="multipart/form-data">
        <label style="width: 150px" for="masach">Mã Sách:</label>
        <input value="<%=msc %>" type="text" name="masach" >
        <br>

        <label style="width: 150px" for="tensach">Tên Sách:</label>
        <input value="<%=tsc %>" type="text" name="tensach" >
        <br>

        <label style="width: 150px" for="hinhanh">Ảnh Sách:</label>
        <input value="<%=anhc %>" type="file" name="hinhanh" onchange="showFileName(this)">
		<span id="fileNameSpan"></span>
        <br>

        <label style="width: 150px" for="soluong">Số Lượng:</label>
        <input value="<%=slc %>" type="number" min="1" name="soluong" >
        <br>

        <label style="width: 150px" for="gia">Giá:</label>
        <input value="<%=giac %>" type="number" min="1" name="gia">
        <br>

        <label style="width: 150px" for="tacgia">Tác Giả:</label>
        <input value="<%=tgc %>" type="text" name="tacgia">
        <br>

        <label style="width: 150px" for="maloai">Mã Loại:</label>
        <select name="maloai">
        	<%ArrayList<loai_bean> dsl=(ArrayList<loai_bean>)request.getAttribute("dsl");
			for(loai_bean loai:dsl){ 
				if(loai.getMaloai().equals(mlc)){%>
  				<option selected="selected" value="<%=loai.getMaloai()%>"><%=loai.getMaloai() %></option>
  				<%}else{ %>
  				<option value="<%=loai.getMaloai()%>"><%=loai.getMaloai() %></option>
  			<%}} %>
  <!-- Thêm các tùy chọn khác tại đây -->
		</select>
        <br>

        <input class="btn btn-warning" name="butadd" type="submit" value="Add">
		<input class="btn btn-warning" name="butupdate" type="submit" value="Update">
    </form>
	</div>
	<div style="display: flex; justify-content: center;">
	<table class="table" style="width: 90%; ">
		<thead class="thead-dark">
			<tr style="text-align: center;">
				<th scope="col">Mã sách</th>
				<th scope="col">Tên sách</th>
				<th scope="col">Ảnh</th>
				<th scope="col">Số lượng</th>
				<th scope="col">Giá</th>
				<th scope="col">Tác Giả</th>
				<th scope="col">Mã Loại</th>
			</tr>
		</thead>
		<tbody>
			<% 
			ArrayList<sach_bean> ds=(ArrayList<sach_bean>)request.getAttribute("ds");
			for(sach_bean sach:ds){
			%>
			<tr>
				<td><%=sach.getMasach()%></td>
				<td><%=sach.getTensach()%></td>
				<td><img style="width: 100px" src="<%=sach.getAnh()%>"></td>
				<td><%=sach.getSoluong()%></td>
				<td><%=sach.getGia()%></td>
				<td><%=sach.getTacgia()%></td>
				<td><%=sach.getMaloai()%></td>
				<td><a href="AdminQLSach?tab=chon&ms=<%=sach.getMasach() %>&ts=<%=sach.getTensach() %>
					&ml=<%=sach.getMaloai() %>&tg=<%=sach.getTacgia() %>&gia=<%=sach.getGia() %>
						&sl=<%=sach.getSoluong() %>&anh=<%=sach.getAnh()%>"class="btn btn-warning">select</a></td>
				<td><a href="AdminQLSach?ms=<%=sach.getMasach()%>&tab=xoa" class="btn btn-warning">Delete</a></td>
			</tr>
			<%
			}%>
			
		</tbody>
	</table>
	</div>
<%-- <script type="text/javascript">
document.addEventListener("DOMContentLoaded", function () {
    const fileNameSpan = document.getElementById("fileNameSpan");
    const anhc = "<%= anhc %>";
    
    if (anhc) {
        fileNameSpan.textContent = anhc;
    }
});

function showFileName(input) {
    const fileNameSpan = document.getElementById("fileNameSpan");
    if (input.files && input.files.length > 0) {
        fileNameSpan.textContent = input.files[0].name;
    }
}
</script> --%>

</body>
</html>