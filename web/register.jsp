<%-- 
    Document   : register
    Created on : Sep 18, 2019, 8:09:47 PM
    Author     : dinht
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
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

            <div>
                <P class="register-header">
                    Login Form
                </p>
                <form action="register" method="POST" name="registerForm">
                    <table>
                        <tr>
                            <td class="register-text">
                                Username:
                            </td>
                            <td>
                                <input type="text" name="username"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="register-text">
                                Password:
                            </td>
                            <td>
                                <input type="password" name="password"/>
                            </td>
                        </tr>
                        <tr>
                            <td>User type</td>
                            <td>
                                <select name="type">
                                    <option value="1">Teacher</option>
                                    <option value="0">Student</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="email" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="button" value="Register" onclick="ValidateEmail(document.registerForm.email)"/></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>

<script>
    function ValidateEmail(inputText)
    {
        var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if (inputText.value.match(mailformat))
        {
            document.registerForm.submit();
            return true;
        } else
        {
            alert("You have entered an invalid email address!");
            document.registerForm.email.focus();
            return false;
        }
    }
</script>