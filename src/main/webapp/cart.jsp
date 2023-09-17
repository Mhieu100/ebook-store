<%@page import="Model.Cart"%>
<%@page import="Model.Book"%>
<%@page import="java.util.List"%>
<%@page import="ConnectDB.ConnectDB"%>
<%@page import="Dao.Dao"%>
<%@ page import="Model.User" %>
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

	<section class="h-100 gradient-custom">
		<div class="container py-5">
			<div class="row d-flex justify-content-center my-4">
				<div class="col-md-8">
					<div class="card mb-4">
						<div class="card-header py-3">
							<h5 class="mb-0">Cart - 2 items</h5>
						</div>
						<div class="card-body">

							<%
							String URL = "http://localhost:8080/ebook-store/";
							User user_cart = (User) session.getAttribute("userObj");
							Dao dao = new Dao(ConnectDB.getConnection());
							List<Cart> list = dao.getBookCart(user_cart.getId());
							if (!list.isEmpty()) {
								for (Cart cart : list) {
							%>
							<!-- Single item -->
							<div class="row">
								<div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
									<!-- Image -->
									<div class="bg-image hover-overlay hover-zoom ripple rounded"
										data-mdb-ripple-color="light">
										<img src="<%=URL%>Image/<%=cart.getImage()%>" class="w-100"
											alt="<%=cart.getBook_name()%>" />
									</div>
									<!-- Image -->
								</div>

								<div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
									<!-- Data -->
									<p>
										<strong><%=cart.getBook_name()%></strong>
									</p>
									<p>
										Auth:
										<%=cart.getAuth()%></p>
									<p>
										Price: $<%=cart.getPrice()%></p>
									<a href="delete_cart?book_id=<%=cart.getBook_id()%>"
										class="btn btn-primary btn-sm me-1 mb-2"
										data-mdb-toggle="tooltip" title="Remove item"> <i
										class="fas fa-trash"></i>
									</a>
									<!-- Data -->
								</div>

								<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
									<!-- Quantity -->
									<div class="d-flex mb-4" style="max-width: 300px">
										<button class="btn btn-primary px-3 me-2"
											onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
											<i class="fas fa-minus"></i>
										</button>

										<div class="form-outline">
											<input id="form1" min="1" name="quantity" value="1"
												type="number" class="form-control text-center" />
										</div>

										<button class="btn btn-primary px-3 ms-2"
											onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
											<i class="fas fa-plus"></i>
										</button>
									</div>
									<!-- Quantity -->

									<!-- Price -->
									<p class="text-start text-md-center">
										<strong>$ <%=cart.getTotal_price()%></strong>
									</p>
									<!-- Price -->
								</div>
							</div>
							<!-- Single item -->
							<hr class="mt-4" />
							<%
							}
							} else {
							%>
							<div class="text-center">
								<h5><strong>Your shopping cart is empty</strong></h5>
								<br>
								<a href="index.jsp" class="btn btn-success m-2">Go Shopping</a>
							</div>
							<%
							}
							%>
						</div>
					</div>
					<div class="card mb-4">
						<div class="card-body">
							<p>
								<strong>Expected shipping delivery</strong>
							</p>
							<p class="mb-0">12.10.2020 - 14.10.2020</p>
						</div>
					</div>
					<div class="card mb-4 mb-lg-0">
						<div class="card-body">
							<p>
								<strong>We accept</strong>
							</p>
							<img class="me-2" width="45px"
								src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
								alt="Visa" /> <img class="me-2" width="45px"
								src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"
								alt="American Express" /> <img class="me-2" width="45px"
								src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
								alt="Mastercard" /> <img class="me-2" width="45px" s
								src="https://logos-world.net/wp-content/uploads/2020/07/PayPal-Logo-2014.png"
								alt="PayPal acceptance mark" />
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card mb-4">
						<div class="card-header py-3">
							<h5 class="mb-0">Summary</h5>
						</div>
						<div class="card-body">
							<ul class="list-group list-group-flush">
								<li
									class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
									Products <span>$53.98</span>
								</li>
								<li
									class="list-group-item d-flex justify-content-between align-items-center px-0">
									Shipping <span>Gratis</span>
								</li>
								<li
									class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
									<div>
										<strong>Total amount</strong> <strong>
											<p class="mb-0">(including VAT)</p>
										</strong>
									</div> <span><strong>$53.98</strong></span>
								</li>
							</ul>

							<a href="checkout.jsp" class="btn btn-primary btn-lg btn-block">
								Go to checkout </a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@include file="Component/Footer.jsp"%>

	<%--<a href="hello-servlet">Hello Servlet</a>--%>
</body>
</html>