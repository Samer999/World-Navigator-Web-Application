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

<title>Welcome</title>
</head>
<body>
	<%
		if (session.getAttribute("user_first_name") == null) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/");
			requestDispatcher.forward(request, response);
		}
	%>



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
				<li class="nav-item"><a
					class="nav-link"
					href="${pageContext.request.contextPath}/"
				>Home</a></li>
				<li class="nav-item"><a
						class="nav-link active"
						href="${pageContext.request.contextPath}/Game/GameMenu"
				>Game</a></li>

				<li class="nav-item"><a
					class="btn btn-primary"
					href="javascript:alert('Hello!');"
					role="button"
					style="margin-left: 20px"
				>User : <%=session.getAttribute("user_first_name")%></a></li>


				<li class="nav-item active"><a
						class="btn btn-primary"
						href="javascript:alert('You can get more wins!');"
						role="button"
						style="margin-left: 20px"
				>You have : <%=session.getAttribute("user_wins")%> win/s</a></li>

				<li class="nav-item active"><a
					class="btn btn-danger"
					href="${pageContext.request.contextPath}/Logout"
					role="button"
					style="margin-left: 20px"
				>Logout</a></li>
			</ul>
		</div>
	</nav>


	<div class="container-sm">

		<div
			class="container-sm"
			style="margin-top: 110px"
		>
			<h1>Choose Game Mode</h1>

			<div class="row">
				<div
					class="col-sm"
					style="height: 200px; margin: 20px"
				>
					<!---  old = single_player_start.jsp --->
					<a href="SinglePlayerStartMenu"><button
						class="btn btn-primary"
						style="height: 100%; width: 100%"
					><h3> Single Player </h3></button>
					</a>
				</div>
				<div
					class="col-sm"
					style="height: 200px; margin: 20px"
				>
					<a href="javascript:alert('Multiplayer is currently disabled!');"><button
						class="btn btn-danger"
						style="height: 100%; width: 100%"
					><h3> Multiplayer </h3></button></a>
				</div>
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