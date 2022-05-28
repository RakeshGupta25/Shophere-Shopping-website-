<%@page import="java.sql.*"%>
<%@page import="com.shophere.utility.DBConnection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="header.jsp"></jsp:include>

<style>
h3 {
	color: yellow;
	text-align: center;
}
</style>

<div style="color: blue; text-align: center; font-size: 30px;">
	Home <i class="fa fa-institution"></i>

</div>



<table>
	<thead>
		<tr>
			<th scope="col">ID</th>
			<th scope="col">Name</th>
			<th scope="col">Category</th>
			<th scope="col"><i class="fa fa-inr"></i>Price</th>
			<th scope="col">Add To Cart <i class="fas fa-cart-plus"></i></th>
		</tr>
	</thead>
	<tbody>


		<%
		int z = 0;

		try {
			String search = request.getParameter("search");
			Connection con = DBConnection.getDBCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from products where products_name like '%" +search+ "%' or category like '%"
			+ search + "%' and active='Yes'");
			while (rs.next()) {
				z = 1;
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><i class="fa fa-inr"></i><%=rs.getDouble(4)%></td>
			<td><a href="addTocartAction.jsp?id=<%=rs.getInt(1)%>">Add To Cart <i class="fas fa-cart-plus"></i></a></td>

		</tr>

		<%
		}
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>

	</tbody>
</table>
<%
if (z == 0) {
%>
<h1 style="color: white; text-align: center;">Nothing To Show</h1>
<%
}
%>
<br>
<br>
<br>
<div>
	<p>All right reserved by BTech Days</p>
</div>

</div>

<jsp:include page="footer.jsp"></jsp:include>
