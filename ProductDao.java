package com.shophere.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shophere.pojo.Cart;
import com.shophere.pojo.Products;
import com.shophere.utility.DBConnection;

public class ProductDao {
	
	public ProductDao(){
	}
	

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sqlQuery = null;
	
	public ProductDao(Connection con) {
		this.con = con;
	}

	public boolean add(Products products) throws Exception {
		con = DBConnection.getDBCon();

		sqlQuery = "insert into products(product_name,category,Price,image) values (?,?,?,?)";

		pstmt = con.prepareStatement(sqlQuery);

		pstmt.setString(1, products.getProduct_Name());
		pstmt.setString(2, products.getCategory());
		pstmt.setDouble(3, products.getPrice());
		pstmt.setString(4, products.getImage());

		int i = pstmt.executeUpdate();

		DBConnection.closeCon();
		if (i > 0) {
			return true;
		}

		return false;
	}

	// --------------------------------------------------------------------------------------------------

	public boolean update(Products products) throws Exception {
		con = DBConnection.getDBCon();

		sqlQuery = "update products set product_name=?,category=?,Price=?,image=? where products_id=?";
		pstmt = con.prepareStatement(sqlQuery);
		pstmt.setString(1, products.getProduct_Name());
		pstmt.setString(2, products.getCategory());
		pstmt.setDouble(3, products.getPrice());
		pstmt.setString(4, products.getImage());
		pstmt.setInt(5, products.getProduct_id());
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		DBConnection.closeCon();
		return false;
	}

	// --------------------------------------------------------------------------------------------------

	public List<Products> all() throws Exception {

		con = DBConnection.getDBCon();
		List<Products> flist = new ArrayList<Products>();

		sqlQuery = "select * from products";
		pstmt = con.prepareStatement(sqlQuery);

		rs = pstmt.executeQuery();

		while (rs.next()) {
			Products products = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4),
					rs.getString(5));

			flist.add(products);
		}
		pstmt.close();
		rs.close();
		DBConnection.closeCon();

		return flist;
	}
	// --------------------------------------------------------------------------------------------------

	public boolean delete(int product_id) throws Exception {

		con = DBConnection.getDBCon();
		sqlQuery = " delete from products where products_id=?";
		pstmt = con.prepareStatement(sqlQuery);
		pstmt.setInt(1, product_id);
		int i = pstmt.executeUpdate();

		if (i > 0) {
			return true;
		}
		DBConnection.closeCon();
		return false;

	}
	// --------------------------------------------------------------------------------------------------

	public Products get(int product_id) throws Exception {

		con = DBConnection.getDBCon();
		sqlQuery = " select * From products Where products_id=?";
		pstmt = con.prepareStatement(sqlQuery);
		pstmt.setInt(1, product_id);

		rs = pstmt.executeQuery();
		while (rs.next()) {
			Products products = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4),
					rs.getString(5));
			return products;
		}
		DBConnection.closeCon();
		return null;

	}

	// --------------------------------------------------------------------------------------------------
	public List<Products> get(String product_Name) throws Exception {
		con = DBConnection.getDBCon();
		sqlQuery = "select * From product Where product_Name like ?";
		pstmt = con.prepareStatement(sqlQuery);
		pstmt.setString(1, product_Name + "%");

		rs = pstmt.executeQuery();
		List<Products> productsList = new ArrayList<Products>();

		while (rs.next()) {
			Products products = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4),
					rs.getString(5));
			productsList.add(products);
		}

		DBConnection.closeCon();
		return productsList;
	}

	// --------------------------------------------------------------------------------------------------
	public List<Products> sortByPrice(boolean flag) throws Exception {
		con = DBConnection.getDBCon();
		sqlQuery = " select* from products order by Price  asc";
		pstmt = con.prepareStatement(sqlQuery);
		List<Products> productsList = new ArrayList<Products>();
		rs = pstmt.executeQuery();

		while (rs.next()) {
			Products products = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4),
					rs.getString(5));
			productsList.add(products);
		}
		DBConnection.closeCon();
		return productsList;
	}

	// --------------------------------------------------------------------------------------------------

	public List<Products> sortByName(boolean flag) throws Exception {
		con = DBConnection.getDBCon();
		if (flag == true) {
			sqlQuery = "select* from products order by product_Name  asc";
		} else {
			sqlQuery = "select* from products order by product_Name  desc";
		}
		pstmt = con.prepareStatement(sqlQuery);
		List<Products> productsList = new ArrayList<Products>();
		rs = pstmt.executeQuery();

		while (rs.next()) {
			Products products = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4),
					rs.getString(5));
			productsList.add(products);
		}
		DBConnection.closeCon();

		return productsList;
	}

	public List<Cart> getCartsProducts(ArrayList<Cart> cartList) throws Exception {
		List<Cart> cart = new ArrayList<Cart>();
		
		
		
		if (cartList.size() > 0) {
			for (Cart item : cartList) {
				sqlQuery = "select * from products where products_id=?";
				pstmt = con.prepareStatement(sqlQuery);
				pstmt.setInt(1, item.getProduct_id());
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Cart row = new Cart();
					row.setProduct_id(rs.getInt("products_id"));
					row.setProduct_Name(rs.getString("product_name"));
					row.setCategory(rs.getString("category"));
					row.setPrice(rs.getDouble("Price"));	
					row.setImage(rs.getString("image"));
					row.setQuantity(item.getQuantity());
					row.setPrice(rs.getDouble("Price")*item.getQuantity());
					cart.add(row);
				}

			}
			
			
		}
		return cart;

	}

}
