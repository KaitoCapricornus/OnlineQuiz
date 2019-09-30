<%-- 
    Document   : takequiz
    Created on : Sep 18, 2019, 8:09:09 PM
    Author     : dinht
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Take Quiz Page</title>
        <style><%@include file="css/style.css" %></style>
    </head>
    <body class="body">
        <div class="containner">
            <div class="menu-bar">
                <ul>
                    <li><a href="home">Home</a></li>
                    <li><a href="takequiz">Take Quiz</a></li>
                    <li><a href="makequiz">Make Quiz</a></li>
                    <li><a href="managequiz">Manage Quiz</a></li>
                    <li><a href="logout" style="display: ${requestScope.user == null ? "none" : ""}">Logout</a></li>
                </ul>
            </div>
            <h2>Welcome ${requestScope.user.getUsername()}</h2>
        </div>
    </body>
</html>
