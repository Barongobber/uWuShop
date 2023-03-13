

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Edit User</title>
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
                        <h1 class="mt-4">Edit Data</h1>
                        <div class="d-flex align-items-center justify-content-center">
                          
                            
                        </div>
                        <div class="card">
                            <div class="card-body">
                                
                                <form method="post" action="UserController">
                                    <p style="color:red"><c:out value="${alert}"></c:out></p>
                                    <div class="form-group">
                                                <label class="small mb-1" for="username">Username</label>
                                                <input class="form-control py-4" id="username" name="username" type="text" value="<jsp:getProperty name="user" property="username"/>" readonly/>
                                                <label class="small mb-1" style="color:crimson">Username can't be changed</label>
                                    </div>
                                    <div class="form-group">
                                                <label class="small mb-1" for="name">Name</label>
                                                <input class="form-control py-4" id="name" name="name" type="text" value="<jsp:getProperty name="user" property="name"/>" />
                                    </div>
                                    <div class="form-group">
                                                <label class="small mb-1" for="email">Email Addess</label>
                                                <input class="form-control py-4" id="email" name="email" type="email" value="<jsp:getProperty name="user" property="email"/>" />
                                    </div>
                                    <div class="form-group">
                                                <label class="small mb-1" for="address">Address</label>
                                                <input class="form-control py-4" id="address" name="address" type="text" value="<jsp:getProperty name="user" property="address"/>" />
                                    </div>
                                    <div class="form-group">
                                                <label class="small mb-1" for="phonenum">Phone Number</label>
                                                <input class="form-control py-4" id="phonenum" name="phonenum" type="text" value="<jsp:getProperty name="user" property="phonenum"/>" />
                                    </div>
                                   
                                    <div class="form-group">
                                        <label class="small mb-1" for="crmsubs">Subscribe to newsletter: </label>
                                        <label for="yes">Yes</label>
                                        <input type="radio" id="yes" name="crmsubs" value="true" <%if(((User)session.getAttribute("user")).isCrmsubs()){ %>checked<% } %>/>
                                        <label for="no">No</label>
                                        <input type="radio" id="no" name="crmsubs" value="false"<%if(!(((User)session.getAttribute("user")).isCrmsubs())){ %>checked<% } %>/>
                                    </div>
                                    <input type="hidden" name="control" id="control" value="updateUser"/>
                                    <input type="submit" class="btn btn-primary btn-block"/>
                                </form>    
                            </div>
                        </div>
                            
                        <br>
                        <br>
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
    </body>
</html>
