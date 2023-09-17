<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ebook Shop</title>
    <%@include file="Plugin/Link.jsp"%>
</head>
<body>
<%@include file="Component/Navbar.jsp"%>

<main class="form-signin" style="padding: 70px 0 40px 0;">


    <c:if session="${not empty empted}">
        <p class="text-center text-danger">${ empted }</p>
        <c:remove var="empted" scope="session"/>
    </c:if>

    <c:if session="${not empty fail}">
        <p class="text-center text-danger">${ fail }</p>
        <c:remove var="fail" scope="session"/>
    </c:if>
    <%
        session.removeAttribute("fail");
        session.removeAttribute("empted");
    %>


    <form action="register" method="post">
        <div class="form-floating mt-3">
            <input
                    type="text"
                    class="form-control"
                    id="name"
                    name="name"
            />
            <label for="name">Name</label>
        </div>
        <div class="form-floating mt-3">
            <input
                    type="email"
                    class="form-control"
                    id="email"
                    name="email"
            />
            <label for="email">Email address</label>
        </div>
        <div class="form-floating mt-3">
            <input
                    type="number"
                    class="form-control"
                    id="phone"
                    name="phone"
            />
            <label for="phone">Phone</label>
        </div>
        <div class="form-floating mt-3">
            <input
                    type="password"
                    class="form-control"
                    id="password"
                    name="password"
            />
            <label for="password">Password</label>
        </div>

        <button class="w-100 btn btn-lg btn-primary" type="submit">
            Sign in
        </button>
    </form>
</main>

</body>
</html>