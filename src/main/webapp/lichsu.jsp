<%@page import="bo.ghang_bo"%>
<%@page import="bean.kh_bean"%>
<%@page import="bean.lichsu_bean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lịch sử mua hàng</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body style>
	<%response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8"); 
		ghang_bo s=new ghang_bo();
		if(session.getAttribute("giohang")!=null)
		{
			s=(ghang_bo)session.getAttribute("giohang");
		}%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="margin-bottom: 20px;">
  	<a class="navbar-brand" href="#">Booking</a>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>

  	<div class="collapse navbar-collapse" id="navbarSupportedContent">
    	<ul class="navbar-nav mr-auto">
     	 <li class="nav-item active">
        	<a class="nav-link" href="sachController?sls=<%=s.ds.size()%>">Trang chủ</a>
      	</li>
      	<li class="nav-item"><a class="nav-link" href="htgioController">Giỏ hàng (<%=s.ds.size()%>)</a></li>
      	<li class="nav-item"><a class="nav-link" href="xacnhanController">Xác nhận thanh toán</a></li>
      	<li class="nav-item"><a class="nav-link" href="lsmuahangController">Lịch sử mua hàng</a></li>
      	<li class="nav-item dropdown">
        	<a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
         		<i class="fa-solid fa-user"></i>
        	</a>
        <div class="dropdown-menu">
        	<%if(session.getAttribute("dn")!=null){
        		kh_bean kh=(kh_bean)session.getAttribute("dn"); %>
    			<a class="dropdown-item" href="#"><span class="glyphicon glyphicon-user"></span> Hello <%=kh.getHoten() %></a>
    		<%}else{ %>
      			<a class="dropdown-item" href="dangky.jsp"><span class="glyphicon glyphicon-user"></span> Đăng ký</a>
      			<a class="dropdown-item" href="#" id="myBtn"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a>
      	<%} %>
      		<a class="dropdown-item" href="dnkhController?kt=1"><span class="glyphicon glyphicon-log-out"></span> Đăng xuất</a>
        </div>
      </li>
    </ul>

    <form class="form-inline my-2 my-lg-0 search-navbar" action="sachController" method="post">
  				<input type="text" name="txttim" class="form-control mr-sm-2" placeholder="Nhập key cần tìm">
  				<br>
  				<input type="submit" name="bt1" class="btn-primary">
  			</form>
  </div>
</nav>
	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
	<!-- Modal content-->
      <div class="modal-content">
        <form style="margin:20px" id="login-form" action="dnkhController" method="post">
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
                  <label for="remember-me" class="text-info"><span>Remember me</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                  <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">
              </div>
       </form>
      
    </div>
  </div> 
</div>
	
	<div style="display: flex; justify-content: center;">
	<table class="table" style="width: 80%; ">
		<thead class="thead-dark">
			<tr style="text-align: center;">
				<th scope="col">Tên sách</th>
				<th scope="col">Số lượng mua</th>
				<th scope="col">Giá</th>
				<th scope="col">Ngày Mua</th>
				<th scope="col">Thanh toán</th>
				<th scope="col">Thành tiền</th>
			</tr>
		</thead>
		<tbody>
		<%ArrayList<lichsu_bean> ds=(ArrayList<lichsu_bean>)request.getAttribute("lichsuMH");
		kh_bean kh=(kh_bean)session.getAttribute("dn");
		if(session.getAttribute("dn")!=null){
			for(lichsu_bean ls:ds){
				if(ls.getMakh()==kh.getMakh()){%>
			<tr>
				<td><%=ls.getTensach() %></td>
				<td style="text-align: center;"><%=ls.getSoLuongMua() %></td>
				<td style="text-align: center;"><%=ls.getGia() %></td>
				<td style="text-align: center;"><%=ls.getNgayMua() %></td>
				<%if(ls.isDamua()){ %>
				<td style="text-align: center;">Đã thanh toán</td>
				<%}else{ %>
				<td style="text-align: center;">Chưa thanh toán</td>
				<%} %>
				<td style="text-align: center;"><%=ls.getThanhTien() %></td>
			</tr>
			<%		}
				}	
			}else{ %>
			<h4>Vui lòng đăng nhập</h4>
			<%} %>
		</tbody>
	</table>
	</div>
	<script>
		$(document).ready(function() {
			$("#myBtn").click(function() {
				$("#myModal").modal();
			});
		});
	</script>
</body>
</html>