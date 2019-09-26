<%-- 
    Document   : index
    Created on : Sep 18, 2019, 9:24:18 AM
    Author     : dinht
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <style><%@include file="css/style.css" %></style>
    </head>
    <body class="body">
        <div class="containner">
            <div class="menu-bar">
                <ul>
                    <li><a href="home">Home</a></li>
                    <li><a href="#">Take Quiz</a></li>
                    <li><a href="#">Make Quiz</a></li>
                    <li><a href="#">Manage Quiz</a></li>
                </ul>
            </div>

            <c:choose>
                <c:when test="${requestScope.user != null}">
                    <h3>Welcome ${requestScope.user.getUsername()}</h3>
                </c:when>
                <c:otherwise>
                    <div class="login-container">
                        <P class="login-header">
                            Login Form
                        </p>
                        <form action="home" method="GET">
                            <table>
                                <tr>
                                    <td class="login-text">
                                        Username:
                                    </td>
                                    <td>
                                        <input type="text" name="username"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="login-text">
                                        Password:
                                    </td>
                                    <td>
                                        <input type="password" name="password"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td style="text-align: left">
                                        <input type="submit" value="Sign in"/>&nbsp;
                                        <a href="#" class="register">Register</a>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

    </body>
</html>
