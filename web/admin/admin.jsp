
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin - Edit</title>
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
                        <h1 class="mt-4">Admin Data</h1>
                        <div class="d-flex align-items-center justify-content-center">
                          
                            
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <p style="color:greenyellow"><c:out value="${alert}"></c:out></p>
                                
                                <form method="post" action="AdminController">
                                    <div class="form-group">
                                                <label class="small mb-1" for="adminname">Username</label>
                                                <input class="form-control py-4" id="adminname" name="adminname" type="text" value="<jsp:getProperty name="admin" property="adminname"/>" disabled/>
                                    </div>
                                    <div class="form-group">
                                                <label class="small mb-1" for="name">Name</label>
                                                <input class="form-control py-4" id="name" name="name" type="text" value="<jsp:getProperty name="admin" property="name"/>" disabled />
                                    </div>
                                </form>
                                    <a href="editadmin.jsp"><button class="btn btn-dark btn-block">Edit Data</button></a>
                                    
                            </div>
                        </div>
                            
                        <br>
                        <br>
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
    </body>
</html>
