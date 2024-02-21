package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.kh_bean;
import bo.kh_bo;
import nl.captcha.Captcha;

/**
 * Servlet implementation class dnkhController
 */
@WebServlet("/dnkhController")
public class dnkhController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dnkhController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
	    Integer loginAttempts = (Integer) session.getAttribute("loginAttempts");
	    Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
	    request.setCharacterEncoding("UTF-8");
	    String answer = request.getParameter("answer");
	    if (loginAttempts == null) {
	        loginAttempts = 0;
	    }
			String un=request.getParameter("txtus");
			String pass=request.getParameter("txtpass");
			kh_bo khbo=new kh_bo();
			if(un!=null && pass!=null) {				
				try {
					if(khbo.ktdn(un, pass)!=null && captcha.isCorrect(answer))
					{
						kh_bean kh=khbo.ktdn(un, pass);
						session.setAttribute("dn",kh);
						request.setAttribute("loi2", "1");
						session.setAttribute("loginAttempts",0);
					}
					else {
						request.setAttribute("loi", "1");
						loginAttempts++;
						session.setAttribute("loginAttempts",loginAttempts);
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				RequestDispatcher rd=request.getRequestDispatcher("sachController");
	  			rd.forward(request, response);
			}
			
			String dx=request.getParameter("kt");
			if(dx!=null)
			{
				session.removeAttribute("dn");
				response.sendRedirect("sachController");
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
