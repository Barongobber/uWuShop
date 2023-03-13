<%-- 
    Document   : add-recipient-blasting
    Created on : Jan 16, 2021, 6:13:01 PM
    Author     : gobib
--%>

<%@page import="com.bean.User"%>
<%--<%@page import="model.MailCustomer"%>--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList cL = (ArrayList) session.getAttribute("custList");
%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Email Blasting</title>
        <link href="../dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="../bar/topbar.jsp" %>
        <div id="layoutSidenav">
            <%@include file="../bar/sidebar.jsp" %>
                <div id="layoutSidenav_content">
            <form action="../receiveRecipient" method="post">
                    <main>
                        <div class="container-fluid">
                            <h1 class="mt-4">Email Blasting</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">Email Blasting</li>
                            </ol>
                            <div class="row">
                              <div class="col-md-12 text-right form-group">
                                  <input type="text" hidden name="totalRecipient" id="totalRecipient">
                                  <input type="submit" value="Make an Email" class="btn btn-primary" onclick="check()">
                              </div>
                            </div>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table mr-1"></i>
                                    Choose Recipient:
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                          <thead>
                                              <tr>
                                                  <th></th>
                                                  <th>Name</th>
                                                  <th>Gender</th>
                                                  <th>Email</th>
                                                  <th>Company Name</th>
                                                  <th>Country</th>
                                              </tr>
                                          </thead>
                                          <tbody>
                                              <% 
                                                if (cL.size() == 0){
                                              %>
                                              <tr>      
                                                  <td colspan="6">Data is Empty</td>
                                              </tr>
                                              <%
                                                } else {
                                                    for(int i=0; i < cL.size(); i++){
                                                    //assign an object MailCustomer inside an array into another MailCustomer called 'mC'
                                                        User mC = (User)cL.get(i);
                                              %>
                                              <tr>
                                                  <td><input class="emailRecipient" type="checkbox" name="recipient" value="<%= mC.getEmail() %>"></td>
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
            </form>
          </div>
        </div>
        <script>
            function check(){
                var total = $('.emailRecipient:checked');
                if (total.length == 0){
                    document.getElementById("totalRecipient").value = "0";
                } else {
                    document.getElementById("totalRecipient").value = "1"; 
                }
            }
        </script>
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

