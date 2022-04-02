<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Vector timestamp</title>
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

            <!-- Nhãn thời gian vector de bai begin -->
            <h4 id="vector-timestamp" class="fw-bold my-4 pb-3 border-4 border-bottom border-danger d-inline-block">Nhãn thời gian vector</h4>
            <p>Nhãn thời gian của mỗi tiến trình được đặt theo cấu trúc (P1,P2,P3), các sự kiện trên mỗi tiến trình thể hiện như sau:</p>
            <ul>
                <li>eX,Y thể hiện sự kiện</li>
                <li>X là số hiệu tiến trình</li>
                <li>Y là số thứ tự sự kiện trong tiến trình</li>
            </ul>
            <p>Thông điệp giữa các tiến trình như sau:</p>

            <c:if test="${isSolved == false}">
                <ul id="de-bai">
                    <c:forEach var="questionVectorTimestamp" items="${questionVectorTimestamps}" varStatus="status">
                        <li>
                            <p onclick="showDeBai(${status.count}, ${questionVectorTimestamp.vector_id})" class="text-danger" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#de-${questionVectorTimestamp.vector_id}" aria-expanded="false" aria-controls="collapseExample">Xem đề ${status.count}</p>

                            <div class="collapse" id="de-${questionVectorTimestamp.vector_id}">
                                <div class="card card-body">
                                    <ul style="list-style-type:disc;">
                                        <c:forEach var="listMesi" items="${questionVectorTimestamp.listMes}">
                                            <li>${listMesi}</li>
                                            </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>                
            </c:if>

            <c:if test="${isSolved == true}">
                <ul>
                    <c:forEach var="listMesi" items="${questionVectorTimestamp.listMes}">
                        <li>${listMesi}</li>
                        </c:forEach>
                </ul>
            </c:if>

            <p>Hãy điền nhãn thời gian vector cho các sự kiện của mỗi tiến trình (chú ý xóa tên sự kiện trước khi điền giá trị).</p>
            <p>Thời gian làm bài: ${requestScope.timeForTest} phút.</p>
            <!-- Nhãn thời gian vector de bai end -->

            <!-- Nhãn thời gian vector bai lam begin -->
            <c:if test="${isSolved == false}">
                <c:forEach var="questionVectorTimestamp" items="${questionVectorTimestamps}" varStatus="status">
                    <form class="collapse" action="<c:url value='${request.contextPath}/vector-timestamp'/>" method="post" id="de-${questionVectorTimestamp.vector_id}">
                        <div class="d-flex justify-content-between mb-3">
                            <h3 class="text-success mb-0">Đề số: <c:out value="${questionVectorTimestamp.vector_id}"></c:out></h3>
                                <input class="btn btn-success" type="submit" value="Nộp bài">
                            </div>

                            <input type="hidden" name="vector_id" value="${questionVectorTimestamp.vector_id}">

                        <div class="table-responsive position-relative">
                            <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                <thead style="background-color: #d30000" class="text-white align-middle">
                                    <tr class="text-center align-middle text-nowrap">
                                        <th style="background-color: #d30000" scope="col" class="position-sticky start-0">TT</th>
                                        <th scope="col">eX,0</th>
                                        <th scope="col">eX,1</th>
                                        <th scope="col">eX,2</th>
                                        <th scope="col">eX,3</th>
                                        <th scope="col">eX,4</th>
                                        <th scope="col">eX,5</th>
                                        <th scope="col">eX,6</th>
                                        <th scope="col">eX,7</th>
                                        <th scope="col">eX,8</th>
                                    </tr>
                                </thead>
                                <tbody class="fw-bold align-middle text-black">
                                    <c:forEach var="icr" begin="0" end="2" step="1">
                                        <c:set var="i" value="${2-icr}"/>
                                        <tr>
                                            <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">P${i+1}</th>
                                                <c:forEach var="j" begin="0" end="8" step="+1">
                                                <td>
                                                    <c:if test="${j == 0}">
                                                        ${questionVectorTimestamp.res[i][j]}
                                                    </c:if>

                                                    <c:if test="${j != 0}">
                                                        <input style="min-width: 100px" class="form-control" type="text" name="${i}-${j}" value="e${i + 1},${j}" class="text-danger" size="10">
                                                    </c:if>
                                                </td>
                                            </c:forEach>                                       
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>                        
                        </div>

                        <div class="mt-4">
                            <p id="time-${questionVectorTimestamp.vector_id}" class="fs-4 text-success"></p>
                        </div>
                    </form>                    
                </c:forEach>
            </c:if>
            <c:if test="${isSolved == true}">
                <div class="d-flex justify-content-between mb-2">
                    <h3 class="text-danger mb-0">Đề số: <c:out value="${questionVectorTimestamp.vector_id}"></c:out></h3>
                    <h3 class="text-danger mb-0">Điểm: <c:out value="${score}"></c:out></h3>
                    </div>

                    <div class="table-responsive position-relative">
                        <table class="table table-hover border border-danger table-bordered align-middle w-100">
                            <thead style="background-color: #d30000" class="text-white align-middle">
                                <tr class="text-center align-middle text-nowrap">
                                    <th style="background-color: #d30000" scope="col" class="position-sticky start-0">TT</th>
                                    <th scope="col">eX,0</th>
                                    <th scope="col">eX,1</th>
                                    <th scope="col">eX,2</th>
                                    <th scope="col">eX,3</th>
                                    <th scope="col">eX,4</th>
                                    <th scope="col">eX,5</th>
                                    <th scope="col">eX,6</th>
                                    <th scope="col">eX,7</th>
                                    <th scope="col">eX,8</th>
                                </tr>
                            </thead>
                            <tbody class="fw-bold align-middle text-black text-center">
                            <c:forEach var="icr" begin="0" end="2" step="1">
                                <c:set var="i" value="${2-icr}"/>
                                <tr>
                                    <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">P${i+1}</th>
                                        <c:forEach var="j" begin="0" end="8" step="+1">
                                        <td>
                                            <c:if test="${j == 0}">
                                                ${questionVectorTimestamp.res[i][j]}
                                            </c:if>

                                            <c:if test="${j != 0}">
                                                ${ans[i][j]}
                                            </c:if>
                                        </td>
                                    </c:forEach>                                       
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>                        
                </div>
            </c:if>
            <!-- Nhãn thời gian vector bai lam end -->

            <!-- Nhãn thời gian vector ketqua begin -->
            <c:if test="${isSolved == true}">
                <div class="d-flex justify-content-between mb-2 mt-4">
                    <h3 class="text-success mb-0">Đáp án</h3>
                    <a class="btn btn-success" href="<c:url value='${request.contextPath}/vector-timestamp'/>">Back</a>
                </div>

                <div class="table-responsive position-relative">
                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                        <thead style="background-color: #d30000" class="text-white align-middle">
                            <tr class="text-center align-middle text-nowrap">
                                <th style="background-color: #d30000" scope="col" class="position-sticky start-0">TT</th>
                                <th scope="col">eX,0</th>
                                <th scope="col">eX,1</th>
                                <th scope="col">eX,2</th>
                                <th scope="col">eX,3</th>
                                <th scope="col">eX,4</th>
                                <th scope="col">eX,5</th>
                                <th scope="col">eX,6</th>
                                <th scope="col">eX,7</th>
                                <th scope="col">eX,8</th>
                            </tr>
                        </thead>
                        <tbody class="fw-bold align-middle text-black text-center">
                            <c:forEach var="icr" begin="0" end="2" step="1">
                                <c:set var="i" value="${2-icr}"/>
                                <tr>
                                    <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">P${i+1}</th>
                                        <c:forEach var="j" begin="0" end="8" step="+1">
                                        <td>${questionVectorTimestamp.res[i][j]}</td>
                                    </c:forEach>                                       
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>                        
                </div>               
            </c:if>
            <!-- Nhãn thời gian vector ketqua end -->
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

                    $('#time-' + id).text(text);

                    if (countSeconds === max)
                        notify.show();
                }, 1000);
            }
        </script>
    </body>
</html>
