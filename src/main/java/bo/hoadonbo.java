package bo;

import dao.hoadondao;

public class hoadonbo {
	hoadondao hdao=new hoadondao();
	public int them(long makh) throws Exception{
		return hdao.them(makh);
	}
	public long getMaxHD() throws Exception{
		return hdao.getMaxHD();
	}
}
