<%-- 
    Document   : add-contact
    Created on : Jan 16, 2021, 6:05:15 PM
    Author     : gobib
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Add Customer</title>
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
                            <li class="breadcrumb-item active">Add Customer Contact</li>
                        </ol>
                        <form method="post" action="../insertListCustomer">


                        <div class="row">
                          <div class="col-12">
                            <div class="card">
                              <div class="card-header text-dark">
                                <span>Add New Contact</span>
                              </div>

                              <div class="card-body">
                                <div class="background-grey">
                                  <div class="row">
                                    <div class="col-sm-6">
                                      <div class="form-group row">
                                        <label for="contact-first-name" class="col-sm-4 col-form-label">First Name<span style="color: red;">*</span></label>
                                        <div class="col-sm-8">
                                          <input type="text" class="form-control" id="contact-first-name" name="first-name" aria-describedby="contact-first-name" placeholder="Write Your Name Here" required>
                                        </div>
                                      </div>
                                      <hr>
                                      <div class="form-group row">
                                        <label for="contact-last-name" class="col-sm-4 col-form-label">Last Name</label>
                                        <div class="col-sm-8">
                                          <input type="text" class="form-control" id="contact-last-name" name="last-name" aria-describedby="contact-last-name" placeholder="Write your last name here">
                                        </div>
                                      </div>
                                      <div class="form-group row">
                                        <label for="date-of-birth" class="col-sm-4 col-form-label">Date of Birth</label>
                                        <div class="col-sm-8">
                                            <input type="date" class="form-control" id="date-of-birth" name="date-of-birth" aria-describedby="date-of-birth">
                                        </div>
                                      </div>
                                      <div class="form-group row">
                                        <label for="contact-gender" class="col-sm-4 col-form-label">Gender</label>
                                        <div class="col-sm-8">
                                          <div class="form-check row">
                                            <div class="col-sm-12">
                                              <input class="form-check-input" type="radio" name="gender" id="contact-gender-m" value="Male" checked>
                                              <p class="form-check-label" for="contact-gender-lk">
                                                Male
                                              </p>
                                            </div>
                                            <div class="col-sm-12">
                                              <input class="form-check-input" type="radio" name="gender" id="contact-gender-f" value="Female">
                                              <p class="form-check-label" for="contact-gender-pr">
                                                Female
                                              </p>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                      
                                      <div class="form-group row">
                                        <label for="contact-industry" class="col-sm-4 col-form-label">Industry Field</label>
                                        <div class="col-sm-8">
                                          <select id="contact-industry" class="form-control" name="industry-field">
                                            <option value="" selected>Choose:</option>
                                            <option value="finance">Finance</option>
                                            <option value="Technology">Technology</option>
                                            <option value="Service">Service</option>
                                          </select>
                                        </div>
                                      </div>
                                      <div class="form-group row">
                                        <label for="contact-category" class="col-sm-4 col-form-label">Category</label>
                                        <div class="col-sm-8">
                                          <select id="contact-category" class="form-control" name="category">
                                            <option value="" selected>Choose:</option>
                                            <option value="individu">Individu</option>
                                            <option value="Corporation">Corporation</option>
                                            <option value="Government">Government</option>
                                          </select>
                                        </div>
                                      </div>
                                      <div class="form-group row">
                                        <label for="contact-company" class="col-sm-4 col-form-label">Company Name</label>
                                        <div class="col-sm-8">
                                          <input type="text" class="form-control" id="contact-company" name="company-name" aria-describedby="contact-company" placeholder="Write company name here">
                                        </div>
                                      </div>
                                    </div>
                                    <!-- switch -->
                                    <div class="col-sm-6">
                                      <div class="form-group row">
                                        <label for="contact-email" class="col-sm-4 col-form-label">Email<span style="color: red;">*</span></label>
                                        <div class="col-sm-8">
                                          <input type="email" class="form-control" id="contact-email" name="email" aria-describedby="contact-email" placeholder="write your email here" required>
                                        </div>
                                      </div>
                                      <hr>
                                      <div class="form-group row">
                                        <label for="contact-telp" class="col-sm-4 col-form-label">Phone No<span style="color: red;">*</span></label>
                                        <div class="col-sm-8">
                                            <input type="telp" class="form-control" id="contact-telp" name="phone-no" aria-describedby="contact-telp" pattern="[0-9]{11}" placeholder="011-62378326" required="">
                                            <span class="text-primary"> Format: 01234567891 </span>
                                        </div>
                                      </div>
                                      
                                      <div class="form-group row">
                                        <label for="contact-address" class="col-sm-4 col-form-label">Address</label>
                                        <div class="col-sm-8">
                                          <textarea rows="3" type="text" class="form-control" name="address" id="contact-address" aria-describedby="contact-address" placeholder="Write your address here"></textarea>
                                        </div>
                                      </div>
                                      <div class="form-group row">
                                        <label for="contact-country" class="col-sm-4 col-form-label">Country</label>
                                        <div class="col-sm-8">
                                          <input type="text" class="form-control" name="country" placeholder="Write your country here">
                                        </div>
                                      </div>
                                      <div class="form-group row">
                                        <label for="contact-province" class="col-sm-4 col-form-label">Provinsi/State</label>
                                        <div class="col-sm-8">
                                          <input type="text" class="form-control" name="province-state" placeholder="Write your province/state here">
                                        </div>
                                      </div>
                                      <div class="form-group row">
                                        <label for="contact-city" class="col-sm-4 col-form-label">City</label>
                                        <div class="col-sm-8">
                                          <input type="text" class="form-control" name="city" placeholder="Write your city here">
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="card-footer ">
                                <div class="row float-right">
                                  <a href="../showListCustomer?action=cancel" class="btn btn-danger">Cancel</a> &nbsp;
                                  <input type="submit" class="btn btn-primary" value="Save">
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

