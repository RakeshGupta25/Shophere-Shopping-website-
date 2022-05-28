<%@page import="com.shophere.myservlet.AddToCartServlet"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="com.shophere.utility.DBConnection"%>
<%@ page import="com.shophere.dao.ProductDao"%>
<%@ page import="com.shophere.pojo.Products"%>
<%@ page import="com.shophere.pojo.Cart"%>
<%@ page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>




<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add-To-Cart</title>
<style type="text/css">
.table .tbody td {
	vartical-align: middle;
}

.btn-incre .btn-decre {
	box-shadow: none;
	font-size: 50px;
}

h3 {
	color: maroon;
	text-align: center;
}

.col {
	background-color: yellow;
}

.hea{
background-color: orange;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
		<br>
		<div style="text-align: center; color: blue; font-size: 30px">
			My Cart<i class="fas fa-cart-arrow-down"></i>
		</div>

		<%
		String msg = request.getParameter("msg");
		if ("notpossible".equals(msg)) {
		%>

		<h3 class="alert" style="text-align: center; color: red;">There is only one Quantity! So click on remove</h3>
		<%
		}
		%>
		<%
		if ("inc".equals(msg)) {
		%>
		<h3 class="alert" style="text-align: center; color: maroon;">Quantity Increased Successfully!</h3>
		<%
		}
		%>
		<%
		if ("dec".equals(msg)) {
		%>
		<h3 class="alert" style="text-align: center; color: maroon;">Quantity Decreased Successfully!</h3>
		<%
		}
		%>
		<%
		if ("removed".equals(msg)) {
		%>
		<h3 class="alert" style="text-align: center; color: red;">Products Successfully Removed!</h3>
		<%
		}
		%>




	
			<table class="table table-light" border="4" style="text-align: center;">
				<thead>
					<%
					int total = 0;
					int sno = 0;
					try {

						Connection con = DBConnection.getDBCon();
						Statement st = con.createStatement();
						ResultSet rs1 = st.executeQuery("select SUM(Sub_Total) from cart");
						while (rs1.next()) {
							total = rs1.getInt(1);
						}
					%>

					<tr>
						<th scope="col" style="background-color: yellow;">Total
							Price: <i class="fa fa-inr "></i> <%
 out.println(" " + total);
 %>
						</th>
						<%
						if (total > 0) {
						%>
						<th scope="col"><a href="order.jsp">Proceed to Order</a></th>
						<%
						}
						%>
					</tr>
				</thead>
				<thead>
					<tr bordercolor="#000080">

						<th scope="col" style="background-color: #7CFC00">S.No</th>
						<th scope="col" style="background-color: #7CFC00">Product Id</th>
						<th scope="col" style="background-color: #7CFC00">Image</th>
						<th scope="col" style="background-color: #7CFC00">Product Name</th>
						<th scope="col" style="background-color: #7CFC00">Category</th>
						<th scope="col" style="background-color: #7CFC00">Price</th>
						<th scope="col" style="background-color: #7CFC00">Quantity</th>
						<th scope="col" style="background-color: #7CFC00">Sub Total</th>
						<th scope="col" style="background-color: #7CFC00">Action</th>
					</tr>
				</thead>
				<tbody>
					<%
					ResultSet rs = st.executeQuery("select * from products inner join cart on products.products_id=cart.products_id");
					while (rs.next()) {
					%>
					
					<tr>
						<%
						sno = sno + 1;
						%>
						<td>
							<%
							out.println(sno);
							%>
						</td>
						<td><%=rs.getInt(1)%></td>
						<td><img src="img\<%=rs.getString(5)%>" class="card-img"
							alt="image not found" style="height: 150px; width: 150px"></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td class="fa fa-inr"><%=rs.getDouble(4)%></td>
						<td>
							<form action="add-to-cart" method="post" class="form-inline">
								<input type="hidden" name="id" value="<%=rs.getInt(6) %>" class="form-input">
								<div class="form-group d-flex justify-content-between">
									<a class="btn btn-sm btn-decre"
										href="Inc_Dec_Quantity.jsp?product_id=<%=rs.getInt(1)%>&quantity=dec">
										<i class="fas fa-minus-square"></i>
									</a>
									 <input style="text-align: center;" size="4" type="text" name="Quantity"
										class="form-control" value="<%=rs.getInt(12)%>"> <a
										class="btn btn-sm btn-incre"
										href="Inc_Dec_Quantity.jsp?product_id=<%=rs.getInt(1)%>&quantity=inc" ><i
										class="fas fa-plus-square"></i></a>
								</div>
							</form>
						</td>

						<td class="fa fa-inr"><%=rs.getDouble(4) * rs.getInt(12)%></td>
						<td><a href="removefromcart.jsp?product_id=<%=rs.getInt(1)%>">Remove
								<i class="fas fa-trash-alt"></i>
						</a></td>
					</tr>

					<%
					}
					} catch (Exception e) {
					e.printStackTrace();
					}
					%>

				</tbody>





			</table>

		

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>