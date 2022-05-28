package com.shophere.myservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.shophere.dao.ProductDao;
import com.shophere.pojo.Cart;
import com.shophere.pojo.Products;
import com.shophere.utility.DBConnection;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
	
	
		
		
		Products p = null;
		ProductDao pDao = new ProductDao();
		Cart c = new Cart();
		
		
		HttpSession session = null;
		
		

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
		response.setContentType("text/html");

		session = request.getSession();
		int id = Integer.parseInt(request.getParameter("product_id"));
		p = pDao.get(id);
		int quantity=1;
		double product_price=0;
		double product_total=0;
		double cart_total=0;
		String Name = p.getProduct_Name();
		
		System.out.println("Done-1");
		System.out.println(p);
		int z=0;
		
			Connection con = DBConnection.getDBCon();
			Statement st = con.createStatement();		
			product_price=p.getPrice();
			product_total=product_price;
		
		ResultSet rs1 = st.executeQuery("select * from cart where  products_id="+id+"");
		while (rs1.next()) {
			cart_total=rs1.getInt(5);
			cart_total=cart_total+product_total;
			quantity=rs1.getInt(7);
			quantity=quantity+1;
			z=1;
		}
		
		if(z==1)
		{
			st.executeUpdate("update cart set Sub_Total="+quantity*product_price+",Quantity="+quantity+" where products_id="+id+"");
			response.sendRedirect("productlist.jsp?msg=exist");
		}
		

		if(z==0)
		{
		
			PreparedStatement pstmt=con.prepareStatement("insert into cart(products_id,Product_Name,category,Price,Image,Quantity,Sub_Total) values(?,?,?,?,?,?,?)");
			pstmt.setInt(1, p.getProduct_id());
			pstmt.setString(2, p.getProduct_Name());
			pstmt.setString(3, p.getCategory());
			pstmt.setDouble(4, p.getPrice());
			pstmt.setString(5, p.getImage());
			pstmt.setInt(6, quantity);
			pstmt.setDouble(7, c.getPrice()*quantity);
			System.out.println(pstmt);
			pstmt.executeUpdate();
			response.sendRedirect("productlist.jsp?msg=added");
		}
		
	}
catch(Exception e) {
	e.printStackTrace();
}
	

}
}