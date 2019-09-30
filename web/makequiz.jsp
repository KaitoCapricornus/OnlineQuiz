<%-- 
    Document   : makequiz
    Created on : Sep 18, 2019, 8:09:20 PM
    Author     : dinht
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Make Quiz Page</title>
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
            <center>
                <form action="makequiz" method="POST">
                    <input type="hidden" name="creater" value="${requestScope.user.getUsername()}"/>
                    <table>
                        <tr>
                            <td style="vertical-align: top"><h4>Question:</h4></td>
                            <td><textarea name="question" rows="10" cols="50"></textarea></td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top"><h4>Option 1:</h4></td>
                            <td><textarea name="option1" rows="4" cols="50"></textarea></td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top"><h4>Option 2:</h4></td>
                            <td><textarea name="option2" rows="4" cols="50"></textarea></td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top"><h4>Option 3:</h4></td>
                            <td><textarea name="option3" rows="4" cols="50"></textarea></td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top"><h4>Option 4:</h4></td>
                            <td><textarea name="option4" rows="4" cols="50"></textarea></td>
                        </tr>
                        <tr>
                            <td><h4>Answer(s):</h4></td>
                            <td>
                                <input name="answers" value="1" type="checkbox"/>Option 1 &nbsp;&nbsp;
                                <input name="answers" value="2" type="checkbox"/>Option 2 &nbsp;&nbsp;
                                <input name="answers" value="3" type="checkbox"/>Option 3 &nbsp;&nbsp;
                                <input name="answers" value="4" type="checkbox"/>Option 4 &nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td></td><td><input type="submit" value="Save"/></td>
                        </tr>
                    </table>
                </form>
            </center>
        </div>
    </body>
</html>
