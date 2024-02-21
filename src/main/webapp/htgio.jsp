<%@page import="bean.kh_bean"%>
<%@page import="bo.ghang_bo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Giỏ hàng</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
		<%response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8"); 
		ghang_bo s=new ghang_bo();
		if(session.getAttribute("giohang")!=null)
		{
			s=(ghang_bo)session.getAttribute("giohang");
		}
		String a=(String)request.getAttribute("dnht");
		if(a!=null)
			out.println("<script>alert('Yêu cầu đăng nhập');</script>");
		%>
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
	
	
		<section class="h-100 h-custom" style="background-color: #d2c9ff;">
		
<form action="xoaghController?check=1" method="post" class="form-control">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12">
        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
          <div class="card-body p-0">
            <div class="row g-0">
              <div class="col-lg-8">
                <div class="p-5" style="background: #3333; border-radius: 15px">
                  <div class="d-flex justify-content-between align-items-center mb-5">
                    <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
                  </div>
					<%
					int n=s.ds.size();
					for(int i=0;i<n ;i++)
				{ %>
                  <div class="row mb-4 d-flex justify-content-between align-items-center">
                    <div class="col-md-2 col-lg-2 col-xl-2">
                      <img
                        src="<%=s.ds.get(i).getSach().getAnh()%>"
                        class="img-fluid rounded-3" alt="Cotton T-shirt">
                    </div>
                    <div class="col-md-3 col-lg-3 col-xl-3">
                      <h6 class="text-muted"><%=s.ds.get(i).getSach().getMasach() %></h6>
                      <h6 class="text-black mb-0"><%=s.ds.get(i).getSach().getTensach() %></h6>
                    </div>
                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
    				<form class="d-flex" action="suaghController?ms=<%=s.ds.get(i).getSach().getMasach() %>" method="post">
    					<input style="width: 50px" min="0" type="number" name="txtsl" value="<%=s.ds.get(i).getSl() %>">
                     	<input type="submit" class="btn btn-link" value="Up">
    				</form>
                       
                    </div>
                    <div class="col-md-3 col-lg-2 col-xl-2  d-flex">
                      <h6 style="padding-top:10px"><%=s.ds.get(i).getThanhgia()%></h6>
                    	<a class="btn btn-link" href='xoaghController?ms=<%=s.ds.get(i).getSach().getMasach() %>' class="btn btn-primary btn-sm" name='tt'>
                    		<i class="fa-solid fa-trash"></i></a>
                    </div>
                    	<input type="checkbox" name="checkb" value="<%=s.ds.get(i).getSach().getMasach()%>">            
                  </div>
                  <%}
                  if(n==0){%>
                  	<h1 style="display: flex;margin: auto;">Không có hàng nào</h1>
                  <%} %>
				
                    <a href="sachController?sls=<%=s.ds.size()%>">Back Shop</a>
                </div>
              </div>
              <div class="col-lg-4 bg-grey">
                <div class="p-5">
                  <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                  <hr class="my-4">

                  <div class="d-flex justify-content-between mb-4">
                    <h5 class="text-uppercase">Items <%=s.ds.size() %></h5>
                    <h5><%=s.Tongtien()%> VND</h5>
                  </div>
                  	<input type='submit' class="btn btn-primary" value='Delete'>
					<a href='xoaghController?all=1' class="btn btn-primary">Delete All</a>
					
                </div>
                	<form action="xacnhanController" method="post" >
						<input type='submit' class="btn btn-primary" value='Xác nhận đặt mua'>
					</form>	

              </div>
              
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
 </form>
</section>
 
<script>
		$(document).ready(function(){
  		$("#myBtn").click(function(){
    	$("#myModal").modal();
	  });
	});
	</script>
</body>
</html>