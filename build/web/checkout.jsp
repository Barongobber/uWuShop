
<%@page import="com.bean.Product"%>
<!DOCTYPE html>
<%
  User us = (User) session.getAttribute("user");
  Product pro = (Product) session.getAttribute("product");
%>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Checkout</title>
        <link href="dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
        <script>
            function modalFunction() {
            var a= document.getElementById("prodName").innerHTML;
            var b= document.getElementById("qty").value;
            var c = document.getElementById("shipping").value;
            var d = <%= pro.getPrice() %>;
            document.getElementById("mProduct").innerHTML=a;
            document.getElementById("mQty").innerHTML=b;
            document.getElementById("mPrice").innerHTML=d;
            document.getElementById("mTotal").innerHTML=(b*d)+parseFloat(c);
        }
        </script>
    </head>

        <body class="sb-nav-fixed">
        <%@include file="bar/topbar-customer.jsp" %>
        <div id="layoutSidenav">
           <%@include file="bar/sidebar-customer.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <form action="insertOrder" method="post">
                        <h1 class="mt-4">Checkout</h1>
                        <div class="card mb-4">
                            <br>
                            <h5 class="text-center"> User Info <i class="fas fa-id-card-alt"></i></h5><hr>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-7 col-lg-9 col-xl-12">
                                        <div>
                                            <div class="d-flex justify-content-lg-start ">
                                                
                                                <div class="col-md-7 col-lg-9 col-xl-12 ">
                                                <table class="table table-bordered" width="100%" cellspacing="0">
                                                    <tr>
                                                        <td><h6>Name</h6></td>
                                                        <td><h6><%= us.getName() %></h6></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h6>Email</h6></td>
                                                        <td><h6><%= us.getEmail() %></h6></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h6>Phone No</h6></td>
                                                        <td><h6><%= us.getPhonenum() %></h6></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h6>Address </h6></td>
                                                        <td><h6><%= us.getAddress() %></h6></td>
                                                    </tr>                                   
                                                </table>
                                               
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <div class="card mb-4">
                            <br>
                            <h5 class="text-center"> Product Info <i class="fas fa-shopping-cart"></i></h5><hr>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-7 col-lg-9 col-xl-12">
                                        <div>
                                            <div class="d-flex justify-content-lg-start ">
                                                <div class="col-md-7 col-lg-9 col-xl-12 ">
                                                <img src="img/<%= pro.getImagesrc() %>" class="img-fluid mw-100 mh-100" style="overflow:hidden">
                                                <table class="table table-bordered" width="100%" cellspacing="0">
                                                    <tr>
                                                        <td><h6>Product Name</h6></td>
                                                        <td id="prodName"><h6><%= pro.getName() %></h6></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h6>Category</h6></td>
                                                        <td><h6><%= pro.getCategory() %></h6></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h6>Price per pieces</h6></td>
                                                        <td><h6><%= pro.getPrice() %></h6></td>
                                                        <input name="priceItem" type="number" value="<%= pro.getPrice() %>" hidden="">
                                                    </tr>
                                                    <tr>
                                                        <td><h6>Stock</h6></td>
                                                        <td><h6><%= pro.getQuantity() %></h6></td>
                                                    </tr>
                                                    <tr>
                                                        <td><h6> Description </h6></td>
                                                        <td><h6><%= pro.getDescription() %></h6></td>
                                                    </tr>                                   
                                                    <tr>
                                                        <td><h6> Shipping Option </h6></td>
                                                        <td>
                                                            <select name="shipping" required="" id="shipping" onchange="myFunction();">
                                                                <option value="0">Select</option>
                                                                <option value="10">Reguler</option>
                                                                <option value="20">Express</option>
                                                                <option value="30">One Day Service</option>
                                                            </select>
                                                        </td>
                                                    </tr>                                   
                                                    <tr>
                                                        <td><h6> Quantity </h6></td>
                                                        <td><input type="number" id="qty" name="qty" min="0" max="<%= pro.getQuantity()-1 %>" required="" onchange="myFunction();"></td>
                                                    <input type="number" name="prodid" value="<%= pro.getProductid() %>" hidden="">
                                                    </tr>                                   
                                                    <tr>
                                                        <td><h6> Payment Method </h6></td>
                                                        <td>
                                                            <select name="payMethod">
                                                                <option value="Credit Card">Credit Card</option>
                                                                <option value="Transfer">Transfer</option>
                                                                <option value="COD">COD</option>
                                                            </select>
                                                        </td>
                                                    </tr>                                   
                                                </table>
                                               
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <div class="card mb-3">
                            <div class="card-body">
                                <h6 class="mb-3">Total</h6>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                        <div>
                                            <strong>The total amount (+ shipping) </strong>
                                        </div>
                                        <span>RM <input type="text" name="totalAmount" id="totalAmount" readonly></span>
                                    </li>
                                </ul>
                                    
                                    <div class="modal fade" id="confirmCheckout" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Confirm Checkout</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    Are you sure to check out the following item:
                                                    <br>
                                                    Product Name    : <p id="mProduct"></p>
                                                    Price           : <p id="mPrice"></p>
                                                    Quantity        : <p id="mQty"></p>
                                                    <strong>Total(+shipping): <p id="mTotal"></p></strong>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <input type="submit" class="btn btn-primary" value="Confirm">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </form>
                    <button id="checkout" class="btn btn-primary btn-block" data-toggle="modal" data-target="#confirmCheckout" onclick="modalFunction();">Checkout</button>
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
        <script type="text/javascript">
            
        function myFunction() {
            var x = document.getElementById("qty").value;
            var y = document.getElementById("shipping").value;
            var z = <%= pro.getPrice() %>;
            document.getElementById("totalAmount").value = (x*z) + parseFloat(y);
          if (document.getElementById("shipping").value != 0 && document.getElementById("qty").value>0){
            document.getElementById("checkout").disabled = false;
          } else {
            document.getElementById("checkout").disabled = true;
              
        }
            
        }
            document.getElementById("checkout").disabled = true;
        
        </script>
        
    </body>
</html>
