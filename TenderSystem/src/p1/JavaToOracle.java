package p1;
import java.sql.*;

public class JavaToOracle {

	public static void main(String[] args)throws Exception {
		JavaToOracle.getCon();
	}
	//D:\oraclexe\app\oracle\product\10.2.0\server\jdbc\lib
	public static Connection getCon()throws Exception{
		
		Connection conn=null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tender","tenderpass");
		System.out.println("Done ");
		return conn;
		
	}

}
