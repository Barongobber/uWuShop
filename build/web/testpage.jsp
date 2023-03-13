<%-- 
    Document   : testpage
    Created on : Jan 16, 2021, 2:29:06 PM
    Author     : User
--%>

<%@page import="com.bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            User user=(User)session.getAttribute("user");
        %>
    </body>
</html>
