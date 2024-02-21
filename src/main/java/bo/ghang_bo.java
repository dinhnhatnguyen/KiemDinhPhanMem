package bo;

import java.util.ArrayList;
import java.util.List;

import bean.ghang_bean;
import bean.sach_bean;

public class ghang_bo {
	public List<ghang_bean> ds = new ArrayList<ghang_bean>();

	public void Them(long sl, long thanhgia,sach_bean sach)
	{	
		sl = 1;
		thanhgia = sach.getGia() * sl ;
		int n = ds.size();
		for(int i = 0 ; i < n ; i++) {
			if(ds.get(i).getSach().getMasach().equals(sach.getMasach())) {
				sl = ds.get(i).getSl() + 1;
				thanhgia = ds.get(i).getSach().getGia() * sl;
				ds.get(i).setSl(sl);
				ds.get(i).setThanhgia(thanhgia);
				return;
			}
		}
		
	ghang_bean h=new ghang_bean(sl, thanhgia, sach);
	ds.add(h);
	}
	public long Tongtien(){
		int n=ds.size();
		long s=0;
		for(int i=0;i<n;i++){
			s=s+ds.get(i).getThanhgia();
		}
	return s;
	}
	public void Xoa(String masach)
	{
		for(ghang_bean h:ds)
			if(h.getSach().getMasach().equals(masach))
			{
				ds.remove(h);
				return;
			}
	}
	public void Sua(String masach, long slmoi)
	{
		int n=ds.size();
		for(int i=0;i<n;i++)
		{
			ghang_bean h=ds.get(i);
			if(h.getSach().getMasach().equals(masach))
			{
				h.setSl(slmoi);
				h.setThanhgia(slmoi * h.getSach().getGia());
				return;
			}
		}
	}
}
