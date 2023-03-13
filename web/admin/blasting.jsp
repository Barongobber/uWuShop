<%-- 
    Document   : blasting
    Created on : Jan 16, 2021, 6:11:07 PM
    Author     : gobib
--%>

<%@page import="com.bean.Admin"%>
<%@page import="com.bean.Campaign"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList cL = (ArrayList) session.getAttribute("campList");
        Admin ad = (Admin) session.getAttribute("admin");

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
                <main>
                    <form method="post" action="../showListCustomer">
                        <div class="container-fluid">
                            <h1 class="mt-4">Email Blasting</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">Blasting History</li>
                            </ol>
                            <div class="row">
                              <div class="col-md-12 text-right form-group">
                                  <input type="text" hidden="" value="BLAST" name="action">
                                  <input type="submit" value="Blasting Email" class="btn btn-primary">
                              </div>
                            </div>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table mr-1"></i>
                                    Blasting History
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Name Campaign</th>
                                                    <th>Subject Campaign</th>
                                                    <th>Total Recipients</th>
                                                    <th>Blasted On</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%  if(cL.size() == 0){ %>
                                                <tr>
                                                    <td colspan="4" class="text-center">Data is Empty</td>
                                                </tr>
                                                <% } else { 
                                                    for(int i=0; i < cL.size(); i++) {
                                                    Campaign c = (Campaign) cL.get(i);
                                                %>
                                                <tr>
                                                    <td><%= c.getCampaignName() %></td>
                                                    <td><%= c.getCampaignSubject() %></td>
                                                    <td><%= c.getTotalRec() %></td>
                                                    <td><%= c.getBlastedDate() %></td>
                                                    <td><a href="../deleteBlast?action=DELETE&id=<%= c.getCampaignID() %>"><i class="fas fa-trash-alt"></i></a></td>
                                                </tr>
                                                <% } } %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                                    <div class="row">
                                        <div class="col-md-12 text-center form-group">
                                            <input type="text" hidden="" value="BLAST" name="action">
                                            <!--<input type="submit" value="Delete All History" class="btn btn-danger"><i class="bi bi-trash"></i>-->
                                            <a class="btn btn-danger" href="../deleteBlast?action=DELETE_ALL">Delete All History <i class="fas fa-trash-alt"></i></a>
                                        </div>
                                    </div>
                        </div>
                        
                    </form>
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

