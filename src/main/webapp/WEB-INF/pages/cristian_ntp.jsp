<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Cristian - NTP</title>
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

            <!-- Cristian NTP de bai begin -->
            <h4 id="vector-timestamp" class="fw-bold my-4 pb-3 border-4 border-bottom border-danger d-inline-block">Giải thuật Cristian NTP</h4>

            <p>Lập trình viên thực hiện đồng bộ thời gian máy tính với máy chủ NTP, hãy tính thời gian gửi, thời gian máy chủ nhận, thời gian máy chủ gửi, thời gian mới trên máy khách (thời gian địa phương, viết theo định dạng yyyy-mm-dd hh:mi:ss.ms) và độ lệch thời gian (tính bằng đơn vị tick) giữa máy khách và máy chủ nếu thời gian nhận được trên máy khách và bản tin NTP nhận được có giá trị như sau:</p>
            <c:if test="${isSolved == false}">
                <ul id="de-bai">
                    <c:forEach var="questionCristianNtp" items="${questionCristianNtps}" varStatus="status">
                        <li>
                            <p onclick="showDeBai(${status.count}, ${questionCristianNtp.questionId})" class="text-danger" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#de-${questionCristianNtp.questionId}" aria-expanded="false" aria-controls="collapseExample">Xem đề ${status.count}</p>

                            <div class="collapse" id="de-${questionCristianNtp.questionId}">
                                <div class="card card-body">
                                    <div class="table-responsive position-relative">
                                        <table class="table table-hover border border-danger table-bordered align-middle w-100">
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
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>                
            </c:if>

            <c:if test="${isSolved == true}">
                <div>
                    <div class="card card-body">
                        <div class="table-responsive position-relative">
                            <table class="table table-hover border border-danger table-bordered align-middle w-100">
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
                    </div>
                </div>                
            </c:if>
            
            <p>Thời gian làm bài: ${requestScope.timeForTest} phút.</p>
            <!-- Cristian NTP de bai end -->

            <!-- Cristian NTP bai lam begin -->
            <c:if test="${isSolved == false}">
                <c:forEach var="questionCristianNtp" items="${questionCristianNtps}" varStatus="status">
                    <form class="collapse mt-5" action="<c:url value='${request.contextPath}/algorithm/cristian-ntp'/>" method="post" id="de-${questionCristianNtp.questionId}">
                        <div class="d-flex justify-content-between mb-3">
                            <div>
                                <h6 class="text-success mb-0">Đề số: <c:out value="${questionCristianNtp.questionId}"></c:out></h6>
                                <p class="text-danger mb-0">Thời gian nhận được bản ghi: ${questionCristianNtp.originateReceiveTime}</p>
                            </div>
                            <input class="btn btn-success" type="submit" value="Nộp bài">
                        </div>

                        <input type="hidden" name="questionId" value="${questionCristianNtp.questionId}">

                        <div class="table-responsive">
                            <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                <thead style="background-color: #d30000" class="text-white align-middle">
                                    <tr class="text-center align-middle text-nowrap">
                                        <th scope="col">Câu hỏi</th>
                                        <th scope="col">Thời gian</th>
                                    </tr>
                                </thead>
                                <tbody class="fw-bold align-middle text-black">
                                    <tr>
                                        <td class="text-success">Thời gian máy khách gửi</td>
                                        <td><input style="min-width: 200px" class="form-control" type="text" name="originateSendTimestamp" class="text-danger"></td>
                                    </tr>  

                                    <tr>
                                        <td class="text-success">Thời gian máy chủ NTP nhận</td>
                                        <td><input style="min-width: 200px" class="form-control" type="text" name="receiveTimestamp" class="text-danger"></td>
                                    </tr>  

                                    <tr>
                                        <td class="text-success">Thời gian máy chủ NTP gửi</td>
                                        <td><input style="min-width: 200px" class="form-control" type="text" name="transmitTimestamp" class="text-danger"></td>
                                    </tr>  

                                    <tr>
                                        <td class="text-success">Thời gian mới cần thiết lập cho máy khách</td>
                                        <td><input style="min-width: 200px" class="form-control" type="text" name="dateTimeAfterSynchronize" class="text-danger"></td>
                                    </tr>

                                    <tr>
                                        <td class="text-success">Độ lệch thời gian giữa máy khách và máy chủ (tính bằng đơn vị Tick)</td>
                                        <td><input style="min-width: 200px" class="form-control" type="text" name="differentTicks" class="text-danger"></td>
                                    </tr>
                                </tbody>
                            </table>                        
                        </div>
                        
                        <div class="mt-4">
                            <p id="time-${questionCristianNtp.questionId}" class="fs-4 text-success"></p>
                        </div>
                    </form>                    
                </c:forEach>
            </c:if>
            <!-- Cristian NTP bai lam end -->

            <!-- Cristian NTP ketqua begin -->
            <c:if test="${isSolved == true}">
                <div class="d-flex justify-content-between mb-2 mt-5">
                    <h3 class="text-success">Đáp án</h3> 
                    <a class="btn btn-success" href="<c:url value='${request.contextPath}/cristian-ntp'/>">Back</a>
                </div>

                <div class="d-flex justify-content-between mt-4 mb-2">
                    <div>
                        <h6 class="text-success mb-0">Đề số: <c:out value="${questionCristianNtp.questionId}"></c:out></h6>
                        <p class="text-danger mb-0">Thời gian nhận được bản ghi: ${questionCristianNtp.originateReceiveTime}</p>
                    </div>  
                    
                    <h3 class="text-danger mb-0">Điểm: <c:out value="${score}"></c:out></h3>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                        <thead style="background-color: #d30000" class="text-white align-middle">
                            <tr class="text-center align-middle text-nowrap">
                                <th scope="col">Câu hỏi</th>
                                <th scope="col">Thời gian</th>
                                <th scope="col">Đáp án</th>
                            </tr>
                        </thead>
                        <tbody class="fw-bold align-middle text-black">
                            <tr>
                                <td class="text-success">Thời gian máy khách gửi</td>
                                <td class="text-center">${originateSendTimestamp}</td>
                                <td class="text-center">${questionCristianNtp.originateSendTimestamp}</td>
                            </tr>  

                            <tr>
                                <td class="text-success">Thời gian máy chủ NTP nhận</td>
                                <td class="text-center">${receiveTimestamp}</td>
                                <td class="text-center">${questionCristianNtp.receiveTimestamp}</td>
                            </tr>  

                            <tr>
                                <td class="text-success">Thời gian máy chủ NTP gửi</td>
                                <td class="text-center">${transmitTimestamp}</td>
                                <td class="text-center">${questionCristianNtp.transmitTimestamp}</td>
                            </tr>  

                            <tr>
                                <td class="text-success">Thời gian mới cần thiết lập cho máy khách</td>
                                <td class="text-center">${dateTimeAfterSynchronize}</td>
                                <td class="text-center">${questionCristianNtp.dateTimeAfterSynchronize}</td>
                            </tr>

                            <tr>
                                <td class="text-success">Độ lệch thời gian giữa máy khách và máy chủ (tính bằng đơn vị Tick)</td>
                                <td class="text-center">${differentTicks}</td>
                                <td class="text-center">${questionCristianNtp.differentTicks}</td>
                            </tr>
                        </tbody>
                    </table>                        
                </div>               
            </c:if>
            <!-- Cristian NTP ketqua end -->
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

            function showDeBai(index, id) {
                clearInterval(x);

                $("#de-bai .collapse.show").each(function () {
                    if (this.id !== ('de-' + id))
                        $(this).removeClass('show');
                });

                $("form.collapse.show").each(function () {
                    if (this.id !== ('de-' + id)) {
                        $(this).removeClass('show');
                        $(this).trigger("reset");
                    }
                });

                let max = Math.round(((new Date().getTime() + ${requestScope.timeForTest} * 60 * 1000) - new Date().getTime()) / 1000);

                let countSeconds = 0;
                let preTime = new Date().getTime();
                // Update the count every 1 second
                x = setInterval(function () {
                    let now = new Date().getTime();
                    countSeconds += Math.round((now - preTime)/1000);
                    preTime = now;

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

                    $('#time-' + id).text(text);

                    if (countSeconds === max)
                        notify.show();
                }, 1000);
            }
        </script>
    </body>
</html>
