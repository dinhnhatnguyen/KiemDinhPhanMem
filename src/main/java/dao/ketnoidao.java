package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ketnoidao {
	public  Connection cn;
	public void ketnoi() throws Exception{
		//B1: xác định hqtcsdl
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		System.out.print("đã kết nối");
		String url="jdbc:sqlserver://DESKTOP-HPRJ4H7:1433;databaseName=QlSach; user=sa; password=123456";
		cn=DriverManager.getConnection(url);
		System.out.print("da ket noi");
	}
}
