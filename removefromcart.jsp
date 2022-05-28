<%@page import="com.shophere.utility.DBConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
    int id = Integer.parseInt(request.getParameter("product_id"));
    String Name=request.getParameter("product_Name");
    
    try{
    	Connection con=DBConnection.getDBCon();
    	Statement st =con.createStatement();
    	st.executeUpdate("delete from cart where products_id="+id+"");
    	response.sendRedirect("cart.jsp?msg=removed");
    }
    catch(Exception e){
    	
    	e.printStackTrace();
    }
    	
    %>