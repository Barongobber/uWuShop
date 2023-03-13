<%-- 
    Author     : tres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.bean.Product"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="com.controller.showDetail"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.*, java.sql.*" %>

<%
    Product product = (Product) session.getAttribute("product");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title><%= product.getName() %> Details</title>
        <link href="../dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>

   <body class="sb-nav-fixed">
       <%@include file="../bar/topbar.jsp" %>
        <div id="layoutSidenav">
            <%@include file="../bar/sidebar.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <br>
                    <div class="col-md-12 col-lg-12 mb-12">
                        <div class="row card">
                        <div class="card-header text-dark">
                                <!--<span>Fill an Email Content</span>-->
                        <h2 class="mt-4">Product Name: <%= product.getName() %></h2>   
                        </div> <br>
                        <div class="d-flex align-items-center justify-content-center" style="height:200px;width:120;">
                            <img class="img-fluid mw-100 mh-100" style="overflow:hidden"src="../img/<%= product.getImagesrc() %>" alt="<%= product.getImagesrc() %>">
                                <a href="#!">
                                </a>
                        </div>
                                <br>
                                <table class="table table-bordered" width="50%" cellspacing="0">
                                    <tr>
                                        <td><h6>Category:</h6></td>
                                        <td><h6><%= product.getCategory() %></h6></td>
                                    </tr>
                                    <tr>
                                        <td><h6>Description</h6></td>
                                        <td><h6><%= product.getDescription() %></h6></td>
                                    </tr>
                                    <tr>
                                        <td><h6>Price:</h6></td>
                                        <td><h6>RM <%= product.getPrice() %></h6></td>
                                    </tr>
                                    <tr>
                                        <td><h6>Quantity: </h6></td>
                                        <td><h6><%= product.getQuantity() %></h6></td>
                                    </tr>                                   
                                </table>
                        <div class="col-md-12 text-center form-group">
                        <a href="editproduct.jsp"><button type="button" class="btn btn-warning btn-sm mr-1 mb-2">
                        Edit Product</button></a>
                        <a href="../deleteProduct"><button type="button" class="btn btn-danger btn-sm mr-1 mb-2">
                        Delete Product</button></a>
                            <!--<button type="button" class="btn btn-primary" onclick="location.href='add-contact.jsp'">Add Customer Contact</button>-->
                          </div>
                    </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; UwUshop 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
    </body>
</html>
