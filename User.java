package com.shophere.pojo;

public class User {

	private int userId;
	private String fname;
	private String lname;
	private String uemail;
	private String password;
	private String role;
	private String address;
	
	
	
	public User() {
		super();
	}

	
	


	public User(String fname, String lname, String uemail, String password, String role, String address) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.uemail = uemail;
		this.password = password;
		this.role = role;
		this.address = address;
	}





	public User(int userId, String fname, String lname, String uemail, String password, String role, String address) {
		super();
		this.userId = userId;
		this.fname = fname;
		this.lname = lname;
		this.uemail = uemail;
		this.password = password;
		this.role = role;
		this.address = address;
		
	}



	public int getUserId() {
		return userId;
	}



	public void setUserId(int userId) {
		this.userId = userId;
	}



	public String getFname() {
		return fname;
	}



	public void setFname(String fname) {
		this.fname = fname;
	}



	public String getLname() {
		return lname;
	}



	public void setLname(String lname) {
		this.lname = lname;
	}



	public String getUemail() {
		return uemail;
	}



	public void setUemail(String uemail) {
		this.uemail = uemail;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getRole() {
		return role;
	}



	public void setRole(String role) {
		this.role = role;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	@Override
	public String toString() {
		return "User [userId=" + userId + ", fname=" + fname + ", lname=" + lname + ", uemail=" + uemail + ", password="
				+ password + ", role=" + role + ", address=" + address + "]";
	}
	
	
	
	
	
	
}
