<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="container">
		<div class='row'>
			<div class='col'>
			<!-- Success message printing -->
			<jsp:include page="message.jsp"></jsp:include>
				<h2 style="margin-left: 150px; margin-top:10px; color: maroon;">Register here..!!</h2>
			</div>
		</div>
		<div class="row" style="text-align: center;">
			<div class='col' style="align-items: center;">
				<img src="img/register.jpg" alt="image not found" width="300px" height="230px" style="margin-top: 10px">
				<img src="img/reg.gif" alt="image not found" width="300px" height="100px" style="margin-top: 10px">
			</div>
			
			<div class='col'>
				<form action="do.useroperation" method="post">
					<input type="hidden" name="action" value="signup">
					<div class="mb-3">
						<label for="fname" class="form-label">First Name</label> <input
							type="text" class="form-control" id="fname" name="fname">
					</div>
					<div class="mb-3">
						<label for="lname" class="form-label">Last Name</label> <input
							type="text" class="form-control" id="fname" name="lname">
					</div>
					<div class="mb-3">
						<label for="uemail" class="form-label">User Email</label> <input
							type="text" class="form-control" id="uemail" name="uemail">
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">Password</label> <input
							type="password" class="form-control" id="password" name="password">
					</div>
					<div class="mb-3">
						<label for="role" class="form-label"> User role</label> <input
							type="text" class="form-control" id="role" name="role">
					</div>
					<div class="mb-3">
						<label for="address" class="form-label"> Address </label> <input
							type="text" class="form-control" id="address" name="address">
					</div>
											
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
							
				
			</div>
		</div>
	</div>
	
	

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>