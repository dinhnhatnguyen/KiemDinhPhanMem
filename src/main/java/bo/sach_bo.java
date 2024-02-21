package bo;

import java.util.ArrayList;

import bean.loai_bean;
import bean.sach_bean;
import dao.sach_dao;

public class sach_bo {
	sach_dao sdao=new sach_dao();
	ArrayList<sach_bean> ds;
	//viết hàm getsach() :lấy về all sách
	public ArrayList<sach_bean> getsach() throws Exception {
		ds = sdao.getsach();
		return ds;
	}
	//viết hàm: TimMa(string maloai): trả về all sách loại có mã : maloai
	public ArrayList<sach_bean> TimMa(String maloai) throws Exception{
		ArrayList<sach_bean> tam = new ArrayList<sach_bean>();
		for(sach_bean i :ds)
		{
			if(i.getMaloai().equals(maloai))
				tam.add(i);
		}
		return tam;
		
	}
	//viết hàm: Tim(string key) : trả về sách có tên sách hoặc tác giả giống key
	public ArrayList<sach_bean> Tim(String key) throws Exception{
		ArrayList<sach_bean> tam = new ArrayList<sach_bean>();
		for(sach_bean i:ds)
		{
			if(i.getTensach().toLowerCase().contains(key.toLowerCase())
					|| i.getTacgia().toLowerCase().contains(key.toLowerCase()))
				tam.add(i);
		}
		return tam;
	}
	public String TimLoai(String masach) throws Exception
	{	
		ds = sdao.getsach();
		for(sach_bean s: ds)
			if(s.getMasach().equals(masach))
				return s.getMasach();
		return null;
	}
	public int ThemSach(String masach,String tensach,long soluong,long gia,String maloai,String anh,String tacgia) throws Exception{
//		for(sach_bean s:ds )
//			if(TimLoai(masach)!=null)
//				return 0;
		return sdao.ThemSach(masach, tensach, soluong, gia, maloai, anh, tacgia);
	}
	public int SuaSach(String masach,String tensach,long soluong,long gia,String maloai,String anh,String tacgia) throws Exception{
		return sdao.SuaSach(masach, tensach, soluong, gia, maloai, anh, tacgia);
	}
	public int XoaSach(String masach) throws Exception{
		return sdao.XoaSach(masach);
	}
}
