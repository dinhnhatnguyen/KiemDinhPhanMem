package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.loai_bean;
import bean.sach_bean;
import bo.loai_bo;
import bo.sach_bo;

/**
 * Servlet implementation class sachController
 */
@WebServlet("/sachController")
public class sachController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sachController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			ArrayList<sach_bean> ds;
  			sach_bo sbo=new sach_bo();
  			ds=sbo.getsach(); // Lấy về all sách
  			String maloai=request.getParameter("maloai");
  			String ma=request.getParameter("txttim");
  			if(maloai!=null)
  				ds=sbo.TimMa(maloai);
  			else
  				if(ma!=null)
  					ds=sbo.Tim(ma);
  			loai_bo lbo=new loai_bo();
  			ArrayList<loai_bean> dsloai=lbo.getloai();
  			request.getAttribute("loi");
  			request.getAttribute("loi2");
  			request.setAttribute("dssach", ds);
  			request.setAttribute("dsloai", dsloai);
  			RequestDispatcher rd=request.getRequestDispatcher("htsach.jsp");
  			rd.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
