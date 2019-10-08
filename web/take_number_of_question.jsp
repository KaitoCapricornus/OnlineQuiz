<%-- 
    Document   : take_number_of_question
    Created on : Oct 8, 2019, 8:37:18 AM
    Author     : dinht
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Take Number Of Question Page</title>
        <style><%@include file="css/style.css" %></style>
    </head>
    <body class="body">
        <div class="containner">
            <div class="menu-bar">
                <ul>
                    <li><a href="home">Home</a></li>
                    <li><a href="takenoquestion">Take Quiz</a></li>
                    <li><a href="makequiz">Make Quiz</a></li>
                    <li><a href="managequiz">Manage Quiz</a></li>
                    <li><a href="logout" style="display: ${sessionScope.user == null ? "none" : ""}">Logout</a></li>
                </ul>
            </div>
            <h2>Welcome ${sessionScope.user.getUsername()}</h2>
            <div>
                <form action="takenoquestion" method="POST">
                    Enter number of question:<br/>
                    <input type="number" name="NoQuestion"/><br/>
                    <input type="submit" value="Start"/>
                </form>
            </div>
        </div>
    </body>
</html>