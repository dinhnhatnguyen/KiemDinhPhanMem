package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

/**
 * Servlet implementation class kqController
 */
@WebServlet("/kqController")
public class kqController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public kqController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Lay ve txta, txtb
		String aa=request.getParameter("txta");
		String bb=request.getParameter("txtb");
		if(aa==null&&bb==null) {
			//chay lan dau thi ve trang maytinh
			RequestDispatcher rd =request.getRequestDispatcher("maytinh.jsp");
			rd.forward(request, response);
		}
		else {
			int a=Integer.parseInt(aa);
			int b=Integer.parseInt(bb);
			int kq=0;
			if(request.getParameter("btc")!=null)
			{
				kq=a+b;
			}
			if(request.getParameter("btt")!=null)
			{
				kq=a-b;
			}
			if(request.getParameter("btn")!=null)
			{
				kq=a*b;
			}
			if(request.getParameter("bth")!=null){
				kq=a/b;
			}
			request.setAttribute("kq", kq);
			request.setAttribute("a", a);
			request.setAttribute("b", b);
			RequestDispatcher rd =request.getRequestDispatcher("maytinh.jsp");
			rd.forward(request, response);
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
