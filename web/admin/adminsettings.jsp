<%-- 
    Document   : adminsettings
    Created on : Jan 22, 2021, 10:37:20 AM
    Author     : User
--%>



<%@page import="com.bean.Admin"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Account Settings</title>
        <link href="../dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
        <script>
            function validatePass(){
                 if (document.getElementById('password').value ==
                    document.getElementById('cpassword').value) {
                    document.getElementById('alert').style.color = 'green';
                    document.getElementById('alert').innerHTML = 'Password matches';
                } else {
                    document.getElementById('alert').style.color = 'red';
                    document.getElementById('alert').innerHTML = 'Password does not match';
                }
            }
        </script>
    </head>

        <body class="sb-nav-fixed">
        <%@include file="../bar/topbar.jsp" %>
        <div id="layoutSidenav">
            <%@include file="../bar/sidebar.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <% Admin admin= (Admin) session.getAttribute("admin");  %>
                        <h1 class="mt-4">Hello <%= admin.getAdminname() %></h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Admin Settings</li>
                        </ol>
                        <section id="changepassword">
                            <div class="card">
                                <div class="card-body">
                                    <form action="AdminController" method="post">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="small mb-1" for="password">Password</label>
                                                <input class="form-control py-4" name="password" id="password" type="password" placeholder="Enter password" required />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="small mb-1" for="cpassword">Confirm Password</label>
                                                <input class="form-control py-4" name="cpassword" id="cpassword" type="password" placeholder="Confirm password" onkeyup='validatePass()' />
                                            </div>
                                        </div>
                                        <div class="col-md-7" id='alert'></div>
                                        <p style="color:red"><c:out value="${alert}"></c:out></p>
                                        <p style="color:green"><c:out value="${msg}"></c:out></p>
                                        <input type="hidden" name="control" value="changePassword" />
                                        <div class="form-group mt-4 mb-0"><input type="submit" class="btn btn-secondary" value="Change Password"></div>
                                    </form>
                                </div>
                            </div>
                        </section>
                        <br>
                        <section id="deleteaccount">
                            <div class="card">
                                <div class="card-body">
                                    <h6>Delete account</h6>
                                    Please click the delete button below to delete your account.<br>
                                    <p style="color:red">Once you delete your account your data will be deleted and you will have to register again to use the website's feature.</p>
                                    <a href="AdminController?control=deleteAccount"><button class="btn btn-danger">Delete Account</button></a>
                                </div>
                            </div>
                        </section>
                       
                       
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