package com.shophere.utility;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {
	
	private DBConnection() {
	}
	
	private static Connection con = null;
	
	public static Connection getDBCon() throws Exception
	{
		Properties prop = new Properties();
		prop.load(new FileInputStream("C:\\Users\\Admin\\eclipse-workspace\\OnlineShoppingStore\\db.properties"));
		
		//2 . Register driver
		Class.forName(prop.getProperty("driver"));
	
		//3. Establish the connection
		
		con = DriverManager.getConnection(prop.getProperty("url"), prop);
		//System.out.println("Connection Open");
		return con;
	}
	
	public static void closeCon() throws SQLException 
	{
		if(con!=null) 
		{
			con.close();
	//		System.out.println("Connection Closed");
		}
	}


}
