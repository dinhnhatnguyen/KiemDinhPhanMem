package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.ghang_bo;

/**
 * Servlet implementation class xoaghController
 */
@WebServlet("/xoaghController")
public class xoaghController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public xoaghController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//tạo session
		HttpSession session = request.getSession();
		//Xoá checkbox
		String xoaCB = request.getParameter("check");
		//Xoá từng sách
		String xoams = request.getParameter("ms");
		//xoá tất cả
		String xoaAll = request.getParameter("all");
		if(xoaCB!=null && xoams == null && xoaAll==null)
		{
			ghang_bo s=(ghang_bo)session.getAttribute("giohang");
			String[] selected=request.getParameterValues("checkb");
			if(selected!=null)
			{	
				int n = selected.length;
				for(int i=0;i<n;i++)
				{
					s.Xoa(selected[i]);
				}
				session.setAttribute("giohang", s);
				response.sendRedirect("gioController");
			}
		}
		if(xoaCB==null && xoams != null && xoaAll==null)
		{
			ghang_bo g=(ghang_bo)session.getAttribute("giohang");
			if(g!=null)
			{
				g.Xoa(xoams);
			}
			else {
			    g = new ghang_bo();
			  }
			session.setAttribute("giohang", g);
			response.sendRedirect("gioController");
		}
		if(xoaCB ==null && xoams == null && xoaAll!=null)
		{
			ghang_bo g = (ghang_bo) session.getAttribute("giohang");
		   	if (g != null) {
			      g.ds.clear(); // Xóa tất cả các mặt hàng trong danh sách
			   }
		   	response.sendRedirect("gioController");
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
