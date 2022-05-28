<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- font-aewsome CSS -->
<link rel="stylesheet" href="css/all.min.css">

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="bootstrap.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- JQuery Core Lib-->
<script src="js/jquery-3.6.0.min.js"></script>


<title>Shopping Cart Website!</title>

</head>
<body>

	<!-- nav bar started -->
	<!-- --------------------------------nav start---------------------- -->
	<nav class="navbar navbar-expand-lg navbar-dark "
		style="background-color: orange;">
		<a class="navbar-brand" href="#"><img src="img\logo.jpg"
			alt="image not found" width="150px" height="65px"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"

			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>


		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp" style="color: darkblue"><img src="img\Logoo.png"
			alt="image not found" width="160px" height="60px"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="do.productoperation?action=showproductlist">Menu Item</a></li>

					<core:if test="${sessionScope.user != null}">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownMenuLink" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">
								${sessionScope.user.fname} ${sessionScope.user.lname} </a>
							<ul class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<core:if test="${user.role=='owner' or user.role=='admin' }">
									<li><a class="dropdown-item" href="addproducts.jsp">Add
											Product</a></li>
									<li><a class="dropdown-item" href="#">All Orders</a></li>
								</core:if>
								<core:if test="${user.role=='customer'}">

									<li><a class="dropdown-item" href="cart.jsp">My Cart<i
											class="fas fa-cart-arrow-down"></i></a></li>
									<li><a class="dropdown-item" href="#">My Orders<i
											class="fab fa-elementor"></i></a></li>
								</core:if>
								<li><a class="dropdown-item"
									href="do.useroperation?action=signout">SignOut</a></li>

							</ul></li>
					</core:if>


					<core:if test="${sessionScope.user == null}">
						<li class="nav-item"><a href="register.jsp" class="nav-link">SignUp</a>
						<li class="nav-item"><a href="login.jsp" class="nav-link">SignIn</a>
					</core:if>

					<core:if test="${sessionScope.user != null}">
					</core:if>

					<li class="nav-item"><a class="nav-link" href="about_us.jsp">About_Us</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="contactus.jsp">Contact_Us</a></li>
				</ul>
			</div>
			<form action="search.jsp" method="post">
				<input type="text" placeholder="Search" name="search">
				<button type="submit" style="background-color: lightblue;">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
	</nav>


	<!-- nav bar ended -->

	<Script src="js/bootstrap.bundle.min.js"></Script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>