<%-- 
    Document   : topbar
    Created on : Jan 16, 2021, 5:58:47 PM
    Author     : gobib
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="index.jsp">UwU Shop</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            <ul class="navbar-nav ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <li class="nav-item dropdown">
                <c:choose>
                    <c:when test="${sessionScope.user == null}">
			<div>
                            <a href="login.jsp"><button class="btn btn-primary">Login</button></a>
                         </div>
                    </c:when>
                    <c:when test="${sessionScope.user != null}">
                        <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="user.jsp">User</a>
                            <a class="dropdown-item" href="usersettings.jsp">Settings</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="UserController?control=logoutUser">Logout</a>
                        </div>
                    </c:when>
		</c:choose>
                </li>
            </ul>
        </nav>
