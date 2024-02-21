package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.sach_bean;
import bo.ghang_bo;

/**
 * Servlet implementation class gioController
 */
@WebServlet("/gioController")
public class gioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public gioController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String ms=request.getParameter("ms");
		String ts=request.getParameter("ts");
		String gia=request.getParameter("gia");
		String anh=request.getParameter("anh");
		String tg=request.getParameter("tg");
		String ml=request.getParameter("ml");
		String sl=request.getParameter("sl");
		if(ms!=null && ts!=null && tg!=null)
		{
			ghang_bo s =new ghang_bo();
			HttpSession session = request.getSession();
			if(session.getAttribute("giohang")==null)
			{
				session.setAttribute("giohang", s);
			}
			String a=(String)request.getAttribute("dnht");
  			if(a!=null)
  			{
  				request.setAttribute("dnht", a);
  			}
			s=(ghang_bo)session.getAttribute("giohang");
			sach_bean sach=new sach_bean(ms,ts,tg,Long.parseLong(gia),Long.parseLong(sl),anh,ml);
			long soluong=1;
			s.Them(soluong, sach.getGia()*soluong, sach);
			session.setAttribute("giohang", s);
		}
		response.sendRedirect("htgioController");
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
