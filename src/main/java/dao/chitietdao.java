package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.xacnhanbean;

public class chitietdao {
	ArrayList<xacnhanbean> ds=new ArrayList<xacnhanbean>();
	public int them(String masach, long slmua,long mahd) throws Exception{
		ketnoidao kn=new ketnoidao();
		kn.ketnoi();
		String sql="insert into ChiTietHoaDon(masach,SoLuongMua,MaHoaDon,damua) values (?,?,?,?)";
		PreparedStatement cmd=kn.cn.prepareStatement(sql);
		cmd.setString(1, masach);
		cmd.setLong(2, slmua);
		cmd.setLong(3, mahd);
		cmd.setBoolean(4, false);
		int kq=cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	public int CapNhat(long machitiet) throws Exception {
		ketnoidao kn=new ketnoidao();
		kn.ketnoi();
		String sql="update ChiTietHoaDon set damua='1' where MaChiTietHD=?";
		PreparedStatement cmd=kn.cn.prepareStatement(sql);
		cmd.setLong(1, machitiet);
		int kq=cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	public ArrayList<xacnhanbean> getHoaDonChuaXN() throws Exception{
		ketnoidao kn=new ketnoidao();
		kn.ketnoi();
		String sql="select * from Vxacnhan";
		PreparedStatement cmd=kn.cn.prepareStatement(sql);
		ResultSet rs=cmd.executeQuery();
		while(rs.next())
		{
			long makh=rs.getLong("makh");
			String hoten=rs.getString("hoten");
			String tensach=rs.getString("tensach");
			long gia=rs.getLong("gia");
			Date NgayMua=rs.getDate("NgayMua");
			long SoLuongMua=rs.getLong("SoLuongMua");
			boolean damua=rs.getBoolean("damua");
			long ThanhTien=rs.getLong("ThanhTien");
			long MaChiTietHD=rs.getLong("MaChiTietHD");
			ds.add(new xacnhanbean(makh, hoten, tensach, gia, NgayMua, SoLuongMua, damua, ThanhTien, MaChiTietHD));
		}
		rs.close();kn.cn.close();
		return ds;
	}
}
