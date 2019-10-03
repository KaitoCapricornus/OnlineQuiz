<%-- 
    Document   : login
    Created on : Sep 25, 2019, 2:44:27 PM
    Author     : dinht
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
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
            <div class="login-container">
                <P class="login-header">
                    Login Form
                </p>
                <form action="login" method="POST">
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
                                <a href="register" class="register">Register</a>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>

</body>
</html>