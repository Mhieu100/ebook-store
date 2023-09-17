<%@ page import="Model.User" %><%
	User user = (User) session.getAttribute("userObj");
   if (user == null || user.getRole() == 0) {
       response.sendRedirect("http://localhost:8080/ebook-store");
	}
%>
<%@page import="Model.Book"%>
<%@page import="ConnectDB.ConnectDB"%>
<%@page import="Dao.Dao"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Ebook Shop</title>

    <%@include file="Plugin/Link.jsp" %>
</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">


        <!-- navbar content -->
        <%@include file="Component/Navbar.jsp" %>
        <!-- /navbar content -->

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Edit Book</h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <br>
                            <%
                            Dao dao = new Dao(ConnectDB.getConnection());
                            Book book = dao.getBookId(Integer.parseInt(request.getParameter("id")));
                            %>
                            <form id="demo-form2" method="post" action="../edit_book" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="">
                                
                                        <input type="hidden"  name="id" value="<%= book.getId() %>">
                                  
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Name <span
                                            class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" id="name" name="name" required="required"
                                               class="form-control col-md-7 col-xs-12" value="<%= book.getName() %>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="auth">Auth <span
                                            class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" id="auth" name="auth" required="required"
                                               class="form-control col-md-7 col-xs-12" value="<%= book.getAuth() %>">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="description">Description
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <textarea class="form-control col-md-7 col-xs-12" rows="3" name="description"
                                                  id="description" required="required"><%= book.getDescription() %></textarea>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="price" >Price <span
                                            class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="number" id="price" name="price" required="required"
                                               class="form-control col-md-7 col-xs-12"  value="<%= book.getPrice() %>">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Category</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select class="form-control col-md-7 col-xs-12" name="category">
                                             <option value="Old Book">Old Book</option>
                                            <option value="New Book">New Book</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Status</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select class="form-control col-md-7 col-xs-12" name="status">
                                            <option value="In Stock">In Stock</option>
                                            <option value="Out Stock">Out Stock</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="image">Image Book
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="file" id="image" name="image"
                                               class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="image">Image Detail
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <img id="upload-image"
                                             src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Open_book_nae_02.svg/2560px-Open_book_nae_02.svg.png"
                                             alt="upload image" width="50%"/>

                                        <script>
                                            const uploadInput = document.getElementById("image");
                                            const uploadImage = document.getElementById("upload-image");

                                            uploadInput.addEventListener("change", function (event) {
                                                const file = event.target.files[0]; // Use [0] to access the first file
                                                uploadImage.src = URL.createObjectURL(file);
                                            });
                                        </script>
                                    </div>
                                </div>

                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                        <a class="btn btn-primary" href="http://localhost:8080/ebook-store/admin/show_book.jsp">Cancel</a>
                                        <button class="btn btn-primary" type="reset">Reset</button>
                                        <button type="submit" class="btn btn-success">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <%@include file="Component/Footer.jsp" %>
        <!-- /footer content -->
    </div>
</div>

<%@include file="Plugin/Script.jsp" %>

</body>
</html>

                            