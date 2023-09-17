<%@ page import="Model.User"%>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light  fixed-top	">
	<!-- Container wrapper -->
	<div class="container">
		<!-- Toggle button -->
		<button class="navbar-toggler" type="button"
			data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Collapsible wrapper -->
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<!-- Navbar brand -->
			<a class="navbar-brand mt-2 mt-lg-0"
				href="http://localhost:8080/ebook-store/"> <img
				src="https://mdbcdn.b-cdn.net/img/logo/mdb-transaprent-noshadows.webp"
				height="15" alt="MDB Logo" loading="lazy" />
			</a>
			<!-- Left links -->
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link"
					href="http://localhost:8080/ebook-store/">Home</a></li>
				<!-- Dropdown -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button"
					data-mdb-toggle="dropdown" aria-expanded="false"> Category </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<li><a class="dropdown-item" href="#">New Book</a></li>
						<li><a class="dropdown-item" href="#">Old Book</a></li></li>
			</ul>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
			</ul>
			<!-- Left links -->
		</div>
		<!-- Collapsible wrapper -->

		<!-- Right elements -->
		<div class="d-flex align-items-center">
			<form class="d-flex input-group w-auto">
				<input type="search" class="form-control rounded"
					placeholder="Search" aria-label="Search"
					aria-describedby="search-addon" /> <span
					class="input-group-text border-0" id="search-addon"> <i
					class="fas fa-search"></i>
				</span>
			</form>

			<%
			User user = (User) session.getAttribute("userObj");
			if (user != null) {
			%>
			<a class="text-reset me-3" href="cart.jsp"> <i
				class="fas fa-shopping-cart"></i><span
				class="badge rounded-pill badge-notification bg-danger">0</span>
			</a>
			<div class="dropdown">
				<a class="dropdown-toggle d-flex align-items-center hidden-arrow"
					href="#" id="navbarDropdownMenuAvatar" role="button"
					data-mdb-toggle="dropdown" aria-expanded="false"> <img
					src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp"
					class="rounded-circle" height="25"
					alt="Black and White Portrait of a Man" loading="lazy" />
				</a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdownMenuAvatar">
					<li><a class="dropdown-item" href="#">Hello, <%=user.getName()%></a>
					</li>
					<li><a class="dropdown-item" href="#">My profile</a></li>
					<%
					if (user.getRole() == 1) {
					%>
					<li><a class="dropdown-item"
						href="http://localhost:8080/ebook-store/admin">Dashboard</a></li>
					<%
					}
					%>
					<li><form action="logout" method="post">
							<input class="dropdown-item" type="submit" value="Logout">
						</form></li>
				</ul>
			</div>
			<%
			} else {
			%>
			<a class="btn btn-success mx-2" href="login.jsp">Login</a> <a
				class="btn btn-danger" href="register.jsp">Register</a>
			<%
			}
			%>
		</div>
		<!-- Right elements -->
	</div>
	<!-- Container wrapper -->
</nav>
<!-- Navbar -->