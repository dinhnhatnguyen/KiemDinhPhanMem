package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loai_bean;

public class loai_dao {
	public ArrayList<loai_bean> getloai() throws Exception{
		ArrayList<loai_bean> ds= new ArrayList<loai_bean>();
		//ketnoi vao csdl
		ketnoidao kn=new ketnoidao();
		kn.ketnoi();
		//Tao cau lenh SQL
		String sql="select * from loai";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//Thực hiện lệnh
		ResultSet rs = cmd.executeQuery();
		//DUyet rs de luu vao ds
		while(rs.next())
		{
			String maloai=rs.getString("maloai");
			String tenloai=rs.getString("tenloai");
			ds.add(new loai_bean(maloai,tenloai) );
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	public int ThemLoai(String maloai,String tenloai) throws Exception
	{
		ketnoidao kn=new ketnoidao();
		kn.ketnoi();
		String sql="insert into loai(maloai,tenloai) values(?, ?)";
		PreparedStatement cmd=kn.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		cmd.setString(2, tenloai);
		int kq= cmd.executeUpdate();
		cmd.close();kn.cn.close();
		return kq;
	}
	public int SuaLoai(String maloai,String tenloai) throws Exception{
		ketnoidao kn=new ketnoidao();
		kn.ketnoi();
		String sql="update loai set tenloai=? where maloai=?";
		PreparedStatement cmd=kn.cn.prepareStatement(sql);
		cmd.setString(1, tenloai);
		cmd.setString(2, maloai);
		int kq= cmd.executeUpdate();
		cmd.close();kn.cn.close();
		return kq;
	}
	public int XoaLoai(String maloai) throws Exception{
		ketnoidao kn=new ketnoidao();
		kn.ketnoi();
		String sql="delete from loai where maloai=?";
		PreparedStatement cmd=kn.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		int kq= cmd.executeUpdate();
		cmd.close();kn.cn.close();
		return kq;
	}
}
