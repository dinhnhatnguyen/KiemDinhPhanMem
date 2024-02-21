package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.kh_bean;
import bo.kh_bo;

/**
 * Servlet implementation class dkController
 */
@WebServlet("/dkController")
public class dkController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public dkController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String hten = request.getParameter("txtht");
		String user = request.getParameter("txtus");
		String pass = request.getParameter("txtpass");
		String rp = request.getParameter("txtrp");
		kh_bo khbo = new kh_bo();
		if (hten != "" && user != "" && pass != "" && rp != "") {
			if (!pass.equals(rp)) {
				response.sendRedirect("dangky.jsp?kq=" + "Kiem tra lai mat khau");
			} else {
				try {
					if (khbo.ktdk(user) == null) {
						try {
							khbo.DangKy(hten, user, pass);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						request.setAttribute("kq", "1");
						response.sendRedirect("sachController");
					} else {
						response.sendRedirect("dangky.jsp?kq=" + "User da ton tai");
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		} else {
			response.sendRedirect("dangky.jsp?kq=" + "Dien du thong tin");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
