package Controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bean.sach_bean;
import bo.loai_bo;
import bo.sach_bo;

/**
 * Servlet implementation class AdminQLSach
 */
@WebServlet("/AdminQLSach")
public class AdminQLSach extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public AdminQLSach() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
		Map<String, String> fieldMap = new HashMap<>();
		String anh=null;
		try {
			List<FileItem> fileItems = upload.parseRequest(request);
			for (FileItem fileItem : fileItems) {
				if (fileItem.isFormField()) {
				    String fieldName = fileItem.getFieldName();
				    String fieldValue = fileItem.getString("UTF-8"); // Lấy giá trị của trường
				    fieldMap.put(fieldName, fieldValue);
				}
				if (!fileItem.isFormField()) {
					String nameimg = fileItem.getName();
					anh="image_sach/"+nameimg;
					if (!nameimg.equals("")) {
						
						String dirUrl = "E:\\Java\\JavaNangCao\\src\\main\\webapp\\image_sach" + File.separator;
						File dir = new File(dirUrl);
						if (!dir.exists()) {
							dir.mkdir();
						} 
						String fileImg = dirUrl + nameimg;
						//System.out.println(fileImg);
						File file = new File(fileImg);
						try {
							fileItem.write(file);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
			}

		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		
		try {
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			ArrayList<sach_bean> ds = new ArrayList<sach_bean>();
			String tab=request.getParameter("tab");
			String masach = fieldMap.get("masach");
			String tensach = fieldMap.get("tensach");
			String maloai = fieldMap.get("maloai");
			String tacgia = fieldMap.get("tacgia");
			String gia = fieldMap.get("gia");
			String soluong = fieldMap.get("soluong");
			String addButtonValue = fieldMap.get("butadd");
			String updateButtonValue = fieldMap.get("butupdate");
			sach_bo sbo=new sach_bo();
			loai_bo lbo=new loai_bo();
			
			if(addButtonValue!=null)
			{
				
				sbo.ThemSach(masach, tensach, Long.parseLong(soluong), Long.parseLong(gia), maloai, anh, tacgia);
			}
			else {
				if(updateButtonValue!=null) {
					sbo.SuaSach(masach, tensach, Long.parseLong(soluong), Long.parseLong(gia), maloai, anh, tacgia);
				}else {
					
					if(tab!=null && tab.equals("xoa"))
					{
						String ms=request.getParameter("ms");
						sbo.XoaSach(ms);
					}
					else
						if(tab!=null && tab.equals("chon"))
						{
							String ms=request.getParameter("ms");
							String ts=request.getParameter("ts");
							String ml=request.getParameter("ml");
							String tg=request.getParameter("tg");
							String giac=request.getParameter("gia");
							String sl=request.getParameter("sl");
							String anhc=request.getParameter("anh");
							request.setAttribute("msc", ms);
							request.setAttribute("tsc", ts);
							request.setAttribute("mlc", ml);
							request.setAttribute("tgc", tg);
							request.setAttribute("giac", giac);
							request.setAttribute("slc", sl);
							request.setAttribute("anhc", "image_sach/"+anhc);
						}
				}
			}
			request.setAttribute("dsl", lbo.getloai());
			request.setAttribute("ds", sbo.getsach());
			RequestDispatcher rd= request.getRequestDispatcher("qlsach.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
