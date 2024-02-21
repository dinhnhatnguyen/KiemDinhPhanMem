package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ghang_bean;
import bean.kh_bean;
import bo.chitietbo;
import bo.ghang_bo;
import bo.hoadonbo;
import dao.chitietdao;

/**
 * Servlet implementation class xacnhanController
 */
@WebServlet("/xacnhanController")
public class xacnhanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xacnhanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession();
		kh_bean kh= (kh_bean) session.getAttribute("dn");
		if(kh==null)
		{
			RequestDispatcher rd= request.getRequestDispatcher("gioController?dnht=1");
			rd.forward(request, response);
		}
		else {
			ghang_bo gh=(ghang_bo)session.getAttribute("giohang");
			if(gh!=null)
			{
				hoadonbo hbo=new hoadonbo();
				try {
					hbo.them(kh.getMakh());
					long mahd=hbo.getMaxHD();
					//Duyet gio de lýu vào cthoadon
					chitietbo ct=new chitietbo();
					for(ghang_bean g:gh.ds) {
						ct.them(g.getSach().getMasach(), g.getSl(), mahd);
					}
					session.removeAttribute("giohang");
					response.sendRedirect("sachController");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
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
