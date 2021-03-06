<%-- 
    Document   : login
    Created on : May 21, 2020, 1:28:07 PM
    Author     : msi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
            ul {
                list-style-type: none;
                margin-bottom: 10px;
                padding: 5px;
                overflow: hidden;
                background-color: #4CAF50;
            }

            li {
                float: left;
            }

            li:hover {
                background-color: #3e8e41;
            }
            li a {
                display: block;
                padding: 8px;
                text-decoration: none;
                color: white;
            }
        </style>
    </head>
    <body>
        <h1>Login Page</h1>
        <ul>
            <li><a href="login.html">Home</a></li>
            <li><a href="createNewAccount.html">Create Account</a></li>
        </ul>
        <form action="DispatcherController" method="POST">
            <c:set var="errors" value="${requestScope.CREATEERROR}" />
            Email <input type="text" name="txtEmail" value="${param.txtEmail}" /><br/>
            <c:if test="${not empty errors.emailLengthErr}">
                <font color="red">
                ${errors.emailLengthErr}
                </font><br/>
            </c:if>
            <c:if test="${not empty errors.emailInvalid}">
                <font color="red">
                ${errors.emailInvalid}
                </font><br/>
            </c:if>
            <c:if test="${not empty errors.emailNotExist}">
                <font color="red">
                ${errors.emailNotExist}
                </font><br/>
            </c:if>
            Password <input type="password" name="txtPassword" value="" /><br/>
            <c:if test="${not empty errors.passwordLengthErr}">
                <font color="red">
                ${errors.passwordLengthErr}
                </font><br/>
            </c:if>
            <c:if test="${not empty errors.passwordIncorrect}">
                <font color="red">
                ${errors.passwordIncorrect}
                </font><br/>
            </c:if>
            <input type="submit" value="Login" name="btAction" />
            <input type="reset" value="Reset" name="btAction" /><br/>
        </form>
    </body>
</html>
