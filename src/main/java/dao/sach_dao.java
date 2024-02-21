package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.sach_bean;

public class sach_dao {
	public ArrayList<sach_bean> getsach() throws Exception{
		ArrayList<sach_bean> ds = new ArrayList<sach_bean>();
		ketnoidao kn=new ketnoidao();
		kn.ketnoi();
		String sql="select * from sach";
		PreparedStatement cmd=kn.cn.prepareStatement(sql);
		ResultSet rs =cmd.executeQuery();
		while(rs.next())
		{
			String masach=rs.getString("masach");
			String tensach=rs.getString("tensach");
			String tacgia=rs.getString("tacgia");
			long gia=rs.getLong("gia");
			long soluong=rs.getLong("soluong");
			String anh=rs.getString("anh");
			String maloai=rs.getString("maloai");
			ds.add(new sach_bean(masach,tensach,tacgia,gia,soluong,anh,maloai));
		}
		return ds;
	}
	public int ThemSach(String masach,String tensach,long soluong,long gia,String maloai,String anh,String tacgia) throws Exception
	{
		ketnoidao kn=new ketnoidao();
		kn.ketnoi();
		String sql="insert into sach(masach,tensach,soluong,gia,maloai,anh,tacgia) values(?, ?,?,?,?,?,?)";
		PreparedStatement cmd=kn.cn.prepareStatement(sql);
		cmd.setString(1, masach);
		cmd.setString(2, tensach);
		cmd.setLong(3, soluong);
		cmd.setLong(4, gia);
		cmd.setString(5,maloai);
		cmd.setString(6, anh);
		cmd.setString(7, tacgia);		
		int kq= cmd.executeUpdate();
		cmd.close();kn.cn.close();
		return kq;
	}
	public int SuaSach(String masach,String tensach,long soluong,long gia,String maloai,String anh,String tacgia) throws Exception{
		ketnoidao kn=new ketnoidao();
		kn.ketnoi();
		String sql="update sach set tensach=?,soluong=?,gia=?,maloai=?,anh=?,tacgia=? where masach=?";
		PreparedStatement cmd=kn.cn.prepareStatement(sql);
		cmd.setString(7, masach);
		cmd.setString(1, tensach);
		cmd.setLong(2, soluong);
		cmd.setLong(3, gia);
		cmd.setString(4,maloai);
		cmd.setString(5, anh);
		cmd.setString(6, tacgia);	
		int kq= cmd.executeUpdate();
		cmd.close();kn.cn.close();
		return kq;
	}
	public int XoaSach(String masach) throws Exception{
		ketnoidao kn=new ketnoidao();
		kn.ketnoi();
		String sql="delete from sach where masach=?";
		PreparedStatement cmd=kn.cn.prepareStatement(sql);
		cmd.setString(1, masach);
		int kq= cmd.executeUpdate();
		cmd.close();kn.cn.close();
		return kq;
	}
}
