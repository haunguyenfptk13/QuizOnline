<%-- 
    Document   : search
    Created on : May 21, 2020, 1:06:18 PM
    Author     : msi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
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
        <h1>Search Page</h1>
        <ul>
            <li><a href="search.jsp">Home</a></li>
            <li><a href="createNewQuestion.jsp">Create Question</a></li>
        </ul>
        <form action="DispatcherController">
            Search Value <input type="text" name="txtSearchValue" value="${param.txtSearchValue}" />
            <c:set var="statusList" value="${sessionScope.STATUSLIST}" />
            <c:if test="${not empty statusList}">
                <select name="cboStatus">
                    <c:forEach var="statusDto" items="${statusList}">
                        <c:if test="${statusDto.statusID == param.cboStatus}">
                            <option value="${statusDto.statusID}" selected="selected">${statusDto.statusName}</option>
                        </c:if>
                        <c:if test="${statusDto.statusID != param.cboStatus}">
                            <option value="${statusDto.statusID}">${statusDto.statusName}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </c:if>
            <c:set var="subjectList" value="${sessionScope.SUBJECTLIST}" />
            <c:if test="${not empty subjectList}">
                <select name="cboSubject">
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
            <input type="hidden" name="txtPageNo" value="1" />
            <input type="submit" value="Search" name="btAction" />
        </form>
        <c:set var="searchValue" value="${param.txtSearchValue}" />
        <c:if test="${not empty searchValue}">
            <c:set var="result" value="${requestScope.SEARCHRESULT}" />
            <c:if test="${not empty result}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>ID</th>
                            <th>Question Content</th>
                            <th>Answer Correct</th>
                            <th>Answer A</th>
                            <th>Answer B</th>
                            <th>Answer C</th>
                            <th>Answer D</th>
                            <th>Create Date</th>
                            <th>Subject</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${result}" varStatus="counter">
                        <form action="DispatcherController">
                            <tr>
                                <td>
                                    ${counter.count}.
                                </td>
                                <td>
                                    ${dto.id}
                                    <input type="hidden" name="txtId" value="${dto.id}" />
                                </td>
                                <td>
                                    <input type="text" name="txtQuestionContent" value="${dto.question_content}" />
                                </td>
                                <td>
                                    <select name="cboAnswerCorrect" style="width: 100%">
                                        <option 
                                            <c:if test="${dto.answer_correct == 'A'}">selected="selected"</c:if>
                                                >A</option>
                                            <option 
                                            <c:if test="${dto.answer_correct == 'B'}">selected="selected"</c:if>
                                                >B</option>
                                            <option 
                                            <c:if test="${dto.answer_correct == 'C'}">selected="selected"</c:if>
                                                >C</option>
                                            <option 
                                            <c:if test="${dto.answer_correct == 'D'}">selected="selected"</c:if>
                                                >D</option>
                                        </select>
                                    </td>   
                                    <td>
                                        <input type="text" name="txtAnswerA" value="${dto.a1}" />
                                </td>
                                <td>
                                    <input type="text" name="txtAnswerB" value="${dto.a2}" />
                                </td>
                                <td>
                                    <input type="text" name="txtAnswerC" value="${dto.a3}" />
                                </td>
                                <td>
                                    <input type="text" name="txtAnswerD" value="${dto.a4}" />
                                </td>
                                <td>
                                    ${dto.createDate}
                                </td>
                                <td>
                                    <select name="cboUpdateSubject">
                                        <c:forEach var="subjectDto" items="${subjectList}">
                                            <c:if test="${subjectDto.subjectID == param.cboSubject}">
                                                <option selected="selected">${subjectDto.subjectID}</option>
                                            </c:if>
                                            <c:if test="${subjectDto.subjectID != param.cboSubject}">
                                                <option>${subjectDto.subjectID}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td>
                                    <c:if test="${dto.statusID == 1}">
                                        ${"Active"}
                                    </c:if>
                                    <c:if test="${dto.statusID == 2}">
                                        ${"Deactive"}
                                    </c:if>
                                </td>
                                <td>
                                    <c:url var="delLink" value="DispatcherController">
                                        <c:param name="btAction" value="delete" />
                                        <c:param name="pk" value="${dto.id}" />
                                        <c:param name="lastSearchValue" value="${param.txtSearchValue}" />
                                        <c:param name="lastSubjectValue" value="${param.cboSubject}" />
                                        <c:param name="lastStatusValue" value="${param.cboStatus}" />
                                        <c:param name="pageNoValue" value="${param.txtPageNo}" />
                                    </c:url>
                                    <a href="${delLink}">Delete</a>
                                </td>
                                <td>
                                    <input type="submit" value="Update" name="btAction" />
                                    <input type="hidden" name="lastSearchValue" value="${param.txtSearchValue}" />                                    
                                    <input type="hidden" name="lastSubjectValue" value="${param.cboSubject}" />
                                    <input type="hidden" name="lastStatusValue" value="${param.cboStatus}" />
                                    <input type="hidden" name="lastPageNoValue" value="${param.txtPageNo}" />
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>

        </c:if>
        <c:if test="${requestScope.PAGENUMBER > 1}">
            <c:forEach begin="1" end="${requestScope.PAGENUMBER}" var="i">
                <a href="DispatcherController?txtSearchValue=${param.txtSearchValue}&cboStatus=${param.cboStatus}&cboSubject=${param.cboSubject}&txtPageNo=${i}&btAction=Search">${i}</a>
            </c:forEach>
        </c:if>
        <br/>
        <c:if test="${empty result}">
            <h2>No record is matched</h2>
        </c:if>
    </c:if>
</body>
</html>
