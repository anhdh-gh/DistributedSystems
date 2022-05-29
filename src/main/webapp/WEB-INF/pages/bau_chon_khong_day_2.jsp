<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
    <head>
        <title>Bầu chọn không dây (Dạng 2)</title>
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

            <!-- Bầu chọn không dây de bai begin -->
            <div class="d-flex justify-content-center">
                <h4 class="fw-bold my-4 pb-3 border-4 border-bottom border-danger d-inline-block">Bầu chọn không dây (Dạng 2)</h4>
            </div>
            <p>Cho ${isSolved == true ? questionBauChonKhongDay.so_tien_trinh : 'N'} tiến trình trong mạng không dây, mỗi tiến trình thể hiện bằng cặp tên và giá trị tham gia bầu chọn của tiến trình đó kèm theo mỗi quan hệ cha con với các tiến trình khác như sau:</p>

            <c:if test="${isSolved == false}">
                <div id="de-bai">
                    <c:forEach var="questionBauChonKhongDay" items="${questionBauChonKhongDays}" varStatus="status">
                        <div>
                            <p onclick="showDeBai(${status.count}, ${questionBauChonKhongDay.id})" class="text-danger" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#de-${questionBauChonKhongDay.id}" aria-expanded="false" aria-controls="collapseExample"><i class="fa-solid fa-arrows-to-dot"></i> Xem đề ${status.count}</p>

                            <div class="collapse" id="de-${questionBauChonKhongDay.id}">
                                <div class="table-responsive">
                                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                        <thead style="background-color: #d30000" class="text-white align-middle text-center">
                                        <th scope="col">Tiến trình (gửi)</th>
                                            <c:forEach var="i" begin="0" end="${questionBauChonKhongDay.so_tien_trinh-1}">
                                            <th scope="col">P${i+1}</th>
                                            </c:forEach>                                            
                                        </thead>
                                        <tbody class="fw-bold align-middle text-black">
                                            <tr>
                                                <th class="text-danger align-middle">Giá trị ứng cử</th>
                                                    <c:forEach var="i" begin="0" end="${questionBauChonKhongDay.so_tien_trinh-1}">
                                                    <td class="text-center">${questionBauChonKhongDay.deBai[0][i]}</td>
                                                </c:forEach>
                                            </tr>
                                            <tr>
                                                <th class="text-danger align-middle">Tiến trình cha (nhận)</th>
                                                    <c:forEach var="i" begin="0" end="${questionBauChonKhongDay.so_tien_trinh-1}">
                                                    <td class="text-center">${questionBauChonKhongDay.deBai[1][i]}</td>
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
                        <thead style="background-color: #d30000" class="text-white align-middle text-center">
                        <th scope="col">Tiến trình (gửi)</th>
                            <c:forEach var="i" begin="0" end="${questionBauChonKhongDay.so_tien_trinh-1}">
                            <th scope="col">P${i+1}</th>
                            </c:forEach>                                            
                        </thead>
                        <tbody class="fw-bold align-middle text-black">
                            <tr>
                                <th class="text-danger align-middle">Giá trị ứng cử</th>
                                    <c:forEach var="i" begin="0" end="${questionBauChonKhongDay.so_tien_trinh-1}">
                                    <td class="text-center">${questionBauChonKhongDay.deBai[0][i]}</td>
                                </c:forEach>
                            </tr>
                            <tr>
                                <th class="text-danger align-middle">Tiến trình cha (nhận)</th>
                                    <c:forEach var="i" begin="0" end="${questionBauChonKhongDay.so_tien_trinh-1}">
                                    <td class="text-center">${questionBauChonKhongDay.deBai[1][i]}</td>
                                </c:forEach>                                            
                            </tr>
                        </tbody>
                    </table>
                </div>
            </c:if>

            <p>Khởi nguồn từ tiến trình P1. Điền các thông điệp bầu chọn theo dịnh dạng cặp tên tiến trình và giá trị bầu chọn phân cách bằng dấu phẩy (Ví dụ P5,10).</p>
            <p>Thời gian làm bài: ${requestScope.timeForTest} phút.</p>
            <!-- Bầu chọn không dây de bai end -->

            <!-- Bầu chọn không dây bai lam begin -->
            <c:if test="${isSolved == false}">
                <c:forEach var="questionBauChonKhongDay" items="${questionBauChonKhongDays}" varStatus="status">
                    <form autocomplete="off" class="collapse" action="<c:url value='${request.contextPath}/algorithm/bau-chon-khong-day-2'/>" method="post" id="de-${questionBauChonKhongDay.id}">
                        <div class="d-flex justify-content-between mb-3">
                            <h3 class="text-success mb-0">Đề số: <c:out value="${questionBauChonKhongDay.id}"></c:out></h3>
                                <input autocomplete="off" class="btn btn-success" type="submit" value="Nộp bài">
                            </div>

                            <input autocomplete="off" type="hidden" name="id" value="${questionBauChonKhongDay.id}">
                            <input autocomplete="off" type="hidden" name="time">

                        <div class="table-responsive">
                            <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                <thead style="background-color: #d30000" class="text-white align-middle text-center">
                                    <th scope="col">Thông điệp</th>
                                    <th scope="col">Tiến trình bầu chọn</th>                                          
                                </thead>
                                <tbody class="fw-bold align-middle text-black">
                                    <c:forEach var="j" begin="0" end="${questionBauChonKhongDay.so_tien_trinh-1}" step="1">
                                        <c:forEach var="i" begin="0" end="${questionBauChonKhongDay.so_tien_trinh-1}" step="1">
                                            <c:if test="${not empty questionBauChonKhongDay.dapAn[i][j]}">
                                                <tr>
                                                    <c:choose>
                                                        <c:when test="${i == 0}">
                                                            <th>Tiến trình được chọn</th>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <th>P${i+1} gửi P${j+1}</th>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <td>
                                                        <input autocomplete="off" style="min-width: 100px" class="form-control" type="text" name="dapAn-${i}-${j}" class="text-danger" size="10">
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                </tbody>
                            </table>                        
                        </div>

                        <div class="mt-4">
                            <p id="time-${questionBauChonKhongDay.id}" class="fs-4 text-success">Thời gian: 00:00:00</p>
                        </div>
                    </form>                    
                </c:forEach>
            </c:if>

            <c:if test="${isSolved == true}">
                <div class="d-flex justify-content-between mb-2">
                    <h3 class="text-success mb-0">Đáp án đề <c:out value="${questionBauChonKhongDay.id}"></c:out>:</h3>
                    <h3 class="text-danger mb-0">Điểm: <c:out value="${score}"></c:out></h3>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                        <thead style="background-color: #d30000" class="text-white align-middle text-center">
                            <th scope="col">Thông điệp</th>
                            <th scope="col">Tiến trình bầu chọn</th>  
                            <th scope="col">Đáp án</th>
                        </thead>
                        <tbody class="fw-bold align-middle text-black">
                            <c:forEach var="j" begin="0" end="${questionBauChonKhongDay.so_tien_trinh-1}" step="1">
                                <c:forEach var="i" begin="0" end="${questionBauChonKhongDay.so_tien_trinh-1}" step="1">
                                    <c:if test="${not empty questionBauChonKhongDay.dapAn[i][j]}">
                                        <tr>
                                            <c:choose>
                                                <c:when test="${i == 0}">
                                                    <th>Tiến trình được chọn</th>
                                                </c:when>
                                                <c:otherwise>
                                                    <th>P${i+1} gửi P${j+1}</th>
                                                </c:otherwise>
                                            </c:choose>
                                            <td class="text-center">${danAnAns[i][j]}</td>
                                            <td class="text-center">${fn:replace(questionBauChonKhongDay.dapAn[i][j], ' (được chọn)', '')}</td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </tbody>
                    </table>                        
                </div>
                
                <h3 class="text-success mb-0">${time}</h3>
            </c:if>
            <!-- Bầu chọn không dây bai lam end -->
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
