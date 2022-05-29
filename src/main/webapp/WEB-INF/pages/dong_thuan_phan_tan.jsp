<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Đồng thuận phân tán</title>
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

            <!-- Đồng thuận phân tán de bai begin -->
            <div class="d-flex justify-content-center">
                <h4 id="vector-timestamp" class="fw-bold my-4 pb-3 border-4 border-bottom border-danger d-inline-block">Đồng thuận phân tán</h4>
            </div>
            <p>Điền giá trị của các bước thực hiện giải thuật đồng thuật phân tán cho các tiến trình sau:</p>

            <c:if test="${isSolved == false}">
                <div id="de-bai">
                    <c:forEach var="questionDongThuanPhanTan" items="${questionDongThuanPhanTans}" varStatus="status">
                        <div>
                            <p onclick="showDeBai(${status.count}, ${questionDongThuanPhanTan.id})" class="text-danger" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#de-${questionDongThuanPhanTan.id}" aria-expanded="false" aria-controls="collapseExample"><i class="fa-solid fa-arrows-to-dot"></i> Xem đề ${status.count}</p>

                            <div class="collapse" id="de-${questionDongThuanPhanTan.id}">

                                <div class="table-responsive">
                                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                        <thead style="background-color: #d30000" class="text-white align-middle">
                                            <tr class="text-center align-middle text-nowrap">
                                                <th scope="col">Tiến trình</th>
                                                    <c:forEach var="i" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                                    <th scope="col">Tiến trình ${i+1}</th>
                                                    </c:forEach>
                                            </tr>
                                        </thead>
                                        <tbody class="fw-bold align-middle text-black text-center">
                                            <tr>
                                                <th>Giá trị</th>
                                                    <c:forEach var="i" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                                    <td>${questionDongThuanPhanTan.deBai[0][i]}</td>
                                                </c:forEach>
                                            </tr>
                                            <tr>
                                                <th>Trạng thái</th>
                                                    <c:forEach var="i" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                                    <td>${questionDongThuanPhanTan.deBai[1][i]}</td>
                                                </c:forEach>
                                            </tr>
                                        </tbody>
                                    </table>                        
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>                
            </c:if>

            <c:if test="${isSolved == true}">
                <div class="table-responsive">
                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                        <thead style="background-color: #d30000" class="text-white align-middle">
                            <tr class="text-center align-middle text-nowrap">
                                <th scope="col">Tiến trình</th>
                                    <c:forEach var="i" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                    <th scope="col">Tiến trình ${i+1}</th>
                                    </c:forEach>
                            </tr>
                        </thead>
                        <tbody class="fw-bold align-middle text-black text-center">
                            <tr>
                                <th>Giá trị</th>
                                    <c:forEach var="i" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                    <td>${questionDongThuanPhanTan.deBai[0][i]}</td>
                                </c:forEach>
                            </tr>
                            <tr>
                                <th>Trạng thái</th>
                                    <c:forEach var="i" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                    <td>${questionDongThuanPhanTan.deBai[1][i]}</td>
                                </c:forEach>
                            </tr>
                        </tbody>
                    </table>                        
                </div>
            </c:if>

            <p>Giả thiết tiến trình lỗi nhận được thông điệp từ các tiến trình không lỗi nhưng không gửi được thông điệp cho các tiến trình khác. Thứ tự giá trị được lưu trữ theo số thứ tự tiến trình tăng dần.</p>
            <p>Thời gian làm bài: ${requestScope.timeForTest} phút.</p>
            <!-- Đồng thuận phân tán de bai end -->

            <!-- Đồng thuận phân tán bai lam begin -->
            <c:if test="${isSolved == false}">
                <c:forEach var="questionDongThuanPhanTan" items="${questionDongThuanPhanTans}" varStatus="status">
                    <form autocomplete="off" class="collapse" action="<c:url value='${request.contextPath}/algorithm/dong-thuan-phan-tan'/>" method="post" id="de-${questionDongThuanPhanTan.id}">
                        <div class="d-flex justify-content-between mb-3">
                            <h3 class="text-success mb-0">Đề số: <c:out value="${questionDongThuanPhanTan.id}"></c:out></h3>
                                <input autocomplete="off" class="btn btn-success" type="submit" value="Nộp bài">
                            </div>

                            <input autocomplete="off" type="hidden" name="time">
                            <input autocomplete="off" type="hidden" name="id" value="${questionDongThuanPhanTan.id}">

                        <div class="table-responsive">
                            <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                <thead style="background-color: #d30000" class="text-white align-middle">
                                    <tr class="text-center align-middle text-nowrap">
                                        <th scope="col">Các kết quả</th>
                                            <c:forEach var="i" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                            <th scope="col">Tiến trình ${i+1}</th>
                                            </c:forEach>
                                    </tr>
                                </thead>
                                <tbody class="fw-bold align-middle text-black">
                                    <tr>
                                        <th>Kết quả lần thứ nhất</th>
                                            <c:forEach var="i" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                            <td>
                                                <input autocomplete="off" style="min-width: 100px" class="form-control" type="text" name="result_1-${i}">
                                            </td>
                                        </c:forEach>
                                    </tr>

                                    <tr>
                                        <th>Kết quả lần thứ hai</th>
                                            <c:forEach var="j" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                            <td>
                                                <c:forEach var="i" begin="0" end="${fn:length(questionDongThuanPhanTan.result_2) - 1}">
                                                    <input autocomplete="off" style="min-width: 100px" class="form-control mb-${fn:length(questionDongThuanPhanTan.result_2) - 1 == i ? 0 : 2}" type="text" name="result_2-${i}-${j}">
                                                </c:forEach>
                                            </td>
                                        </c:forEach>
                                    </tr>

                                    <tr>
                                        <th>Kết quả cuối cùng</th>
                                            <c:forEach var="i" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                            <td>
                                                <input autocomplete="off" style="min-width: 100px" class="form-control" type="text" name="result_final-${i}">
                                            </td>
                                        </c:forEach>
                                    </tr>
                                </tbody>
                            </table>                        
                        </div>                       

                        <div class="mt-4">
                            <p id="time-${questionDongThuanPhanTan.id}" class="fs-4 text-success">Thời gian: 00:00:00</p>
                        </div>
                    </form>                    
                </c:forEach>
            </c:if>
            <c:if test="${isSolved == true}">
                <div class="d-flex justify-content-between mb-2">
                    <h3 class="text-danger mb-0">Đề số: <c:out value="${questionDongThuanPhanTan.id}"></c:out></h3>
                    <h3 class="text-danger mb-0">Điểm: <c:out value="${score}"></c:out></h3>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover border border-danger table-bordered align-middle w-100">
                            <thead style="background-color: #d30000" class="text-white align-middle">
                                <tr class="text-center align-middle text-nowrap">
                                    <th scope="col">Các kết quả</th>
                                    <c:forEach var="i" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                    <th scope="col">Tiến trình ${i+1}</th>
                                    </c:forEach>
                            </tr>
                        </thead>
                        <tbody class="fw-bold align-middle text-black">
                            <tr>
                                <th>Kết quả lần thứ nhất</th>
                                    <c:forEach var="i" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                    <td class="text-center">${ans_result_1[i]}</td>
                                </c:forEach>
                            </tr>

                            <tr>
                                <th>Kết quả lần thứ hai</th>
                                    <c:forEach var="j" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                    <td class="text-center">
                                        <c:forEach var="i" begin="0" end="${fn:length(questionDongThuanPhanTan.result_2) - 1}">
                                            <div class="mb-${fn:length(questionDongThuanPhanTan.result_2) - 1 == i ? 0 : 2}">${ans_result_2[i][j]}</div>
                                        </c:forEach>
                                    </td>
                                </c:forEach>
                            </tr>

                            <tr>
                                <th>Kết quả cuối cùng</th>
                                    <c:forEach var="i" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                    <td class="text-center">${ans_result_final[i]}</td>
                                </c:forEach>
                            </tr>
                        </tbody>
                    </table>                        
                </div>    
            </c:if>
            <!-- Đồng thuận phân tán bai lam end -->

            <!-- Đồng thuận phân tán ketqua begin -->
            <c:if test="${isSolved == true}">
                <div class="d-flex justify-content-between mb-2 mt-4">
                    <h3 class="text-success mb-0">Đáp án</h3>
                    <h3 class="text-success mb-0">${time}</h3>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                        <thead style="background-color: #d30000" class="text-white align-middle">
                            <tr class="text-center align-middle text-nowrap">
                                <th scope="col">Các kết quả</th>
                                    <c:forEach var="i" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                    <th scope="col">Tiến trình ${i+1}</th>
                                    </c:forEach>
                            </tr>
                        </thead>
                        <tbody class="fw-bold align-middle text-black">
                            <tr>
                                <th>Kết quả lần thứ nhất</th>
                                    <c:forEach var="i" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                    <td class="text-center">${questionDongThuanPhanTan.result_1[i]}</td>
                                </c:forEach>
                            </tr>

                            <tr>
                                <th>Kết quả lần thứ hai</th>
                                    <c:forEach var="j" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                    <td class="text-center">
                                        <c:forEach var="i" begin="0" end="${fn:length(questionDongThuanPhanTan.result_2) - 1}">
                                            <div class="mb-${fn:length(questionDongThuanPhanTan.result_2) - 1 == i ? 0 : 2}">${questionDongThuanPhanTan.result_2[i][j]}</div>
                                        </c:forEach>
                                    </td>
                                </c:forEach>
                            </tr>

                            <tr>
                                <th>Kết quả cuối cùng</th>
                                    <c:forEach var="i" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                    <td class="text-center">${questionDongThuanPhanTan.result_final[i]}</td>
                                </c:forEach>
                            </tr>
                        </tbody>
                    </table>                        
                </div>                                   
            </c:if>
            <!-- Đồng thuận phân tán ketqua end -->
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
                    if (this.id !== ('de-' + id)) {
                        $(this).removeClass('show');
                        $("#time-" + id).text('Thời gian: 00:00:00');
                    }
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
