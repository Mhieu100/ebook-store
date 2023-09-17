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

 	<h1 style="margin: 200px" >Checkout Page</h1>

	<%@include file="Component/Footer.jsp"%>

	<%--<a href="hello-servlet">Hello Servlet</a>--%>
</body>
</html>