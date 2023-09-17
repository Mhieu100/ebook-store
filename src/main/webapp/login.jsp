<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ebook Shop</title>
    <%@include file="Plugin/Link.jsp"%>
</head>
<body>
<%@include file="Component/Navbar.jsp"%>

<main class="form-signin" style="padding: 70px 0 40px 0;">

    <c:if session="${not empty success}">
        <p class="text-center text-success">${ success }</p>
        <c:remove var="success" scope="session"/>
    </c:if>

    <c:if session="${not empty fail}">
        <p class="text-center text-danger">${ fail }</p>
        <c:remove var="fail" scope="session"/>
    </c:if>
    <%
        session.removeAttribute("success");
        session.removeAttribute("fail");
    %>
    <form action="login" method="post">
        <div class="form-floating mt-3">
            <input
                    type="email"
                    class="form-control"
                    id="email"
                    name="email"
                    value="admin@gmail.com"
            />
            <label for="email">Email address</label>
        </div>

        <div class="form-floating mt-3">
            <input
                    type="password"
                    class="form-control"
                    id="password"
                    name="password"
                    value="123456789"
            />
            <label for="password">Password</label>
        </div>

        <button class="w-100 btn btn-lg btn-primary" type="submit">
            Login
        </button>
    </form>
</main>
</body>
</html>