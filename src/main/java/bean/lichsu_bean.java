package bean;

import java.util.Date;

public class lichsu_bean {
	private String tensach;
	private String masach;
	private Date NgayMua;
	private long SoLuongMua;
	private boolean damua;
	private long gia;
	private long makh;
	private long ThanhTien;
	private String hoten;
	public lichsu_bean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public lichsu_bean(String tensach, String masach, Date ngayMua, long soLuongMua, boolean damua, long gia, long makh,
			long thanhTien,String hoten) {
		super();
		this.tensach = tensach;
		this.masach = masach;
		NgayMua = ngayMua;
		SoLuongMua = soLuongMua;
		this.damua = damua;
		this.gia = gia;
		this.makh = makh;
		ThanhTien = thanhTien;
		this.hoten = hoten;
	}
	public String getTensach() {
		return tensach;
	}
	public void setTensach(String tensach) {
		this.tensach = tensach;
	}
	public String getMasach() {
		return masach;
	}
	public void setMasach(String masach) {
		this.masach = masach;
	}
	public Date getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(Date ngayMua) {
		NgayMua = ngayMua;
	}
	public long getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(long soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public long getMakh() {
		return makh;
	}
	public void setMakh(long makh) {
		this.makh = makh;
	}
	public long getThanhTien() {
		return ThanhTien;
	}
	public void setThanhTien(long thanhTien) {
		ThanhTien = thanhTien;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	
	
}
