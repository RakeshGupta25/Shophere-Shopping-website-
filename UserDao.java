package com.shophere.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shophere.pojo.User;
import com.shophere.utility.DBConnection;


public class UserDao {
	
	Connection con = null;
	String sqlQuery=null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public boolean add(User user) throws Exception {
		con=DBConnection.getDBCon();
		sqlQuery="insert into user(fname,lname,uemail,password,role,address) values(?,?,?,?,?,?)";
		pstmt=con.prepareStatement(sqlQuery);
		pstmt.setString(1, user.getFname());
		pstmt.setString(2, user.getLname());
		pstmt.setString(3, user.getUemail());
		pstmt.setString(4, user.getPassword());
		pstmt.setString(5, user.getRole());
		pstmt.setString(6, user.getAddress());
		
		int i=pstmt.executeUpdate();
		DBConnection.closeCon();
		if(i>0)
		{
			return true;
		}
		return false;
	}

	public boolean update(User user) throws Exception {
		// TODO Auto-generated method stub
		con=DBConnection.getDBCon();
		sqlQuery="update User set fname=?,lname=?,uemail=?,password=?,role=?,address=? where userId=?";
		pstmt = con.prepareStatement(sqlQuery);
		pstmt.setString(1, user.getFname());
		pstmt.setString(2, user.getLname());
		pstmt.setString(3, user.getUemail());
		pstmt.setString(4, user.getPassword());
		pstmt.setString(5, user.getRole());
		pstmt.setString(6, user.getAddress());
		pstmt.setInt(7, user.getUserId());
		int i=pstmt.executeUpdate();
		if(i>0)
		{
			return true;
		}
		DBConnection.closeCon();
		return false;
	}

	public List<User> all() throws Exception {
		// TODO Auto-generated method stub
		con=DBConnection.getDBCon();
		List<User> ulist = new ArrayList<User>();
		sqlQuery="select * from user";
		pstmt=con.prepareStatement(sqlQuery);
		rs=pstmt.executeQuery();
		while(rs.next())
		{
			User user = new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
			ulist.add(user);
		}
		pstmt.close();
		rs.close();
		DBConnection.closeCon();
		return ulist;
	}

	public boolean delete(int userId) throws Exception {
		// TODO Auto-generated method stub
		con=DBConnection.getDBCon();
		sqlQuery="delete from user where userId=?";
		pstmt=con.prepareStatement(sqlQuery);
		pstmt.setInt(1, userId);
		int i=pstmt.executeUpdate();
		if(i>0)
		{
			return true;
		}
		DBConnection.closeCon();
		return false;
	}

	public User get(int userId) throws Exception {
		// TODO Auto-generated method stub
		con=DBConnection.getDBCon();
		sqlQuery="select * from user where userId=?";
		pstmt=con.prepareStatement(sqlQuery);
		pstmt.setInt(1, userId);
		rs=pstmt.executeQuery();
		while(rs.next())
		{
			User user=new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
			return user;
		}
		DBConnection.closeCon();
		
		return null;
	}

	public List<User> get(String fname) throws Exception {
		// TODO Auto-generated method stub
		con=DBConnection.getDBCon();
		sqlQuery="select * from user where fname like ?";
		pstmt=con.prepareStatement(sqlQuery);
		pstmt.setString(1, fname+"%");
		rs=pstmt.executeQuery();
		List<User> userList = new ArrayList<User>();
		while(rs.next())
		{
			User user = new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
			userList.add(user);
		}
		DBConnection.closeCon();
		return userList;
	}

	public List<User> get1(String lname) {
		// TODO Auto-generated method stub
		return null;
	}


	public User isLogin(String uemail, String password)throws Exception {
		con=DBConnection.getDBCon();
		sqlQuery="select * from user where uemail=? and password=?";
		pstmt=con.prepareStatement(sqlQuery);
		pstmt.setString(1, uemail);
		pstmt.setString(2, password);
		rs=pstmt.executeQuery();
		while(rs.next())
		{
			User user=new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
			return user;
		}
		DBConnection.closeCon();
		
		return null;
	}


}
