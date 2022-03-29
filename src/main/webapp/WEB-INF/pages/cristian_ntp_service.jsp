<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cristian NTP</title>
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

            <!-- Cristian NTP url begin -->
            <h4 class="fw-bold mt-5 pb-3 border-4 border-bottom border-danger d-inline-block">1. Cristian-NTP URL services</h4>
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
                                <td><a target="_blank" href="<c:url value='${request.contextPath}/ExamForCristianNTP?wsdl'/>"><script>document.write(window.location.origin.replace("https://", "http://"));</script>${pageContext.request.contextPath}/ExamForCristianNTP?wsdl</a></td>
                                <td>Web Service cho giải thuật Cristian-NTP</td>
                            </tr>
                        </tbody>
                    </table>            
                </div>               
            </div>
            <!-- Cristian NTP url end --> 

            <!-- Cristian NTP list question begin -->
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
                            <c:forEach var="questionCristianNtp" items="${questionCristianNtps}">
                                <tr>
                                    <td class="text-center">${questionCristianNtp.questionId}</td>
                                    <td class="text-center">
                                        <span class="text-success" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#debai-${questionCristianNtp.questionId}" aria-expanded="false" aria-controls="collapseExample">
                                            Xem đề bài
                                        </span>

                                        <div class="collapse" id="debai-${questionCristianNtp.questionId}">
                                            <div class="card card-body text-start">
                                                <ul>
                                                    <li class="text-danger">OriginateTimeUtcTick: ${questionCristianNtp.getOriginateTimeUtcTick()}</li>
                                                    <li>
                                                        <p class="text-danger">NtpMesage:</p>
                                                        <div class="table-responsive position-relative" style="max-width: 70vw;">
                                                            <table class="table table-hover border border-danger table-bordered align-middle">
                                                                <thead style="background-color: #d30000" class="text-white align-middle text-center">
                                                                <th style="background-color: #d30000" scope="col" class="position-sticky start-0">Byte</th>
                                                                    <c:forEach var="i" begin="0" end="${fn:length(questionCristianNtp.ntpMesage)-1}">
                                                                        <c:if test="${i < 10}">
                                                                        <th scope="col">0${i}</th>
                                                                        </c:if>
                                                                        <c:if test="${i >= 10}">
                                                                        <th scope="col">${i}</th>
                                                                        </c:if>
                                                                    </c:forEach>                                            
                                                                </thead>
                                                                <tbody class="fw-bold align-middle text-black">
                                                                    <tr>
                                                                        <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">Giá trị</th>
                                                                            <c:forEach var="i" begin="0" end="${fn:length(questionCristianNtp.ntpMesage)-1}">
                                                                            <td>
                                                                                <c:if test="${questionCristianNtp.ntpMesage[i] < 10}">
                                                                                    0${questionCristianNtp.ntpMesage[i]}
                                                                                </c:if>
                                                                                <c:if test="${questionCristianNtp.ntpMesage[i] >= 10}">
                                                                                    ${questionCristianNtp.ntpMesage[i]}
                                                                                </c:if>                                                        
                                                                            </td>
                                                                        </c:forEach>                                       
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>                                                        
                                                    </li>
                                                    
                                                    <c:forEach var="memberTime" items="${questionBerkeley.memberTimes}" varStatus="status">
                                                        <li>MemberTime[${status.count}]: ${memberTime}</li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-center">
                                        <span class="text-success" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#dapan-${questionCristianNtp.questionId}" aria-expanded="false" aria-controls="collapseExample">
                                            Xem đáp án
                                        </span>

                                        <div class="collapse" id="dapan-${questionCristianNtp.questionId}">
                                            <div class="card card-body text-start">
                                                <ul class="text-danger text-nowrap">
                                                    <li>OriginateSendTimestamp: ${questionCristianNtp.originateSendTimestamp}</li>
                                                    <li>ReceiveTimestamp: ${questionCristianNtp.receiveTimestamp}</li>
                                                    <li>TransmitTimestamp: ${questionCristianNtp.transmitTimestamp}</li>
                                                    <li>OriginateReceiveTime: ${questionCristianNtp.originateReceiveTime}</li>
                                                    <li>DifferentTicks: ${questionCristianNtp.differentTicks}</li>
                                                    <li>DateTimeAfterSynchronize: ${questionCristianNtp.dateTimeAfterSynchronize}</li>
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
            <!-- Cristian NTP list question end -->
        </div>      

        <!-- Footer begin -->
        <jsp:include page="./includes/html-body.jsp" />
        <!-- Footer end -->
    </body>
</html>
