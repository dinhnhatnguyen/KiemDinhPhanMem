package dao;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.kh_bean;

public class kh_dao {
	ketnoidao kn=new ketnoidao();
	public ArrayList<kh_bean> getKH() throws Exception{
		ArrayList<kh_bean> ds=new ArrayList<kh_bean>();
		String sql="select * from KhachHang";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs= cmd.executeQuery();
		while(rs.next())
		{
			long makh = rs.getLong("makh");
			String hoten=rs.getString("hoten");
			String diachi=rs.getString("diachi");
			String sodt=rs.getString("sodt");
			String email=rs.getString("email");
			String tendn=rs.getString("tendn");
			String pass=rs.getString("pass");
			ds.add(new kh_bean(makh,hoten,diachi,sodt,email,tendn,pass));
		}
		return ds;
	}
	public static String encryptMD5(String password) throws Exception {
		MessageDigest m = MessageDigest.getInstance("MD5");
		m.update(password.getBytes(), 0, password.length());
		return new BigInteger(1, m.digest()).toString(16);
	}
	public void Dangky(String hoten, String us,String pass) throws Exception
	{
		String sql="insert into [KhachHang](hoten,tendn,pass) values (?,?,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, hoten);
		cmd.setString(2, us);
		cmd.setString(3, encryptMD5(pass));
		cmd.executeUpdate();	
	}
	public kh_bean ktdk(String tendn) throws Exception
	{
		kn.ketnoi();
		String sql="select * from KhachHang where tendn=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tendn);
		ResultSet rs= cmd.executeQuery();
		kh_bean kh=null;
		if(rs.next())
		{
			long makh = rs.getLong("makh");
			String hoten=rs.getString("hoten");
			String diachi=rs.getString("diachi");
			String sodt=rs.getString("sodt");
			String email=rs.getString("email");
			String tdn=rs.getString("tendn");
			String pss=rs.getString("pass");
			kh=new kh_bean(makh,hoten,diachi,sodt,email,tdn,pss);
		}
		return kh;
	}
	public kh_bean ktdn(String tendn, String pass) throws Exception
	{
		kn.ketnoi();
		String sql="select * from KhachHang where tendn=? and pass=?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tendn);
		cmd.setString(2, encryptMD5(pass));
		ResultSet rs= cmd.executeQuery();
		kh_bean kh=null;
		if(rs.next())
		{
			long makh = rs.getLong("makh");
			String hoten=rs.getString("hoten");
			String diachi=rs.getString("diachi");
			String sodt=rs.getString("sodt");
			String email=rs.getString("email");
			String tdn=rs.getString("tendn");
			String pss=rs.getString("pass");
			kh=new kh_bean(makh,hoten,diachi,sodt,email,tdn,pss);
		}
		return kh;
	}
	
}
