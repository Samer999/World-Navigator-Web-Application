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

            <li class="nav-item active"><a
                    class="btn btn-primary "
                    href="javascript:alert('Hello!');"
                    role="button"
                    style="margin-left: 20px"
            >User : <%=session.getAttribute("user_first_name")%>
            </a></li>

            <li class="nav-item active"><a
                    class="btn btn-danger"
                    href="Logout"
                    role="button"
                    style="margin-left: 20px"
            >Logout</a></li>
        </ul>
    </div>
</nav>


<div
        class="container"
        style="margin-top: 50px;"
>
    <div class="row">
        <form class="col-md-6" action="${pageContext.request.contextPath}/Game/HandIndex">

            <div class="form-group">
                <h4>Enter Command Index</h4>
            </div>
            <div class="form-group">
                <input
                        type="number"
                        name="index"
                        class="form-control"
                />
            </div>

            <div class="form-group">
                <input
                        type="submit"
                        name="btnSubmit"
                        class="btnContact btn btn-primary"
                        value="Execute"
                />

                <input
                        type="submit"
                        name="btnSubmit"
                        class="btnContact btn btn-danger"
                        value="Quit"
                />
            </div>

        </form>
        <div class="col-md-6">
            <div class="form-group">
                <h4>Command Results</h4>
            </div>
            <div class="form-group">
					<textarea
                            disabled
                            name="txtMsg"
                            class="form-control"
                            style="width: 100%; height: 550px;"
                    >
					<%
                        String text;
                        if (session.getAttribute("result") == null)
                            text = "Enter any number to see commands";
                        else
                            text = session.getAttribute("result").toString();
                        out.print("\n");
                        for (int i = 0; i < text.length(); i++) {
                            if (text.charAt(i) == '\n')
                                out.println();
                            else
                                out.print(text.charAt(i));
                        }
                    %>
					
					</textarea>
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