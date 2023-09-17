<%@ page import="Model.User" %><%
	User user = (User) session.getAttribute("userObj");
   if (user == null || user.getRole() == 0) {
       response.sendRedirect("http://localhost:8080/ebook-store");
	}
%>
<%@ page import="Dao.Dao" %>
<%@ page import="ConnectDB.ConnectDB" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Book" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Show Books</h2>
						<ul class="navbar-right" style="list-style: none">
                      <li><a href="http://localhost:8080/ebook-store/admin/add_book.jsp" class="btn btn-success" >Create Book</a>
                      </li>
                    </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div id="datatable_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                            <div class="row">
                                <div class="col-sm-12">
                                    <table id="datatable" class="table table-striped table-bordered dataTable no-footer"
                                           role="grid" aria-describedby="datatable_info">
                                        <thead>
                                        <tr role="row">
                                            <th class="sorting_asc" tabindex="0" aria-controls="datatable" rowspan="1"
                                                colspan="1" aria-sort="ascending"
                                                >Image
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1"
                                                colspan="1" >Name
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1"
                                                colspan="1" >Auth
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1"
                                                colspan="1" >Description
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1"
                                                colspan="1" >Price
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1"
                                                colspan="1" >Category
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1"
                                                colspan="1" >Status
                                            </th>
                                            <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1"
                                                colspan="1" >Action
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            Dao dao = new Dao(ConnectDB.getConnection());
                                            List<Book> list = dao.showBook();

                                            for (Book book : list
                                            ) { %>
                                        <tr role="row">
                                            <td class="sorting_1"> <img alt="<%= book.getImage() %>" src="../Image/<%= book.getImage() %>" width="100px"/>
                                            </td>
                                            <td><%= book.getName() %>
                                            </td>
                                            <td><%= book.getAuth() %>
                                            </td>
                                            <td><%= book.getDescription() %>
                                            </td>
                                            <td><%= book.getPrice() %>
                                            </td>
                                            <td><%= book.getCategory() %>
                                            </td>
                                            <td>
                                             <%= book.getStatus() %>
                                            </td>
                                            <td>
                                                <a class="btn btn-primary" href="edit_book.jsp?id=<%= book.getId() %>" >Edit</a>
                                                <a class="btn btn-danger" href="../delete_book?id=<%= book.getId() %>">Delete</a>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
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
