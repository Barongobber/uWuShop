<%--
    Author     : tres
--%>

<%@page import="com.bean.Admin"%>
<%@page import="com.bean.Product"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="com.controller.showProduct"%>
<%@page import="java.util.logging.Level"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.sql.*" %>

<%
    ArrayList pL = (ArrayList) session.getAttribute("productList");
%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin - Products</title>
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
                        <h1 class="mt-4">Products</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">&nbsp;</li>
                            </ol>
                        
                        
                        
                        <div class="col-md-12 text-right form-group">
                            <a href="addproduct.jsp">
                                <button class="btn btn-primary">+ Add Product</button>
                            </a>
                            <select  name="itemCategory" id="itemCategory" onchange="selCategory();" class="btn btn-secondary dropdown-toggle">
                                <div class="dropdown-menu">
                                    <option value="0">Select Category</option>
                                    <option value="1">Shirt</option>
                                    <option value="2">T-Shirt</option>
                                    <option value="3">Pants</option>
                                    <option value="4">Accessories</option>                                                
                            </select>
                        </div>
                        <section id="allproducts">
                            <br>
                            <%
                                if(pL.size() == 0){
                            %>
                            <div class="row d-flex align-items-center justify-content-center">
                            <h5 class="text-center">No Product Yet!</h5>
                            <%
                                } else {%>
                                <div >
                                    <ol class="breadcrumb mb-12">
                                        <li class="text-center"><h5>Product List</h5></li>
                                    </ol>
                                </div>
                            <div class="row d-flex align-items-center justify-content-center">
                                <%
                                    for(int i = 0; i < pL.size(); i++){
                                        Product pro = (Product)pL.get(i);
                                %>
                                <div class="col-md-5 col-lg-5 mb-4 productBox <%= pro.getCategory() %>">
                                    <div class="d-flex align-items-center justify-content-center" style="height:200px;width:120;">
                                        <img title="<%=pro.getName().trim()%>" class="img-fluid mw-100 mh-100" style="overflow:hidden" 
                                            src="../img/<%= pro.getImagesrc() %>" alt="<%= pro.getImagesrc() %>">
                                            <a href="#!">
                                            </a>
                                    </div>
                                    <div class="text-center pt-4">
                                        <h6><%= pro.getName() %></h6>
                                        <p class="mb-2 text-muted text-uppercase small"><%= pro.getCategory() %></p>
                                        <hr>
                                        <h6 class="mb-3">RM <%= pro.getPrice() %></h6>
                                        <a href="../showDetail?productname=<%= pro.getName() %>"><button type="button" class="btn btn-outline-dark btn-sm mr-1 mb-2">
                                        View Detail</button></a>
                                    </div>
                                </div>
                                <%
                                    }}%>
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
        <script>
            function selCategory(){
                var j=document.getElementById("itemCategory").value;
                const allCategory = document.querySelectorAll('.productBox');
                if(j==1){
                    for(let i=0; i<allCategory.length; i++){
                        if(allCategory[i].classList.contains("Shirt")){
                            allCategory[i].style.display = "block";
                        }
                        else{
                            allCategory[i].style.display="none";
                        }
                    }
                }
                else if(j==2){
                    for(let i=0; i<allCategory.length; i++){
                        if(allCategory[i].classList.contains("T-Shirt")){
                            allCategory[i].style.display = "block";
                        }
                        else{
                            allCategory[i].style.display="none";
                        }
                    }
                }
                else if(j==3){
                    for(let i=0; i<allCategory.length; i++){
                        if(allCategory[i].classList.contains("Pants")){
                            allCategory[i].style.display = "block";
                        }
                        else{
                            allCategory[i].style.display="none";
                        }
                    }
                }
                else if(j==4){
                    for(let i=0; i<allCategory.length; i++){
                        if(allCategory[i].classList.contains("Accessories")){
                            allCategory[i].style.display = "block";
                        }
                        else{
                            allCategory[i].style.display="none";
                        }
                    }
                }
                else{
                    for(let i=0; i<allCategory.length; i++){

                            allCategory[i].style.display = "block";

                }
                }

            }
            
        </script>
    </body>
</html>
