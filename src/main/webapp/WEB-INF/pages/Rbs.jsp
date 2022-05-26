<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Rbs</title>
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

            <!-- Rbs de bai begin -->
            <div class="d-flex justify-content-center">
                <h4 class="fw-bold my-4 pb-3 border-4 border-bottom border-danger d-inline-block">Rbs</h4>
            </div>

            <p>Tiến trình P thực hiện ${isSolved == false ? 'M' : fn:length(questionForRbs.diffPQ)} lần gửi tín hiệu đồng bộ thời gian vật lý đến tiến trình Q như sau:</p>

            <c:if test="${isSolved == false}">
                <div id="de-bai">
                    <c:forEach var="questionForRbs" items="${questionForRbses}" varStatus="status">
                        <div>
                            <p onclick="showDeBai(${status.count}, ${questionForRbs.questionId})" class="text-danger" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#de-${questionForRbs.questionId}" aria-expanded="false" aria-controls="collapseExample"><i class="fa-solid fa-arrows-to-dot"></i> Xem đề ${status.count}</p>
                        </div>
                    </c:forEach>
                </div>                
            </c:if>

            <p>Tính độ lệch thời gian tính bằng đơn vị Tick giữa P và Q.</p>
            <p>Thời gian làm bài: ${requestScope.timeForTest} phút.</p>
            <!-- Rbs de bai end -->

            <!-- Rbs bai lam begin -->
            <c:if test="${isSolved == false}">
                <c:forEach var="questionForRbs" items="${questionForRbses}" varStatus="status">
                    <form autocomplete="off" class="collapse" action="<c:url value='${request.contextPath}/algorithm/rbs'/>" method="post" id="de-${questionForRbs.questionId}">
                        <div class="d-flex justify-content-between mb-3">
                            <h3 class="text-success mb-0">Đề số: <c:out value="${questionForRbs.questionId}"></c:out></h3>
                                <input autocomplete="off" class="btn btn-success" type="submit" value="Nộp bài">
                            </div>

                            <input autocomplete="off" type="hidden" name="questionId" value="${questionForRbs.questionId}">
                        <input autocomplete="off" type="hidden" name="time">

                        <div class="table-responsive">
                            <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                <thead style="background-color: #d30000" class="text-white align-middle">
                                    <tr class="text-center align-middle text-nowrap">
                                        <th scope="col">Thời gian tiến trình P</th>
                                        <th scope="col">Thời gian tiến trình Q</th>
                                        <th scope="col">Độ lêch (Ticks)</th>
                                    </tr>
                                </thead>
                                <tbody class="fw-bold align-middle text-black">
                                    <c:forEach var="i" begin="0" end="${fn:length(questionForRbs.pTimes) - 1}">
                                        <tr class="text-center">
                                            <td>${questionForRbs.pTimes[i]}</td>

                                            <td>${questionForRbs.qTimes[i]}</td>

                                            <td>
                                                <input autocomplete="off" style="min-width: 100px" class="form-control" type="text" name="diffPQ-${i}" class="text-danger" size="10">
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>                        
                        </div>

                        <div class="mt-4">
                            <p id="time-${questionForRbs.questionId}" class="fs-4 text-success"></p>
                        </div>
                    </form>                    
                </c:forEach>
            </c:if>
            <!-- Rbs bai lam end -->

            <!-- Rbs ketqua begin -->
            <c:if test="${isSolved == true}">
                <div class="d-flex justify-content-between mb-2 mt-4">
                    <h3 class="text-success mb-0">Đáp án đề ${questionForRbs.questionId}:</h3>
                    <h3 class="text-danger mb-0">Điểm: <c:out value="${score}"></c:out></h3>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover border border-danger table-bordered align-middle w-100">
                            <thead style="background-color: #d30000" class="text-white align-middle">
                                <tr class="text-center align-middle text-nowrap">
                                    <th scope="col">Thời gian tiến trình P</th>
                                    <th scope="col">Thời gian tiến trình Q</th>
                                    <th scope="col">Độ lêch (Ticks)</th>
                                    <th scope="col">Đáp án</th>
                                </tr>
                            </thead>
                            <tbody class="fw-bold align-middle text-black">
                            <c:forEach var="i" begin="0" end="${fn:length(questionForRbs.pTimes) - 1}">
                                <tr class="text-center">
                                    <td>${questionForRbs.pTimes[i]}</td>
                                    <td>${questionForRbs.qTimes[i]}</td>
                                    <td>${ans[i]}</td>
                                    <td>${questionForRbs.diffPQ[i]}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>                        
                </div>    

                <h3 class="text-success mb-0">${time}</h3>
            </c:if>
            <!-- Rbs ketqua end -->
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

                    $('#time-' + id).text(text);
                    $('input[name="time"]').val(text);

                    if (countSeconds === max)
                        notify.show();
                }, 1000);
            }
        </script>
    </body>
</html>
