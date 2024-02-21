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
import bo.loai_bo;

/**
 * Servlet implementation class AdminQLLoaiController
 */
@WebServlet("/AdminQLLoaiController")
public class AdminQLLoaiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQLLoaiController() {
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
			ArrayList<loai_bean> dsl = new ArrayList<loai_bean>();
			loai_bo lbo=new loai_bo();
			String tab=request.getParameter("tab");
			String ml=request.getParameter("txtmaloai");
			String tenloai=request.getParameter("txttenloai");
			dsl=lbo.getloai();
			System.out.print((String)request.getParameter("butadd"));
			if(request.getParameter("butadd")!=null)
			{
				System.out.print("test");
				lbo.ThemLoai(ml, tenloai);
			}
			else {
				if(request.getParameter("butupdate")!=null) {
					System.out.print("test");
					lbo.SuaLoai(ml, tenloai);
				}else {
					String maloai=request.getParameter("ml");
					String tenloai2=request.getParameter("tl");
					if(tab!=null && tab.equals("xoa"))
					{
						lbo.XoaLoai(maloai);
					}
					else
						if(tab!=null && tab.equals("chon"))
						{
							request.setAttribute("ml", maloai);
							request.setAttribute("tl", tenloai2);
						}
				}
			}
			request.setAttribute("dsloai",lbo.getloai());	
			RequestDispatcher rd=request.getRequestDispatcher("qlloai.jsp");
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
