<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Lamport</title>
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

            <!-- Nhãn thời gian lamport de bai begin -->
            <div class="d-flex justify-content-center">
                <h4 id="lamport-timestamp" class="fw-bold my-4 pb-3 border-4 border-bottom border-danger d-inline-block">Nhãn thời gian lamport</h4>
            </div>
            <p>Có ${isSolved == false ? 'n' : fn:length(questionLamport.deBai)} tiến trình P1, ..., P${isSolved == false ? 'n' : fn:length(questionLamport.deBai)}, mỗi tiến trình đều có bộ đếm thời gian riêng nhưng nhịp đếm không giống nhau. Mỗi tiến trình Pi có bộ đếm Ci để đánh dấu thời điểm xảy tra các sự kiện trong tiến trình, sự kiện ở đây có thể là nội tại trong tiến trình hoặc gửi thông điệp cho tiến trình khác. Các sự kiện trên mỗi tiến trình thể hiện như sau:</p>
            <ul>
                <li>eX,Y thể hiện sự kiện</li>
                <li>X là số hiệu tiến trình</li>
                <li>Y là số thứ tự sự kiện trong tiến trình</li>
            </ul>
            <p>Bộ đếm thời gian của mỗi tiến trình và thông điệp giữa các tiến trình như sau:</p>

            <c:if test="${isSolved == false}">
                <div id="de-bai">                    
                    <c:forEach var="questionLamport" items="${questionLamports}" varStatus="status">
                        <div>
                            <p onclick="showDeBai(${status.count}, ${questionLamport.id})" class="text-danger" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#de-${questionLamport.id}" aria-expanded="false" aria-controls="collapseExample"><i class="fa-solid fa-arrows-to-dot"></i> Xem đề ${status.count}</p>

                            <div class="collapse" id="de-${questionLamport.id}">
                                <div class="row mb-3">
                                    <div class="col-md-5 col-lg-4 mb-md-0 mb-3">
                                        <div class="card border-success h-100">
                                            <div class="card-header fw-bold">Thông điệp giữa các tiến trình</div>
                                            <div class="card-body text-secondary">
                                                <ul style="list-style-type:disc;">
                                                    <c:forEach var="event" items="${questionLamport.events}">
                                                        <li>${event}</li>
                                                        </c:forEach>                                               
                                                </ul>
                                            </div>
                                        </div>                                  
                                    </div>

                                    <div class="col-md-7 col-lg-8">
                                        <div class="card border-success h-100">
                                            <div class="card-header fw-bold">Bộ đếm thời gian của mỗi tiến trình</div>

                                            <div class="card-body text-secondary p-0">
                                                <div class="table-responsive position-relative">
                                                    <table class="table table-hover border border-danger table-bordered align-middle w-100 m-0">
                                                        <thead style="background-color: #d30000" class="text-white align-middle">
                                                            <tr class="text-center align-middle text-nowrap">
                                                                <th style="background-color: #d30000" scope="col" class="position-sticky start-0">TT</th>
                                                                    <c:forEach var="i" begin="0" end="${fn:length(questionLamport.deBai[0]) - 1}">
                                                                    <th scope="col">eX,${i}</th>
                                                                    </c:forEach>
                                                            </tr>
                                                        </thead>
                                                        <tbody class="fw-bold align-middle text-black">
                                                            <jsp:useBean id="map" class="java.util.HashMap"/>
                                                            <c:set var="isIcr"><%= java.lang.Math.round(java.lang.Math.random() * 2) % 2%></c:set>
                                                            <c:set var="noUse" value="${map.put(questionLamport.id, isIcr)}"/>
                                                            <c:forEach var="icr" begin="0" end="${fn:length(questionLamport.deBai) - 1}" step="1">
                                                                <c:set var="i" value="${isIcr == 0 ? icr : fn:length(questionLamport.deBai)-1-icr}"/>
                                                                <tr>
                                                                    <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">P${i+1}</th>
                                                                        <c:forEach var="j" begin="0" end="${fn:length(questionLamport.deBai[i]) - 1}" step="+1">
                                                                        <td class="text-center">${questionLamport.deBai[i][j]}</td>
                                                                    </c:forEach>                                       
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>                        
                                                </div>                                                            
                                            </div>                                       
                                        </div>                                              
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>                
            </c:if>

            <c:if test="${isSolved == true}">
                <div class="row mb-3">
                    <div class="col-md-5 col-lg-4 mb-md-0 mb-3">
                        <div class="card border-success h-100">
                            <div class="card-header fw-bold">Thông điệp giữa các tiến trình</div>
                            <div class="card-body text-secondary">
                                <ul style="list-style-type:disc;">
                                    <c:forEach var="event" items="${questionLamport.events}">
                                        <li>${event}</li>
                                        </c:forEach>                                               
                                </ul>
                            </div>
                        </div>                                  
                    </div>

                    <div class="col-md-7 col-lg-8">
                        <div class="card border-success h-100">
                            <div class="card-header fw-bold">Bộ đếm thời gian của mỗi tiến trình</div>

                            <div class="card-body text-secondary p-0">
                                <div class="table-responsive position-relative">
                                    <table class="table table-hover border border-danger table-bordered align-middle w-100 m-0">
                                        <thead style="background-color: #d30000" class="text-white align-middle">
                                            <tr class="text-center align-middle text-nowrap">
                                                <th style="background-color: #d30000" scope="col" class="position-sticky start-0">TT</th>
                                                    <c:forEach var="i" begin="0" end="${fn:length(questionLamport.deBai[0]) - 1}">
                                                    <th scope="col">eX,${i}</th>
                                                    </c:forEach>
                                            </tr>
                                        </thead>
                                        <tbody class="fw-bold align-middle text-black">
                                            <c:forEach var="icr" begin="0" end="${fn:length(questionLamport.deBai) - 1}" step="1">
                                                <c:set var="i" value="${debai_isIcr == 0 ? icr : fn:length(questionLamport.deBai)-1-icr}"/>
                                                <tr>
                                                    <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">P${i+1}</th>
                                                        <c:forEach var="j" begin="0" end="${fn:length(questionLamport.deBai[i]) - 1}" step="+1">
                                                        <td class="text-center">${questionLamport.deBai[i][j]}</td>
                                                    </c:forEach>                                       
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>                        
                                </div>                                                            
                            </div>                                       
                        </div>                                              
                    </div>
                </div>
            </c:if>

            <p>Hãy điền nhãn thời gian lamport cho các sự kiện của mỗi tiến trình (chú ý xóa tên sự kiện trước khi điền giá trị).</p>
            <p>Thời gian làm bài: ${requestScope.timeForTest} phút.</p>
            <!-- Nhãn thời gian lamport de bai end -->

            <!-- Nhãn thời gian lamport bai lam begin -->
            <c:if test="${isSolved == false}">
                <c:forEach var="questionLamport" items="${questionLamports}" varStatus="status">
                    <form autocomplete="off" class="collapse" action="<c:url value='${request.contextPath}/algorithm/lamport'/>" method="post" id="de-${questionLamport.id}">
                        <div class="d-flex justify-content-between mb-3">
                            <h3 class="text-success mb-0">Đề số: <c:out value="${questionLamport.id}"></c:out></h3>
                                <input autocomplete="off" class="btn btn-success" type="submit" value="Nộp bài">
                            </div>

                            <input autocomplete="off" type="hidden" name="time">
                            <input autocomplete="off" type="hidden" name="id" value="${questionLamport.id}">

                        <div class="table-responsive position-relative">
                            <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                <thead style="background-color: #d30000" class="text-white align-middle">
                                    <tr class="text-center align-middle text-nowrap">
                                        <th style="background-color: #d30000" scope="col" class="position-sticky start-0">TT</th>
                                            <c:forEach var="i" begin="0" end="${fn:length(questionLamport.result[0]) - 1}">
                                            <th scope="col">eX,${i}</th>
                                            </c:forEach>
                                    </tr>
                                </thead>
                                <tbody class="fw-bold align-middle text-black">
                                    <c:set var="isIcr"><%= java.lang.Math.round(java.lang.Math.random() * 2) % 2%></c:set>
                                <input autocomplete="off" type="hidden" name="debai_isIcr" value="${map.get(questionLamport.id)}">
                                <input autocomplete="off" type="hidden" name="bailam_isIcr" value="${isIcr}">
                                <c:forEach var="icr" begin="0" end="${fn:length(questionLamport.result) - 1}" step="1">
                                    <c:set var="i" value="${isIcr == 0 ? icr : fn:length(questionLamport.result)-1-icr}"/>
                                    <tr>
                                        <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">P${i+1}</th>
                                            <c:forEach var="j" begin="0" end="${fn:length(questionLamport.result[i]) - 1}" step="+1">
                                            <td>
                                                <input autocomplete="off" style="min-width: 100px" class="form-control" type="text" name="${i}-${j}" value="e${i + 1},${j}">
                                            </td>
                                        </c:forEach>                                       
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>                        
                        </div>

                        <div class="mt-4">
                            <p id="time-${questionLamport.id}" class="fs-4 text-success"></p>
                        </div>
                    </form>                    
                </c:forEach>
            </c:if>
            <c:if test="${isSolved == true}">
                <div class="d-flex justify-content-between mb-2">
                    <h3 class="text-danger mb-0">Đề số: <c:out value="${questionLamport.id}"></c:out></h3>
                    <h3 class="text-danger mb-0">Điểm: <c:out value="${score}"></c:out></h3>
                    </div>

                    <div class="table-responsive position-relative">
                        <table class="table table-hover border border-danger table-bordered align-middle w-100">
                            <thead style="background-color: #d30000" class="text-white align-middle">
                                <tr class="text-center align-middle text-nowrap">
                                    <th style="background-color: #d30000" scope="col" class="position-sticky start-0">TT</th>
                                    <c:forEach var="i" begin="0" end="${fn:length(questionLamport.result[0]) - 1}">
                                    <th scope="col">eX,${i}</th>
                                    </c:forEach>
                            </tr>
                        </thead>
                        <tbody class="fw-bold align-middle text-black text-center">
                            <c:forEach var="icr" begin="0" end="${fn:length(questionLamport.result) - 1}" step="1">
                                <c:set var="i" value="${bailam_isIcr == 0 ? icr : fn:length(questionLamport.result) - 1 - icr}"/>
                                <tr>
                                    <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">P${i+1}</th>
                                        <c:forEach var="j" begin="0" end="${fn:length(questionLamport.result[i]) - 1}" step="+1">
                                        <td>${ans[i][j]}</td>
                                    </c:forEach>                                       
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>                        
                </div>
            </c:if>
            <!-- Nhãn thời gian lamport bai lam end -->

            <!-- Nhãn thời gian lamport ketqua begin -->
            <c:if test="${isSolved == true}">
                <div class="d-flex justify-content-between mb-2 mt-4">
                    <h3 class="text-success mb-0">Đáp án</h3>
                    <h3 class="text-success mb-0">${time}</h3>
                </div>

                <div class="table-responsive position-relative">
                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                        <thead style="background-color: #d30000" class="text-white align-middle">
                            <tr class="text-center align-middle text-nowrap">
                                <th style="background-color: #d30000" scope="col" class="position-sticky start-0">TT</th>
                                    <c:forEach var="i" begin="0" end="${fn:length(questionLamport.result[0]) - 1}">
                                    <th scope="col">eX,${i}</th>
                                    </c:forEach>
                            </tr>
                        </thead>
                        <tbody class="fw-bold align-middle text-black text-center">
                            <c:forEach var="icr" begin="0" end="${fn:length(questionLamport.result) - 1}" step="1">
                                <c:set var="i" value="${bailam_isIcr == 0 ? icr : fn:length(questionLamport.result) - 1 - icr}"/>
                                <tr>
                                    <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">P${i+1}</th>
                                        <c:forEach var="j" begin="0" end="${fn:length(questionLamport.result[i]) - 1}" step="+1">
                                        <td>${questionLamport.result[i][j]}</td>
                                    </c:forEach>                                       
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>                        
                </div>               
            </c:if>
            <!-- Nhãn thời gian lamport ketqua end -->
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
                    countSeconds += Math.round((now - preTime) / 1000);
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

                    <c:if test="${isSolved == false}">
                        $('#time-' + id).text(text);
                        $('input[name="time"]').val(text);

                        if (countSeconds === max)
                            notify.show();
                    </c:if>
                }, 1000);
            }
        </script>
    </body>
</html>
