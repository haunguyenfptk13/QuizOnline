<%-- 
    Document   : createNewQuestion
    Created on : May 28, 2020, 2:19:36 AM
    Author     : msi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Question</title>
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
        <a href="DispatcherController?btAction=Logout">Logout</a>
        </font>
        <h1>Create New Question Page</h1>
        <ul>
            <li><a href="search.jsp">Home</a></li>
            <li><a href="createNewQuestion.jsp">Create Question</a></li>
        </ul>
        <form action="DispatcherController" method="POST">
            <c:set var="errors" value="${requestScope.CREATEERROR}" />
            Id* <input type="text" name="txtId" value="" />(2 - 20 char)<br/>
            <c:if test="${not empty errors.idLengthErr}">
                <font color="red">
                ${errors.idLengthErr}
                </font><br/>
            </c:if> 
            Question Content* <input type="text" name="txtQuestionContent" value="" />(6 - 99 char)<br/>
            <c:if test="${not empty errors.questionContentLengthrr}">
                <font color="red">
                ${errors.questionContentLengthrr}
                </font><br/>
            </c:if>  
            Answer A* <input type="text" name="txtAnswerA" value="" />(1 - 99 char)<br/>
            <c:if test="${not empty errors.answerALengthErr}">
                <font color="red">
                ${errors.answerALengthErr}
                </font><br/>
            </c:if>
            Answer B* <input type="text" name="txtAnswerB" value="" />(1 - 99 char)<br/>
            <c:if test="${not empty errors.answerBLengthErr}">
                <font color="red">
                ${errors.answerBLengthErr}
                </font><br/>
            </c:if>
            Answer C* <input type="text" name="txtAnswerC" value="" />(1 - 99 char)<br/>
            <c:if test="${not empty errors.answerCLengthErr}">
                <font color="red">
                ${errors.answerCLengthErr}
                </font><br/>
            </c:if>
            Answer D* <input type="text" name="txtAnswerD" value="" />(1 - 99 char)<br/>
            <c:if test="${not empty errors.answerDLengthErr}">
                <font color="red">
                ${errors.answerDLengthErr}
                </font><br/>
            </c:if>
            Answer Correct* <select name="cboAnswerCorrect">
                <option>A</option>
                <option>B</option>
                <option>C</option>
                <option>D</option>
            </select><br/>
            <c:set var="subjectList" value="${sessionScope.SUBJECTLIST}" />
            <c:if test="${not empty subjectList}">
                Subject* <select name="cboSubject">
                    <c:forEach var="subjectDto" items="${subjectList}">
                        <option>${subjectDto.subjectID}</option>
                    </c:forEach>
                </select><br/>
            </c:if>
            <c:set var="statusList" value="${sessionScope.STATUSLIST}" />
            <c:if test="${not empty statusList}">
                Status* <select name="cboStatus">
                    <c:forEach var="statusDto" items="${statusList}">
                        <option value="${statusDto.statusID}">${statusDto.statusName}</option>
                    </c:forEach>
                </select><br/>
            </c:if>            
            <input type="submit" value="Create New Question" name="btAction"/>
            <input type="reset" value="Reset" />
        </form>
    </body>
</html>
