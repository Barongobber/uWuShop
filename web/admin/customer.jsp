<%-- 
    Document   : customer
    Created on : Jan 16, 2021, 6:05:02 PM
    Author     : gobib
--%>
<%@page import="com.bean.User"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="com.controller.showListCustomer"%>
<%@page import="java.util.logging.Level"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.sql.*" %>

<!DOCTYPE html>

<% 
    //Assign session CustList with an array
    ArrayList cL = (ArrayList) session.getAttribute("custList");
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
    </head>
    <body class="sb-nav-fixed">    
        <%@include file="../bar/topbar.jsp" %>
        <div id="layoutSidenav">
            <%@include file="../bar/sidebar.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">Customer Database</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Customer Database</li>
                        </ol>
<!--                        <div class="row">
                          <div class="col-md-12 text-right form-group">
                            <button type="button" class="btn btn-primary" onclick="location.href='add-contact.jsp'">Add Customer Contact</button>
                          </div>
                        </div>-->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                Data Customer
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Username</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Phone number</th>
                                                <th>Address</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                            //if array is empty
                                            if (cL.size() == 0){
                                            %>
                                            <tr class="text-center">
                                                <td colspan="5">Data is Empty</td>
                                            </tr>
                                            <!--if array is not empty-->
                                            <% } else {
                                                for(int i=0; i < cL.size(); i++){
                                                //assign an object MailCustomer inside an array into another MailCustomer called 'm'
                                                     User mC = (User)cL.get(i);                                           
                                            %>
                                            <tr>
                                                <td> <%= mC.getUsername() %></td>
                                                <td> <%= mC.getName() %> </td>
                                                <td> <%= mC.getEmail() %></td>
                                                <td><%= mC.getPhonenum() %></td>
                                                <td> <%= mC.getAddress() %></td>
                                            </tr>
                                            <% } } %>
                                        </tbody>
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

