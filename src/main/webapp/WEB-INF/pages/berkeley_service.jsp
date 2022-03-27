<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Berkeley</title>
        <jsp:include page="./includes/html-head.jsp" />
    </head>
    <body>
        <!-- Loader begin -->
        <jsp:include page="./includes/loader.jsp"/>
        <!-- Loader end -->

        <div class="container-xl min-vh-100">
            <!-- Header begin -->
            <jsp:include page="./includes/header.jsp"/>
            <!-- Header end -->  

            <!-- Header begin -->
            <jsp:include page="./includes/navbar.jsp"/>
            <!-- Header end --> 

            <!-- Berkeley url begin -->
            <h4 class="fw-bold mt-5 pb-3 border-4 border-bottom border-danger d-inline-block">1. Berkeley URL services</h4>
            <div class="mt-2">
                <div class="table-responsive">
                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                        <thead
                            style="background-color: #d30000"
                            class="text-white align-middle"
                            >
                            <tr class="text-center align-middle text-nowrap">
                                <th>STT</th>
                                <th>URL</th>
                                <th>Mô tả</th>
                            </tr>
                        </thead>
                        <tbody class="fw-bold align-middle">
                            <tr>
                                <td class="text-center">1</td>
                                <td><a target="_blank" href="<c:url value='${request.contextPath}/ExamForBerkeley?wsdl'/>"><script>document.write(window.location.origin.replace("https://", "http://"));</script>${pageContext.request.contextPath}/ExamForBerkeley?wsdl</a></td>
                                <td>Web Service cho giải thuật Berkeley</td>
                            </tr>
                        </tbody>
                    </table>            
                </div>               
            </div>
            <!-- Berkeley url end --> 

            <!-- Berkeley list question begin -->
            <h4 class="fw-bold mt-5 pb-3 border-4 border-bottom border-danger d-inline-block">2. Berkeley questions</h4>
            <div class="mt-2">
                <div class="table-responsive">
                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                        <thead
                            style="background-color: #d30000"
                            class="text-white align-middle"
                            >
                            <tr class="text-center align-middle text-nowrap">
                                <th>QuestionId</th>
                                <th>Đề bài</th>
                                <th>Đáp án</th>
                            </tr>
                        </thead>
                        <tbody class="fw-bold align-middle">
                            <c:forEach var="questionBerkeley" items="${questionBerkeleys}">
                                <tr>
                                    <td class="text-center">${questionBerkeley.questionId}</td>
                                    <td class="text-center">
                                        <span class="text-success" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#debai-${questionBerkeley.questionId}" aria-expanded="false" aria-controls="collapseExample">
                                            Xem đề bài
                                        </span>

                                        <div class="collapse" id="debai-${questionBerkeley.questionId}">
                                            <div class="card card-body text-start">
                                                <p class="text-danger">MemberTimes:</p>
                                                <ul>
                                                    <c:forEach var="memberTime" items="${questionBerkeley.memberTimes}" varStatus="status">
                                                        <li>MemberTime[${status.count}]: ${memberTime}</li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-center">
                                        <span class="text-success" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#dapan-${questionBerkeley.questionId}" aria-expanded="false" aria-controls="collapseExample">
                                            Xem đáp án
                                        </span>

                                        <div class="collapse" id="dapan-${questionBerkeley.questionId}">
                                            <div class="card card-body text-start">
                                                <p class="text-danger">CalibratedRes:</p>
                                                <ul>
                                                    <c:forEach var="calibratedRes" items="${questionBerkeley.calibratedRes}" varStatus="status">
                                                        <li>CalibratedRes[${status.count}]: ${calibratedRes}</li>
                                                    </c:forEach>
                                                </ul>
                                                
                                                <p class="text-success">CorrectedDateTime: ${questionBerkeley.correctedDateTime}</p>
                                            </div>
                                        </div>
                                    </td>
                                </tr>                                
                            </c:forEach>
                        </tbody>
                    </table>            
                </div>               
            </div>
            <!-- Berkeley list question end -->
        </div>      

        <!-- Footer begin -->
        <jsp:include page="./includes/html-body.jsp" />
        <!-- Footer end -->
    </body>
</html>
