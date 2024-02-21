package bo;

import java.util.ArrayList;

import bean.kh_bean;
import dao.kh_dao;

public class kh_bo {
	ArrayList<kh_bean> ds=new ArrayList<kh_bean>();
	kh_dao khdao=new kh_dao();
	public ArrayList<kh_bean> getKH() throws Exception {
		ds=khdao.getKH();
		return ds;
	}
	public kh_bean ktdn(String tendn, String pass) throws Exception{
		kh_bean kh= khdao.ktdn(tendn, pass);
		return kh;
	}
	public kh_bean ktdk(String tendn) throws Exception{
		kh_bean kh= khdao.ktdk(tendn);
		return kh;
	}
	public void DangKy(String hoten, String us,String pass) throws Exception
	{
		khdao.Dangky(hoten, us, pass);
	}
	
}
