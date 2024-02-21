package bo;

import java.util.ArrayList;

import bean.xacnhanbean;
import dao.chitietdao;

public class chitietbo {
	chitietdao cdao=new chitietdao();
	public int them(String masach, long slmua,long mahd) throws Exception{
		
		return cdao.them(masach, slmua, mahd);
	}
	public int CapNhat(long machitiet) throws Exception{
		return cdao.CapNhat(machitiet);
	}
	public ArrayList<xacnhanbean> getHoaDonChuaXN() throws Exception{
		return cdao.getHoaDonChuaXN();
	}
}
