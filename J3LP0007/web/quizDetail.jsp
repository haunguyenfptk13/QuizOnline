<%-- 
    Document   : quizDetail
    Created on : Jun 1, 2020, 1:13:08 PM
    Author     : msi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz Detail</title>
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
        <h1>Quiz Detail</h1>
        <ul>
            <li><a href="quiz.jsp">Home</a></li>
            <li><a href="historyQuiz.jsp">Quiz History</a></li>
        </ul>
        Number Correct : ${requestScope.NUMBERCORRECT}<br/>
        Score: ${requestScope.SCORE}<br/>
    </body>
</html>
