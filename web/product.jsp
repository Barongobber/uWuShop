
<%@page import="com.bean.Product"%>
<!DOCTYPE html>
<% 
    ArrayList pro = (ArrayList) session.getAttribute("productList");
%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Products</title>
        <link href="dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>

        <body class="sb-nav-fixed">
        <%@include file="bar/topbar-customer.jsp" %>
        <div id="layoutSidenav">
           <%@include file="bar/sidebar-customer.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Products</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Products List</li>
                        </ol>
                        <div class="col-md-12 text-right form-group">
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
                            <h5 class="text-center">All Products</h5> <hr>
                            <div class="row d-flex align-items-center justify-content-center">
                                <% 
                                    for (int i=0; i < pro.size(); i ++){
                                        Product p = (Product) pro.get(i);
                                %>
                                
                                <div class="col-md-5 col-lg-5 mb-4 productBox <%= p.getCategory() %>">
                                    <div class="d-flex align-items-center justify-content-center" style="height:200px;width:120;">
                                        <img class="img-fluid mw-100 mh-100" style="overflow:hidden" src="img/<%= p.getImagesrc() %>" alt="<%= p.getImagesrc() %>">
                                            <a href="#!">
                                            </a>
                                    </div>
                                    <div class="text-center pt-4">
                                        <h6><%= p.getName() %></h6>
                                        <p class="mb-2 text-muted text-uppercase small"><%= p.getCategory() %></p>
                                        <hr>
                                        <h6 class="mb-3"> <%= p.getPrice() %></h6>
                                        <button type="button" onclick="window.location.href='buyOrder?prod=<%= p.getProductid() %>'" class="btn btn-outline-dark btn-sm mr-1 mb-2" id="buy<%= p.getProductid() %>">
                                            <i class="fas fa-shopping-cart pr-2"></i>BUY</button>
                                    </div>
                                </div>
                                <script>
                                <c:choose>
                                    <c:when test="${sessionScope.user ==null}">
                                        document.getElementById("buy<%= p.getProductid() %>").disabled = true;
                                    </c:when>
                                </c:choose>
                                </script>
                                <% } %>                                
                            </div>
                        </section>
                       
                    </div>
                </main>
                <%@include file="footer/footer.jsp" %>
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
