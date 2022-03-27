<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Trung bình</title>
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
            <h4 class="fw-bold mt-5 pb-3 border-4 border-bottom border-danger d-inline-block">1. Trung bình URL services</h4>
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
                                <td><a target="_blank" href="<c:url value='${request.contextPath}/ExamForTrungBinh?wsdl'/>"><script>document.write(window.location.origin.replace("https://", "http://"));</script>${pageContext.request.contextPath}/ExamForTrungBinh?wsdl</a></td>
                                <td>Web Service cho giải thuật trung bình</td>
                            </tr>
                        </tbody>
                    </table>            
                </div>               
            </div>
            <!-- Berkeley url end --> 

            <!-- Berkeley list question begin -->
            <h4 class="fw-bold mt-5 pb-3 border-4 border-bottom border-danger d-inline-block">2. Trung bình questions</h4>
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
                            <c:forEach var="questionTrungBinh" items="${questionTrungBinhs}">
                                <tr>
                                    <td class="text-center">${questionTrungBinh.questionId}</td>
                                    <td class="text-center">
                                        <span class="text-success" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#debai-${questionTrungBinh.questionId}" aria-expanded="false" aria-controls="collapseExample">
                                            Xem đề bài
                                        </span>

                                        <div class="collapse" id="debai-${questionTrungBinh.questionId}">
                                            <div class="card card-body text-start">
                                                <p class="text-danger">MemberTimes:</p>
                                                <ul>
                                                    <c:forEach var="memberTime" items="${questionTrungBinh.memberTimes}" varStatus="status">
                                                        <li>MemberTime[${status.count}]: ${memberTime}</li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-center">
                                        <span class="text-success" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#dapan-${questionTrungBinh.questionId}" aria-expanded="false" aria-controls="collapseExample">
                                            Xem đáp án
                                        </span>

                                        <div class="collapse" id="dapan-${questionTrungBinh.questionId}">
                                            <div class="card card-body text-start">
                                                <p class="text-danger">CorrectedMs:</p>
                                                <ul>
                                                    <c:forEach var="correctedMsi" items="${questionTrungBinh.correctedMs}" varStatus="status">
                                                        <li>CorrectedMs[${status.count}]: ${correctedMsi}</li>
                                                    </c:forEach>
                                                </ul>
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
