<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<jsp:include page="header.jsp"></jsp:include>
    
<div class="container">
		<div class='row'>
			<div class='col'>
			<!-- Success message printing -->
			<jsp:include page="message.jsp"></jsp:include>
				<h2 style="color: darkblue; margin-top: 20px">New Product ADDED Here</h2>
			</div>
		</div>
		<div class="row">
			<div class='col'>
				
				<img src="img/revenge shopping.jpg" alt="image not found" width="520px" height="330px" style="margin-top: 30px">
			</div>
			
			<div class='col'>
				<form action="do.productoperation" method="post">
					<input type="hidden" name="action" value="addproduct">
					<div class="mb-3">
						<label for="product_Name" class="form-label">Product Name</label> <input
							type="text" class="form-control" id="product_Name" name="product_Name">
					</div>
					 
					<div class="mb-3">
						<label for="category" class="category">Category</label> <input
							type="text" class="form-control" id="category" name="category">
					</div>
					
					<div class="mb-3">
						<label for="Price" class="form-label">Price</label> <input
							type="text" class="form-control" id="Price" name="Price">
					</div>
					
					<div class="mb-3">
						<label for="image" class="category">Image Name</label> <input
							type="text" class="form-control" id="image" name="image">
					</div>

					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
							
				
			</div>
		</div>
	</div>
	
	 <jsp:include page="footer.jsp"></jsp:include>