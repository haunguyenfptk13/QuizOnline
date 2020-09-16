<%-- 
    Document   : historyQuiz
    Created on : Jun 2, 2020, 12:42:42 PM
    Author     : msi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History Page</title>
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
            table {
                margin-top: 10px;
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                text-align: center;
                padding: 8px;
            }

            tr:nth-child(even){background-color: #f2f2f2}

            th {
                background-color: #4CAF50;
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
        <h1>History Page</h1>
        <ul>
            <li><a href="quiz.jsp">Home</a></li>
            <li><a href="historyQuiz.jsp">Quiz History</a></li>
        </ul>
        <form action="DispatcherController">
            <c:set var="subjectList" value="${sessionScope.SUBJECTLIST}" />
            <c:if test="${not empty subjectList}">
                Choose subject which you want check history* <select name="cboSubject">
                    <c:forEach var="subjectDto" items="${subjectList}">
                        <c:if test="${subjectDto.subjectID == param.cboSubject}">
                            <option selected="selected">${subjectDto.subjectID}</option>
                        </c:if>
                        <c:if test="${subjectDto.subjectID != param.cboSubject}">
                            <option>${subjectDto.subjectID}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </c:if>
            <input type="submit" value="Search History" name="btAction" />
            <input type="hidden" name="txtPageNo" value="1" />
        </form>

        <c:set var="result" value="${requestScope.SEARCHRESULT}" />
        <c:if test="${not empty result}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Quiz ID</th>
                        <th>Email</th>
                        <th>Subject</th>
                        <th>Number Correct</th>
                        <th>Point</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${result}" varStatus="counter">
                        <tr>
                            <td>
                                ${counter.count}
                            </td>
                            <td>
                                ${dto.quizID}
                            </td>
                            <td>
                                ${dto.email}
                            </td>
                            <td>
                                ${dto.subjectID}
                            </td>
                            <td>
                                ${dto.number_correct}
                            </td>
                            <td>
                                ${dto.point}
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <c:if test="${requestScope.PAGENUMBER > 1}">
                <c:forEach begin="1" end="${requestScope.PAGENUMBER}" var="i">
                    <a href="DispatcherController?cboSubject=${param.cboSubject}&txtPageNo=${i}&btAction=Search History">${i}</a>
                </c:forEach>
            </c:if><br/>
            <c:if test="${empty result}">
                <h2>No record is matched</h2>
            </c:if>
        </c:if>
    </body>
</html>
