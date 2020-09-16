<%-- 
    Document   : activeAccount
    Created on : Jun 2, 2020, 2:47:07 PM
    Author     : msi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Active Account Page</title>
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
        <font color="red">
        <c:if test="${empty sessionScope.FULLNAME}">
            <c:redirect url="login.html" />
        </c:if>
        Welcome, ${sessionScope.FULLNAME}
        </font>
        <a href="DispatcherController?btAction=Logout">Logout</a>
        <h1>Active Account Page</h1>
        <ul>
            <li><a href="activeAccount.jsp">Home</a></li>
        </ul>
        <form action="DispatcherController">
            Click here to active your account* <input type="submit" value="Active" name="btAction" />
        </form>
    </body>
</html>
