package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.lichsu_bean;
import bo.lichsu_bo;

/**
 * Servlet implementation class lsmuahangController
 */
@WebServlet("/lsmuahangController")
public class lsmuahangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public lsmuahangController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		ArrayList<lichsu_bean> ds;
		lichsu_bo lbo=new lichsu_bo();
		try {
			ds=lbo.getLS();
			request.setAttribute("lichsuMH", ds);
			RequestDispatcher rd=request.getRequestDispatcher("lichsu.jsp");
  			rd.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
