<%-- 
    Document   : navbar
    Created on : Jan 16, 2021, 5:49:59 PM
    Author     : gobib
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="../PurchaseStatus?login=NO&user=ADMIN&id=<jsp:getProperty name="admin" property="id" />">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayout" aria-expanded="false" aria-controls="collapseLayout">
                                <div class="sb-nav-link-icon"><i class="fas fa-user-friends"></i></div>
                                CRM
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayout" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="../showListCustomer?action=CUSTOMER">Customer Database</a>
                                    <a class="nav-link" href="../showListCampaign">Email Blasting</a>
                                </nav>
                            </div>
                            <a class="nav-link" href="../showProduct?user=ADMIN">
                                <div class="sb-nav-link-icon"><i class="fas fa-store"></i></div>
                                Product
                            </a>
                            
                            
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <c:choose>
                            <c:when test="${sessionScope.admin !=null}">
                                <div class="small">Logged in as:</div>
                                <jsp:useBean class="com.bean.Admin" id="user" scope="session"/>
                                <jsp:getProperty name="admin" property="adminname" />
                            </c:when>
                            <c:when test="${sessionScope.admin ==null}">
                                <div class="large">You are not logged in</div>
                            </c:when>
                        </c:choose>
                    </div>
                </nav>
            </div>
