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

            <!-- Navbar begin -->
            <jsp:include page="./includes/navbar.jsp"/>
            <!-- Navbar end -->   

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
            <h4 class="fw-bold mt-5 pb-3 border-4 border-bottom border-danger d-inline-block">2. Cristian-NTP questions</h4>
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
                                                    <li class="text-danger">OriginateTimeUtcTick: ${questionCristianNtp.originateTimeUtcTick}</li>
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
            
            <!-- Thời gian begin -->
            <h4 class="fw-bold mt-5 pb-3 border-4 border-bottom border-danger d-inline-block">3. Tính thời gian</h4>
            
            <div class="mt-3">
                <p class="mt-2 fs-4 text-danger">Thời gian làm bài: ${requestScope.timeForTest} phút.</p>
                <p id="time" class="mt-2 fs-4 text-success"></p>
                <button id="time-control" class="btn btn-success" onclick="countTime()">Start</button>
            </div>
            <!-- Thời gian end -->
        </div>  
                
        <!-- Modal -->
        <div id="notify" class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Hết giờ</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Đã hết ${requestScope.timeForTest} phút làm bài.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer begin -->
        <jsp:include page="./includes/footer.jsp" />
        <!-- Footer end -->

        <!-- Javascript begin -->
        <jsp:include page="./includes/html-body-end.jsp" />
        <!-- Javascript end -->
        
        <script>
            let x;
            let notify = new bootstrap.Modal(document.getElementById('notify'));

            function countTime() {
                
                if($('#time-control').text() === 'Stop') {
                    clearInterval(x);
                    $('#time-control').text("Start");
                }
                else if($('#time-control').text() === 'Start') {
                    $('#time-control').text("Stop");

                    // Update the count every 1 second
                    let max = Math.round(((new Date().getTime() + ${requestScope.timeForTest} * 60 * 1000) - new Date().getTime()) / 1000);

                    let countSeconds = 0;
                    x = setInterval(function () {
                        countSeconds++;

                        // Time calculations for hours, minutes and seconds
                        let hours = Math.floor(countSeconds / (60 * 60));
                        let minutes = Math.floor((countSeconds % (60 * 60)) / (60));
                        let seconds = Math.floor((countSeconds % (60)));
                        ;

                        // Output the result in an element
                        let text = "Thời gian: ";
                        text += (hours < 10 ? "0" + hours : hours) + ":";
                        text += (minutes < 10 ? "0" + minutes : minutes) + ":";
                        text += (seconds < 10 ? "0" + seconds : seconds);

                        $('#time').text(text);

                        if (countSeconds === max)
                            notify.show();
                    }, 1000);                    
                }
            }
        </script>       
    </body>
</html>
