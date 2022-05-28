<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
		<div class='row'>
			<div class='col'>
				<h2 style="margin-left: 100px; margin-top: 20px ">Login Yourself..</h2>
			</div>
		</div>
		<div class="row">
			<div class='col'>
				
				<img src="img/login.jpg" alt="image not found" width="400px" height="300px">
			</div>
			
			<div class='col'>
				<form action="do.useroperation" method="post">
					<input type="hidden" name="action" value="signin">
					
					<div class="mb-3">
						<label for="uemail" class="form-label">User Email</label> <input
							type="text" class="form-control" id="uemail" name="uemail">
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">Password</label> <input
							type="password" class="form-control" id="password" name="password">
					</div>
										
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
	
				<!-- Success message printing -->
			<jsp:include page="message.jsp"></jsp:include>			
				
			</div>
		</div>
	</div>
	
	

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>