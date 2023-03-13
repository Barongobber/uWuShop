<%-- 
    Document   : index.jsp
    Created on : Jan 16, 2021, 3:44:07 PM
    Author     : gobib
--%>

<%@page import="com.bean.Report"%>
<%@page import="com.bean.Admin"%>
<%@page import="com.bean.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList oL = (ArrayList) session.getAttribute("orderList");
    ArrayList reportList = (ArrayList) session.getAttribute("reportList");
%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Customer Database</title>
        <link href="../dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        
    </head>
    
    <body class="sb-nav-fixed">
        
       <%@include file="../bar/topbar.jsp" %>
        <div id="layoutSidenav">
            <%@include file="../bar/sidebar.jsp" %>
            <c:if test="${sessionScope.reportList==null}">
               <c:redirect url="../showReport"></c:redirect>
            </c:if>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                        
                        <div class="container-fluidn">
                            <span>
                            <div class="col-md-12 text-right form-group">
                                <a href="registerAdmin.jsp">
                                    <button class="btn btn-primary">+ Register New Admin</button>
                                </a>
                            </div>
                                
                            </span>
                        </div>
                        <br>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                Order Status    
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Buyer</th>
                                                <th>Product Name</th>
                                                <th>Quantity</th>
                                                <th>Total Cost</th>
                                                <th>Date</th>
                                                <th>Status </th>
                                                <th>Action </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% 
                                            for(int i=0; i < oL.size(); i ++){
                                                Order or = (Order) oL.get(i);
                                            
                                            %>
                                            <tr>
                                                <td><%= i+1 %></td>
                                                <td><%= or.getBuyer() %></td>
                                                <td><%= or.getProductname() %></td>
                                                <td><%= or.getQtyOrder() %></td>
                                                <td>RM <%= (or.getPrice()*or.getQtyOrder()) + or.getShipping_price() %></td>
                                                <td><%= or.getDate() %></td>
                                                <td><%= or.getStatus() %></td>
                                                
                                                <td> 
                                                    <button type="button" class="btn btn-info" id="deliv<%= or.getOrderid() %>" onclick="window.location.href='../changeStatus?status=On Delivery&orderID=<%= or.getOrderid() %>'"><i class="far fa-paper-plane"></i> </button>
                                                    <!--<a class="btn btn-info"></a>-->
                                                    <!--&nbsp;-->
                                                    <button type="button" class="btn btn-success" id="success<%= or.getOrderid() %>" onclick="window.location.href='../changeStatus?status=Success&orderID=<%= or.getOrderid() %>'"><i class="far fa-check-circle"></i></button>
                                                    <!--&nbsp;--> 
                                                    <button type="button" class="btn btn-danger" id="cancel<%= or.getOrderid() %>" onclick="window.location.href='../changeStatus?status=Cancelled&orderID=<%= or.getOrderid() %>'"><i class="fa fa-remove"></i></button>
                                                    
                                                    
                                                    
                                                </td>
                                            </tr>
                                             <script>
                                                 <% if(or.getStatus().equals("On Delivery")){ %>
                                                document.getElementById("deliv<%= or.getOrderid() %>").disabled = true;
                                                document.getElementById("cancel<%= or.getOrderid() %>").disabled = true;
                                             
                                                <% } else if (or.getStatus().equals("Cancelled")){ %>
                                                    document.getElementById("success<%= or.getOrderid() %>").disabled = true;
                                                    document.getElementById("cancel<%= or.getOrderid() %>").disabled = true;
                                                    document.getElementById("deliv<%= or.getOrderid() %>").disabled = true;
                                                <% } else if (or.getStatus().equals("Success")){ %>
                                                    document.getElementById("success<%= or.getOrderid() %>").disabled = true;
                                                    document.getElementById("cancel<%= or.getOrderid() %>").disabled = true;
                                                    document.getElementById("deliv<%= or.getOrderid() %>").disabled = true;
                                                <% }else if (or.getStatus().equals("Pending")){ %>
                                                    document.getElementById("success<%= or.getOrderid() %>").disabled = true;
                                                <% } %>  
                                              </script>
                                                <% } %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                Financial Report for <%= ((Admin) session.getAttribute("admin")).getName() %>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataSummary" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Date</th>
                                                <th>Product Name</th>
                                                <th>Item Sold</th>
                                                <th>Income</th>                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%  double total=0;
                                                for(int i=0; i<reportList.size();i++){
                                                Report report= (Report) reportList.get(i); %>
                                            <tr>
                                                <td><%= report.getDate() %></td>
                                                <td><%= report.getProductName() %></td>
                                                <td><%= report.getQuantity() %></td>
                                                <td>RM <%= report.getPrice() %></td>
                                                <% total=total+report.getPrice(); %>
                                            </tr>
                                            <% } %>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td colspan="3"><strong>Total Income</strong></td> 
                                                <td><strong>RM <%= total%></strong></td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2020</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
               <%
                   total=0;
                   session.removeAttribute("reportList");
               %>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../dist/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="../dist/assets/demo/chart-area-demo.js"></script>
        <script src="../dist/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="../dist/assets/demo/datatables-demo.js"></script>
    </body>
</html>

