<!doctype html>
<%@ page isELIgnored="false"%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta
	name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no"
>

<!-- Bootstrap CSS -->
<link
	rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous"
>

<%
	if (session.getAttribute("user_first_name") != null) {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/welcome");
		requestDispatcher.forward(request, response);
	}
%>


<title>Welcome</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a
			class="navbar-brand"
			href="#"
		>World Navigator</a>
		<button
			class="navbar-toggler"
			type="button"
			data-toggle="collapse"
			data-target="#navbarNav"
			aria-controls="navbarNav"
			aria-expanded="false"
			aria-label="Toggle navigation"
		>
			<span class="navbar-toggler-icon"></span>
		</button>
		<div
			class="collapse navbar-collapse"
			id="navbarNav"
		>
			<ul class="navbar-nav">
				<li class="nav-item active"><a
					class="nav-link"
					href="${pageContext.request.contextPath}/"
				>Home</a></li>
				<li class="nav-item"><a
						class="nav-link"
						href="${pageContext.request.contextPath}/Game/GameMenu"
				>Game</a></li>
			</ul>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="row">


			<div
				class="col-sm"
				style="margin-top: 25px"
			>
				<form
					action="Login"
					method="post"
				>
					<div class="form-group">
						<label>Email address</label> <input
							type="email"
							class="form-control"
							name="loginEmail"
							aria-describedby="emailHelp"
						>
					</div>
					<div class="form-group">
						<label>Password</label> <input
							type="password"
							class="form-control"
							name="loginPassword"
						>
					</div>
					<small
						id="loginErrorMess"
						class="form-text text-muted"
						style="margin: 10px;'"
					><%=request.getAttribute("loginError") == null ? "" : request.getAttribute("loginError")%></small>
					<button
						type="submit"
						class="btn btn-primary"
					>Login</button>
				</form>
			</div>
			<div
				class="col-sm"
				style="margin-top: 25px"
			>
				<form
					action="Register"
					method="post"
				>
					<div class="form-group">
						<label>First Name</label> <input
							type="text"
							class="form-control"
							name="registerFname"
							aria-describedby="emailHelp"
						>
					</div>
					<div class="form-group">
						<label>Email address</label> <input
							type="email"
							class="form-control"
							name="registerEmail"
							aria-describedby="emailHelp"
						>
					</div>
					<div class="form-group">
						<label>Password</label> <input
							type="password"
							class="form-control"
							name="registerPassword"
						>
					</div>
					<div class="form-group">
						<label>Confirm Password</label> <input
							type="password"
							class="form-control"
							name="registerConfirmPassword"
						>
					</div>
					<small
						id="registerErrorMess"
						class="form-text text-muted"
						style="margin: 10px;'"
					><%=request.getAttribute("registerError") == null ? "" : request.getAttribute("registerError")%></small>
					<button
						type="submit"
						class="btn btn-primary"
					>Register</button>
				</form>
			</div>
		</div>
	</div>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"
	></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"
	></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"
	></script>
</body>
</html>