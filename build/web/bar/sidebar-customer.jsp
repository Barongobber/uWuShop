<%-- 
    Document   : navbar
    Created on : Jan 16, 2021, 5:49:59 PM
    Author     : gobib
--%>
<%@page import="com.bean.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="index.jsp"">
                                <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                                Homepage
                            </a>
                            <a class="nav-link" href="showProduct?user=CUSTOMER">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                All Products
                            </a>
                        <c:choose>
                            <c:when test="${sessionScope.user !=null}">
                            <div class="sb-sidenav-menu-heading">Extra Menu</div>

                            <a class="nav-link" href="PurchaseStatus?login=YES&user=CUSTOMER&id=<jsp:getProperty name="user" property="id" />">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Purchase History
                            </a>
                            </c:when>
                        </c:choose>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <c:choose>
                            <c:when test="${sessionScope.user !=null}">
                                <div class="small">Logged in as:</div>
                                <jsp:useBean class="com.bean.User" id="user" scope="session"/>
                                <jsp:getProperty name="user" property="username" />
                            </c:when>
                            <c:when test="${sessionScope.user ==null}">
                                <div class="large">You are not logged in</div>
                            </c:when>
                        </c:choose>
                    </div>
                </nav>
            </div>
