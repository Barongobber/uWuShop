<%-- 
    Document   : add-blasting
    Created on : Jan 16, 2021, 6:15:17 PM
    Author     : gobib
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Add Blasting</title>
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
                        <h1 class="mt-4">Email Blasting</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Email Content</li>
                        </ol>
                        <form method="post" action="../blastEmail">
                        <div class="row">
                          <div class="col-12">
                            <div class="card">
                              <div class="card-header text-dark">
                                <span>Fill an Email Content</span>
                              </div>

                              <div class="card-body">
                                <div class="background-grey">
                                  <div class="row">
                                    <!-- switch -->
                                    <div class="col-sm-12">
                                      <div class="form-group row">
                                        <label for="campaign-name" class="col-sm-4 col-form-label">Campaign Name<span style="color: red;">*</span></label>
                                        <div class="col-sm-8">
                                          <input type="text" class="form-control" id="campaign-name" name="campaign-name" aria-describedby="campaign-name" placeholder="write your campaign name here" required>
                                        </div>
                                      </div>
                                      <div class="form-group row">
                                        <label for="subject-email" class="col-sm-4 col-form-label">Subject Email</label>
                                        <div class="col-sm-8">
                                          <input type="text" class="form-control" name="subject-email" placeholder="Write your subject here">
                                        </div>
                                      </div>
                                      <hr>
                                      <div class="form-group row">
                                        <label for="content-email" class="col-sm-4 col-form-label">Content Email<span style="color: red;">*</span></label>
                                        <div class="col-sm-8">
                                            <textarea name="content-email" class="form-control" placeholder="Write your content here" rows="8" cols="80" required=""></textarea>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="card-footer ">
                                <div class="row float-right">
                                  <a href="../showListCampaign" class="btn btn-danger">Cancel</a> &nbsp;
                                  <input type="submit" class="btn btn-primary" value="Send">
                                </div>
                              </div>

                            </div>
                          </div>
                        </div>
                        </form><br>
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

