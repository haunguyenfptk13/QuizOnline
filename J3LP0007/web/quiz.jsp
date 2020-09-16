<%-- 
    Document   : quiz
    Created on : May 30, 2020, 3:55:40 AM
    Author     : msi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Page</title>
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
        <h1>Quiz Online</h1>
        <ul>
            <li><a href="quiz.jsp">Home</a></li>
            <li><a href="historyQuiz.jsp">Quiz History</a></li>
        </ul>
        <form action="DispatcherController">
            <c:set var="subjectList" value="${sessionScope.SUBJECTLIST}" />
            <c:if test="${not empty subjectList}">
                Choose subject which you want test* <select name="cboSubject">
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
            <input type="hidden" name="txtThoigian" value="${sessionScope.TIME}" id="thoigian_txt" />
            <input type="submit" value="Start" name="btAction" id="start_btn"/>
        </form>
        <br/><br/><br/>
        <c:set var="result" value="${requestScope.QUIZ}"/>
        <c:if test="${not empty result}">
            <script>
                document.getElementById("start_btn").style.display = 'none';
                var thoigian = document.getElementById("thoigian_txt").value;
                function demNguoc() {
                    thoigian--;
                    document.getElementById("thoigianAgain_txt").value = thoigian;
                    var phut = Math.floor(thoigian / 60);
                    var giay = thoigian % 60;
                    if (giay < 10) {
                        giay = "0" + giay;
                    }
                    if (phut < 10) {
                        phut = "0" + phut;
                    }
                    if (thoigian > 0) {
                        document.getElementById("dongho").innerHTML = "Time: " + phut + ":" + giay;
                    } else {
                        document.getElementById("finished").click();
                    }
                }
                setInterval("demNguoc()", 1000);
            </script>
            <form action="DispatcherController">
                <div style="margin-left: 100px; margin-bottom: 20px; font-size: 20px">
                    <c:forEach var="dto" items="${result}">
                        <p style="font-weight: bold">${dto.id}. ${dto.question_content}</p>
                        <c:set var="pageNo" value="${param.txtPageNo}" />
                        <c:set var="answerList" value="${sessionScope.ANSWERLIST}" />
                        <c:forEach var="quizList" items="${answerList}">
                            <c:if test="${quizList.key == param.txtPageNo}">
                                <c:set var="yourAnswer" value="${quizList.value}" />
                            </c:if>
                        </c:forEach>
                        <input type="radio" name="rdoAnswer" value="A" 
                               <c:if test="${yourAnswer == 'A'}">
                                   checked="checked"
                               </c:if>/>A. ${dto.a1}<br/>
                        <input type="radio" name="rdoAnswer" value="B" 
                               <c:if test="${yourAnswer == 'B'}">
                                   checked="checked"
                               </c:if>/>B. ${dto.a2}<br/>
                        <input type="radio" name="rdoAnswer" value="C" 
                               <c:if test="${yourAnswer == 'C'}">
                                   checked="checked"
                               </c:if>/>C. ${dto.a3}<br/>
                        <input type="radio" name="rdoAnswer" value="D" 
                               <c:if test="${yourAnswer == 'D'}">
                                   checked="checked"
                               </c:if>/>D. ${dto.a4}<br/> 
                    </c:forEach></div>
                <input type="submit" value="Previous" name="btAction" style="margin-right: 0; margin-left: 80px;"/>
                <input type="submit" value="Next" name="btAction" style="margin-left: 10px"/><br/>
                Click here to submit =>
                <input type="submit" value="Finished" name="btAction" id="finished" style="margin-top: 20px"/>
                <input type="hidden" name="pageNoValue" value="${param.txtPageNo}" />
                <input type="hidden" name="pageNumberValue" value="${requestScope.PAGENUMBER}" />
                <input type="hidden" name="thoigianValue" id="thoigianAgain_txt" />
            </form>
            <p id="dongho" style="font-size: 20px; color: red; margin-bottom: 10px"></p>
        </c:if>
    </body>
</html>
