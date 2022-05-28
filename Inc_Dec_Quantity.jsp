
<%@page import="com.shophere.utility.DBConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <%
    int id = Integer.parseInt(request.getParameter("product_id"));
    String Name=request.getParameter("product_Name");
    String incdec=request.getParameter("quantity");
    int price=0;
    int total=0;
    int quantity=0;
    int final_total=0;
    
    
    try{
    	Connection con=DBConnection.getDBCon();
    	Statement st =con.createStatement();
    	ResultSet rs=st.executeQuery("select * from cart where  products_id="+id+"");
    	while(rs.next()){
    		
    		price=rs.getInt(5); 
    		total=rs.getInt(8);    		
    		quantity=rs.getInt(7);
    		
    		
    	}
    	if(quantity==1 && incdec.equals("dec"))
    		response.sendRedirect("cart.jsp?msg=notpossible");
    		
    	else if(quantity!=1 && incdec.equals("dec"))
    	{
    		
    		total=total-price;
    		quantity=quantity-1;
    		st.executeUpdate("update cart set Sub_Total="+total+", Quantity="+quantity+" where products_id="+id+"");
    		response.sendRedirect("cart.jsp?msg=dec");
    	}
    	else{
    		total=total+price;
    		quantity=quantity+1;
    		st.executeUpdate("update cart set Sub_Total="+total+", Quantity="+quantity+" where products_id="+id+"");
    		response.sendRedirect("cart.jsp?msg=inc");
    		
    		
    	}
    		
    	
    }
    catch(Exception e){
    	e.printStackTrace();
    }
    
    %>
    
    