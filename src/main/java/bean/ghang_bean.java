package bean;

public class ghang_bean {
	private long sl;
	private long thanhgia;
	private sach_bean sach;
	public ghang_bean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ghang_bean(long sl, long thanhgia, sach_bean sach) {
		super();
		this.sl = sl;
		this.thanhgia = thanhgia;
		this.sach = sach;
	}

	public long getSl() {
		return sl;
	}
	public void setSl(long sl) {
		this.sl = sl;
	}
	public long getThanhgia() {
		return thanhgia;
	}
	public void setThanhgia(long thanhgia) {
		this.thanhgia = thanhgia;
	}
	public sach_bean getSach() {
		return sach;
	}
	public void setSach(sach_bean sach) {
		this.sach = sach;
	}
	
}
