<%@ page import="com.shophere.pojo.Products"%>

<%@ page import="java.util.List"%>
<%@ page import="com.shophere.dao.ProductDao"%>

<%@ page import="com.shophere.pojo.User"%>

<%@page import="com.shophere.myservlet.ProductServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products List</title>
<style>
body{
    margin: 0px;
    padding: 0px;
}

trans:hover{
    transform: scale(1.2);
    transition: transform .2s;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="message.jsp"></jsp:include>


<%
		String msg = request.getParameter("msg");
		if ("added".equals(msg)) {
		%>

		<h3 class="alert" style="text-align: center; color: green;">Products added successfully!</h3>
		<%
		}
		%>
		<%
		if ("exist".equals(msg)) {
		%>
		<h3 class="alert" style="text-align: center; color: maroon;">Product already exist in your cart! Quantity increased</h3>
		<%
		} 
		%>


<%
/*
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

*/


%>

<%
User user = new User();
ProductDao pd = new ProductDao();
List<Products> products = pd.all();
%>

<div class="container">
	<div class="card-header my-2"><h1 style="text-align: center; font-family: fantasy; color: darkblue;">All Products</h1"></div>
	<div class="row">
		<%
		if (!products.isEmpty()) {
			for (Products p : products) {
		%>

		<div class="col-md-3 my-3 trans">
			<div class="card w-100" style="width: 18rem;">
			
				<img src="img\<%=p.getImage()%>" class="card-img-top" alt="..."
					style="height: 250px; width: 250px"; >
				<div class="card-body">
					<h5 class="card-name"><%=p.getProduct_Name()%></h5>
					<h5 class="card-price">
						M.R.P. &#8377;<%=p.getPrice()%></h5>
					<h6 class="card-category">
						Category:
						<%=p.getCategory()%></h6>
					
					
					
					<core:if test="${user.role=='owner' or user.role=='admin' }">
					

						<a
							onclick="return confirm('Do you want to delete <%=p.getProduct_Name()%>')"
							href="
							do.productoperation?action=deleteproduct&product_id=<%=p.getProduct_id()%>"
							class="btn btn-danger"><i class="fas fa-trash"></i></a>

						<a data-bs-toggle="modal"
							data-bs-target="#update-products-<%=p.getProduct_id()%>"
							class="btn btn-warning"><i class="fas fa-edit"></i></a>


						<!-- --------------------UPDATE CODE -------------------------------------------->
						<!-- Modal -->
						<div class="modal fade" id="update-products-<%=p.getProduct_id()%>"
							tabindex="-1" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog">



								<div class="modal-content">
									<form action="do.productoperation" method="post">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Update
												Product</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>


										<div class="modal-body">

											<input type="hidden" name="action" value="updateproduct">
											<input type="hidden" name="action" value="addproduct">
											<div class="mb-3">


												<label for="products_id" class="form-label">Product Id</label> <input
													type="text" class="form-control" id="products_id"
													name="products_id" value="<%=p.getProduct_id()%>" readonly>
											</div>
											<div class="mb-3">
												<label for="product_Name" class="form-label">Product Name</label> <input
													type="text" class="form-control" id="product_Name"
													name="product_Name" value="<%=p.getProduct_Name()%>">
											</div>
											<div class="mb-3">
												<label for="category" class="form-label">Category</label> <input
													type="text" class="form-control" id="category"
													name="category" value="<%=p.getCategory()%>">
											</div>
											<div class="mb-3">

												<label for="Price" class="form-label">Price</label>
												<input type="text" class="form-control" id="Price"
													name="Price" value="<%=p.getPrice()%>">
											</div>
											<div class="mb-3">
												<label for="image" class="form-label">Image</label> <input
													type="text" class="form-control" id="image"
													name="image" value="<%=p.getImage()%>">
											</div>



										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
											<button type="submit" class="btn btn-primary">Update</button>
										</div>
								</div>
								</form>

							</div>
						</div>
					</core:if>

					


					


						<a href="add-to-cart?product_id=<%=p.getProduct_id()%>"
							class="btn btn-dark"><i class="fas fa-cart-plus"></i></a>
						<a href="#" class="btn btn-primary">BuyNow</a>


					
				</div>
			</div>
		</div>

		<%
		}
		}
		%>
	</div>
</div>


<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>