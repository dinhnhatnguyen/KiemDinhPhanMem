package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.lichsu_bean;

public class lichsu_dao {
	ArrayList<lichsu_bean> ds = new ArrayList<lichsu_bean>();
	public ArrayList<lichsu_bean> getLS() throws Exception{
		String sql="select * from Vhuhu order by NgayMua desc";
		ketnoidao kn= new ketnoidao();
		kn.ketnoi();
		PreparedStatement cmd=kn.cn.prepareStatement(sql);
		ResultSet rs=cmd.executeQuery();
		while(rs.next()) {
			String tensach=rs.getString("tensach");
			String masach=rs.getString("masach");
			Date ngayMua= rs.getDate("NgayMua");
			long soLuongMua=rs.getLong("SoLuongMua");
			boolean damua=rs.getBoolean("damua");
			long gia=rs.getLong("gia");
			long makh=rs.getLong("makh");
			long thanhTien=rs.getLong("ThanhTien");
			String hoten=rs.getString("hoten");
			ds.add(new lichsu_bean(tensach, masach, ngayMua, soLuongMua, damua, gia, makh, thanhTien, hoten));
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
}
