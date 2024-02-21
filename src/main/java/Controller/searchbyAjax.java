package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.sach_bean;
import bo.sach_bo;

/**
 * Servlet implementation class searchbyAjax
 */
@WebServlet("/searchbyAjax")
public class searchbyAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public searchbyAjax() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		ArrayList<sach_bean> ds;
		sach_bo sbo = new sach_bo();
		try {
			ds = sbo.getsach();
			String maloai = request.getParameter("maloai");
			String ma = request.getParameter("txttim");
			if (ma != null)
				ds = sbo.Tim(ma);
			PrintWriter out = response.getWriter();
			for (sach_bean i : ds) {
				out.println("<div class=\"reduce\">\r\n"
						+ "					<img class=\"card-img-top\" style=\"width: 90%; margin-bottom: 10px\"\r\n"
						+ "						alt=\"\" src=\""+i.getAnh() +"\"> <br> <a\r\n"
						+ "						href=\"gioController?ms="+i.getMasach()+"&ts="+i.getTensach()+"&gia="+i.getGia()+"&anh="+i.getAnh()+"&tg="+i.getTacgia()+"&ml="+i.getMaloai()+"&sl="+i.getSoluong()+"\">\r\n"
						+ "						<img alt=\"\" src=\"http://minhkhai.com.vn/store/images/buynow.jpg\">\r\n"
						+ "					</a>\r\n" + "<p>\r\n"
						+ "						Tên sách:\r\n" + ""+i.getTensach()+"</p>\r\n"
						+ "					<p>\r\n" + "Giá bán:\r\n"
						+ "						"+i.getGia()+"</p>\r\n" + "</div>");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
