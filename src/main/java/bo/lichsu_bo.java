package bo;

import java.util.ArrayList;

import bean.lichsu_bean;
import dao.lichsu_dao;

public class lichsu_bo {
	lichsu_dao ldao=new lichsu_dao();
	public ArrayList<lichsu_bean> getLS() throws Exception{
		return ldao.getLS();
	}
}
