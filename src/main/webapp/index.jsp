<%@page import="Model.Book"%>
<%@page import="java.util.List"%>
<%@page import="ConnectDB.ConnectDB"%>
<%@page import="Dao.Dao"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Ebook Shop</title>

<%@include file="Plugin/Link.jsp"%>
<style type="text/css">
.name_product {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	resize: horizontal;
}
</style>
</head>
<body>
	<%@include file="Component/Navbar.jsp"%>

	<section style="background-color: #eee">
		<div class="container" style="padding-top: 70px; padding-bottom: 30px">
			<div class="row">
				<%
				String URL = "http://localhost:8080/ebook-store/";
				Dao dao = new Dao(ConnectDB.getConnection());
				List<Book> list = dao.showBook();

				for (Book book : list) {
				%>
				<div class="col-md-6 col-lg-3 mb-4 mb-lg-0" style="margin-top: 18px">
					<div class="card text-black">
						<img src="<%=URL%>Image/<%=book.getImage()%>"
							class="card-img-top" alt="iPhone" />
						<div class="card-body">
							<div class="text-center mt-1">
								<h6 class="card-title name_product"><%=book.getName()%></h6>
								<h6 class="text-primary mb-1 pb-3">
									Price : $
									<%=book.getPrice()%></h6>
							</div>

							<div class="text-center">
								<div class="p-3 mx-n3 mb-4" style="background-color: #eff1f2">
									<h5 class="mb-0"><%=book.getCategory()%></h5>
								</div>
							</div>

							<div class="d-flex flex-row">
								<a href="book_detail.jsp?id=<%=book.getId()%>"
									class="btn btn-primary flex-fill me-1"
									data-mdb-ripple-color="dark">View Detail</a>
								<%
								User us = (User) session.getAttribute("userObj");
								if (user != null) {
								%>
								<a
									href="cart?book_id=<%=book.getId()%>&&user_id=<%=us.getId()%>"
									class="btn btn-danger flex-fill ms-1"> Add To Cart</a>
								<%
								} else {
								%>
								<a
									href="login.jsp"
									class="btn btn-danger flex-fill ms-1"> Add To Cart</a>
									<%
								} 
								%>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</section>

	<%@include file="Component/Footer.jsp"%>

	<%--<a href="hello-servlet">Hello Servlet</a>--%>
</body>
</html>