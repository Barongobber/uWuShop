

<%@page import="com.bean.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Home</title>
        <link href="dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>

    <body class="sb-nav-fixed">
        <%@include file="bar/topbar-customer.jsp" %>
        <div id="layoutSidenav">
           <%@include file="bar/sidebar-customer.jsp" %>
           <c:if test="${sessionScope.carousel==null}">
               <c:redirect url="CarouselController?control=loadCarousel&from=user"></c:redirect>
           </c:if>
           <c:if test="${sessionScope.homeProduct==null}">   
               <c:redirect url="homepageProducts"></c:redirect>
           </c:if>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Home</h1>
                        <div class="d-flex align-items-center justify-content-center">
                            <div id="carouselhome" class="carousel slide" data-ride="carousel">
                                  <ol class="carousel-indicators">
                                    <li data-target="#carouselhome" data-slide-to="0" class="active"></li>
                                    <li data-target="#carouselhome" data-slide-to="1"></li>
                                    <li data-target="#carouselhome" data-slide-to="2"></li>
                                  </ol>
                                <div class="carousel-inner" style="height:500px;width:750;">
                                    <%  ArrayList<String> carousel=(ArrayList<String>)session.getAttribute("carousel"); 
                                        for(int i=0; i<carousel.size();i++){
                                    %>
                                    <% if(i==0){ %><div class="carousel-item  active "><% } else { %>
                                      <div class="carousel-item"> <% } %>
                                      <img class="d-block mw-100" style="overflow: hidden;" src="<%=carousel.get(i) %>" alt="Slide <%= i%>">
                                    </div>
                                    <% } %>
                                </div>
                                <a class="carousel-control-prev" href="#carouselhome" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselhome" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                            
                        </div>
                        
                        <section id="newarrival">
                            <br>
                            <h5 class="text-center">Hot Product</h5>
                            <div class="row d-flex align-items-center justify-content-center">
                                <% 
                                    ArrayList homepro = (ArrayList) session.getAttribute("homeProduct");
                                    ArrayList soldCount = (ArrayList) session.getAttribute("soldCount");
                                    if(homepro.size()==0){ %>
                                    <div class="text-center pt-4">
                                        No products yet
                                    </div>
                                <%    }
                                    else{
                                    for (int i=0; i < homepro.size(); i ++){
                                        Product p = (Product) homepro.get(i);
                                        int countSold = (Integer) soldCount.get(i);
                                    
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
                                        <strong><p>Total Sold: <%= countSold%> items </p></strong>
                                        <hr>                                      
                                        <h6 class="mb-3"> <%= p.getPrice() %></h6>
                                        <button type="button" onclick="window.location.href='buyOrder?prod=<%= p.getProductid() %>'" class="btn btn-outline-dark btn-sm mr-1 mb-2" id="buy<%= p.getProductid() %>">
                                            <i class="fas fa-shopping-cart pr-2"></i>BUY</button>
                                    </div>
                                </div>
                                <script>
                                <c:choose>
                                    <c:when test="${sessionScope.user==null}">
                                        document.getElementById("buy<%= p.getProductid() %>").disabled = true;
                                    </c:when>
                                </c:choose>
                                </script>
                                <% } } %>                                
                            </div>
                        </section>
                        <br>
                        <br>
                    </div>
                </main>
                <%@include file="footer/footer.jsp" %>
            </div>
                <% session.removeAttribute("homeProduct");
                    session.removeAttribute("soldCount");
                %>
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
