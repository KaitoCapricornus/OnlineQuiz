<%-- 
    Document   : managequiz
    Created on : Sep 18, 2019, 8:09:33 PM
    Author     : dinht
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Quiz Page</title>
        <style><%@include file="css/style.css" %></style>
        <style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #dddddd;
            }
        </style>
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
            <div>
                <center>
                    <table id="manage_table">
                        <tr>
                            <th>Question</th>
                            <th>Created Date</th>
                        </tr>
                        <c:forEach items="${requestScope.quizs}" var="quiz">
                            <tr>
                                <td><a href="updatequiz?id=${quiz.getQuizID()}">${quiz.getQuestion()}</a></td>
                                <td>${quiz.getCreatedDate()}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </center>
            </div>
        </div>
    </body>
</html>
