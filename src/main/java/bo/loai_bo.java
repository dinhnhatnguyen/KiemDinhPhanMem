package bo;

import java.util.ArrayList;

import bean.loai_bean;
import dao.loai_dao;

public class loai_bo {
	loai_dao ldao = new loai_dao();
	ArrayList<loai_bean> dsl=new ArrayList<loai_bean>();
	public ArrayList<loai_bean> getloai() throws Exception{
		dsl= ldao.getloai();
		return dsl;
	}
	public String TimLoai(String maloai) throws Exception
	{	
		dsl = ldao.getloai();
		for(loai_bean l: dsl)
			if(l.getMaloai().equals(maloai))
				return l.getTenloai();
		return null;
	}
	public int ThemLoai(String maloai,String tenloai) throws Exception
	{	
		for(loai_bean l: dsl)
			if(TimLoai(maloai)!=null)
				return 0;
		return ldao.ThemLoai(maloai, tenloai);
	}
	public int SuaLoai(String maloai,String tenloai) throws Exception{
		return ldao.SuaLoai(maloai, tenloai);
	}
	public int XoaLoai(String maloai) throws Exception
	{
		return ldao.XoaLoai(maloai);
	}
}
