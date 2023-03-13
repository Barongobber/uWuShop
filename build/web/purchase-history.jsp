<%-- 
    Document   : purchase-history
    Created on : Jan 17, 2021, 12:09:39 PM
    Author     : gobib
--%>

<%@page import="com.bean.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList oL = (ArrayList) session.getAttribute("orderList");
%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Customer Database</title>
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
                        <h1 class="mt-4">Purchase History</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Purchase History</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="far fa-money-bill-alt"></i>
                                List of History:
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
                                                <td>RM <%= or.getPrice()*or.getQtyOrder() + or.getShipping_price() %></td>
                                                <td><%= or.getDate() %></td>
                                                <td><%= or.getStatus() %></td>
                                            </tr>
                                                <% } %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <%@include file="footer/footer.jsp" %>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="dist/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="dist/assets/demo/chart-area-demo.js"></script>
        <script src="dist/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="dist/assets/demo/datatables-demo.js"></script>
    </body>
</html>

