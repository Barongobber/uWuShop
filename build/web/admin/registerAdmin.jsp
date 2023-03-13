<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Register New Admin</title>
        <link href="../dist/css/styles.css" rel="stylesheet" />
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
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Create Admin Account</h3></div>
                                    <div class="card-body">
                                        <form method="post" action="AdminController">
                                            <div class="form-row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="adminname">Adminname</label>
                                                        <input class="form-control py-4" name="adminname" id="adminname" required type="text" placeholder="Enter  adminname" />
                                                    </div>
                                                </div>
                                                <div class="col-xl-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="name">Full Name</label>
                                                        <input class="form-control py-4" name="name" id="name" required type="text" placeholder="Enter name" />
                                                    </div>
                                                </div>
                                            </div>
                                            <p style="color:red"><c:out value="${alert}"></c:out></p>
                                            
                                            <div class="form-row">
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
                                            </div>
                                            
                                            <input type="hidden" name="control" value="registerAdmin"/>
                                           
                                            <div class="form-group mt-4 mb-0"><input type="submit" class="btn btn-primary btn-block" value="Create Account"></div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="login.jsp">Have an account? Go to login</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <%@include file="../footer/footer.jsp" %>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>

