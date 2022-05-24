<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Cristian</title>
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

            <!-- Cristian de bai begin -->
            <div class="d-flex justify-content-center">
                <h4 class="fw-bold my-4 pb-3 border-4 border-bottom border-danger d-inline-block">Cristian</h4>
            </div>

            <p>Máy khách thực hiện đồng bộ thời gian vật lý với máy chủ, thời gian gửi và nhận các thông điệp như sau:</p>
            <c:if test="${isSolved == false}">
                <ul id="de-bai">
                    <c:forEach var="questionCristian" items="${questionCristians}" varStatus="status">
                        <li>
                            <p onclick="showDeBai(${status.count}, ${questionCristian.questionId})" class="text-danger" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#de-${questionCristian.questionId}" aria-expanded="false" aria-controls="collapseExample">Xem đề ${status.count}</p>

                            <div class="collapse" id="de-${questionCristian.questionId}">
                                <div class="card card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover border border-danger table-bordered align-middle w-100 mb-0">
                                            <thead style="background-color: #d30000" class="text-white align-middle">
                                                <tr class="text-center align-middle text-nowrap">
                                                    <th scope="col">Các mốc thời gian</th>
                                                    <th scope="col">Giá trị</th>
                                                </tr>
                                            </thead>
                                            <tbody class="fw-bold align-middle text-black">
                                                <tr>
                                                    <td class="text-success">Thời gian máy khách gửi</td>
                                                     <td class="text-center">${questionCristian.originateSendTimestamp}</td>
                                                </tr>  

                                                <tr>
                                                    <td class="text-success">Thời gian máy chủ nhận</td>
                                                    <td class="text-center">${questionCristian.receiveTimestamp}</td>
                                                </tr>  

                                                <tr>
                                                    <td class="text-success">Thời gian máy chủ gửi</td>
                                                    <td class="text-center">${questionCristian.transmitTimestamp}</td>
                                                </tr>  

                                                <tr>
                                                    <td class="text-success">Thời gian máy khách nhận</td>
                                                    <td class="text-center">${questionCristian.originateReceiveTime}</td>
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
                        <div class="table-responsive">
                            <table class="table table-hover border border-danger table-bordered align-middle w-100 mb-0">
                                <thead style="background-color: #d30000" class="text-white align-middle">
                                    <tr class="text-center align-middle text-nowrap">
                                        <th scope="col">Các mốc thời gian</th>
                                        <th scope="col">Giá trị</th>
                                    </tr>
                                </thead>
                                <tbody class="fw-bold align-middle text-black">
                                    <tr>
                                        <td class="text-success">Thời gian máy khách gửi</td>
                                         <td class="text-center">${questionCristian.originateSendTimestamp}</td>
                                    </tr>  

                                    <tr>
                                        <td class="text-success">Thời gian máy chủ nhận</td>
                                        <td class="text-center">${questionCristian.receiveTimestamp}</td>
                                    </tr>  

                                    <tr>
                                        <td class="text-success">Thời gian máy chủ gửi</td>
                                        <td class="text-center">${questionCristian.transmitTimestamp}</td>
                                    </tr>  

                                    <tr>
                                        <td class="text-success">Thời gian máy khách nhận</td>
                                        <td class="text-center">${questionCristian.originateReceiveTime}</td>
                                    </tr>
                                </tbody>
                            </table>                        
                        </div>
                    </div>
                </div>                
            </c:if>
            
            <p>Tính thời gian máy khách ngay sau khi hoàn thành đồng bộ (Ghi theo định dạng yyyy-mm-dd hh:mi:ss.ms).</p>
            <p>Thời gian làm bài: ${requestScope.timeForTest} phút.</p>
            <!-- Cristian de bai end -->

            <!-- Cristian bai lam begin -->
            <c:if test="${isSolved == false}">
                <c:forEach var="questionCristian" items="${questionCristians}" varStatus="status">
                    <form class="collapse mt-5" action="<c:url value='${request.contextPath}/algorithm/cristian'/>" method="post" id="de-${questionCristian.questionId}">
                        <div class="d-flex justify-content-between mb-3">
                            <h3 class="text-success mb-0">Đề số: <c:out value="${questionCristian.questionId}"></c:out></h3>
                            <input class="btn btn-success" type="submit" value="Nộp bài">
                        </div>

                        <input type="hidden" name="time">
                        <input type="hidden" name="questionId" value="${questionCristian.questionId}">

                        <div class="table-responsive">
                            <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                <thead style="background-color: #d30000" class="text-white align-middle">
                                    <tr class="text-center align-middle text-nowrap">
                                        <th scope="col">Điền câu trả lời</th>
                                    </tr>
                                </thead>
                                <tbody class="fw-bold align-middle text-black">
                                    <tr>
                                        <td><input style="min-width: 100px" class="form-control" type="text" name="dateTimeAfterSynchronize" placeholder="Ghi theo định dạng yyyy-mm-dd hh:mi:ss.ms"></td>
                                    </tr>  
                                </tbody>
                            </table>                        
                        </div>
                        
                        <div class="mt-4">
                            <p id="time-${questionCristian.questionId}" class="fs-4 text-success"></p>
                        </div>
                    </form>                    
                </c:forEach>
            </c:if>
            <!-- Cristian bai lam end -->

            <!-- Cristian ketqua begin -->
            <c:if test="${isSolved == true}">
                <div class="d-flex justify-content-between mb-2 mt-5">
                    <h3 class="text-success">Đáp án</h3> 
                    <h3 class="text-success mb-0">${time}</h3>
                </div>

                <div class="d-flex justify-content-between mt-4 mb-2">
                    <h3 class="text-success mb-0">Đề số: <c:out value="${questionCristian.questionId}"></c:out></h3>
                    
                    <h3 class="text-danger mb-0">Điểm: <c:out value="${score}"></c:out></h3>
                </div>

                    <div class="table-responsive">
                        <table class="table table-hover border border-danger table-bordered align-middle w-100">
                            <thead style="background-color: #d30000" class="text-white align-middle">
                                <tr class="text-center align-middle text-nowrap">
                                    <th scope="col">Câu trả lời</th>
                                    <th scope="col">Đáp án</th>
                                </tr>
                            </thead>
                            <tbody class="fw-bold align-middle text-black">
                                <tr>
                                    <td class="text-center">${dateTimeAfterSynchronize}</td>
                                    <td class="text-center">${questionCristian.dateTimeAfterSynchronize}</td>
                                </tr>  
                            </tbody>
                        </table>                        
                    </div>         
            </c:if>
            <!-- Cristian ketqua end -->
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
                    $('input[name="time"]').val(text);

                    if (countSeconds === max)
                        notify.show();
                }, 1000);
            }
        </script>
    </body>
</html>
