<%-- 
    Document   : editproduct
    Created on : Jan 26, 2021, 6:59:10 PM
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
    String a = request.getRealPath(request.getServletPath());
    String newString = a.replace("\\build\\web\\admin\\editproduct.jsp","") + "\\web\\img";
    session.setAttribute("path", newString);
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Edit <%= product.getName() %></title>
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
                        <h1 class="mt-4">Product</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Edit Product</li>
                        </ol>
                        
                        
                        
                        <section id="editproduct">
                            <br>
                            <div class="card">
                                <div class="card-header text-dark">
                                    <h5 class="text-justified">Product Detail</h5>
                                </div>
                                <div class="card-body">
                                    <form action="../updateProduct" method="post" enctype="multipart/form-data">
                                        <div class="md-form md-outline">
                                            Product Name
                                            <input type="text" class="form-control" id="productname" name="productname" value="<%= product.getName() %>" readonly/>                                            
                                        </div>
                                        <br>
                                        <div class="md-form md-outline">
                                            Category
                                            <select name="category">
                                                <option value="Shirt">Shirt</option>
                                                <option value="T-Shirt">T-Shirt</option>
                                                <option value="Pants">Pants</option>
                                                <option value="Accessories">Accessories</option>                                                
                                            </select>
                                        </div>
                                        <br>
                                        <div class="md-form md-outline">
                                            Price:
                                            <input type="number" step="any" class="form-control" id="price" name="price" value="<%= product.getPrice() %>" required/>
                                        </div>
                                        <br>
                                        <div class="md-form md-outline">
                                            Quantity:
                                            <input type="number" class="form-control" id="quantity" name="quantity" value="<%= product.getQuantity() %>" requored/>
                                        </div>
                                        <br>
                                        <div class="md-form md-outline">
                                            Description:
                                            <input type="text" class="form-control" id="description" name="description" value="<%= product.getDescription() %>" required/>
                                        </div>
                                        <br>
                                        <div class="md-form md-outline">
                                            <label for="imageSrc">Image: </label>
                                            <input type="file" class="form-control-file" id="imageSrc" name="imageSrc" required=""/>
                                        </div>
                                        <br>
                                        <input type="submit" class="btn btn-primary btn-block" value="Edit Product">
                                    </form>                                    
                                </div>
                            </div>
                        </section>
                       
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

