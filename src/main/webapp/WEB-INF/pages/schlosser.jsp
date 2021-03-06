<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Schlosser</title>
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
            <div class="d-flex justify-content-center">
                <h4 class="fw-bold my-4 pb-3 border-4 border-bottom border-danger d-inline-block"><a href="" class="text-reset text-decoration-none">Schlosser</a></h4>
            </div>
            <p>Có ${isSolved == true ? questionSchlosser.soNut : 'N'} nút mạng được thiết kế theo phương pháp Schlosser, định danh của các nút thể hiện trên các hàng và các cột tiêu đề, hãy điền giá trị của các cạnh đến mỗi nút láng giềng của mình.</p>
            <p>Thực hiện với:</p>

            <c:if test="${isSolved == false}">
                <div id="de-bai">
                    <c:forEach var="questionSchlosser" items="${questionSchlossers}" varStatus="status">
                        <div>
                            <p onclick="showDeBai(${status.count}, ${questionSchlosser.id})" class="text-danger" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#de-${questionSchlosser.id}" aria-expanded="false" aria-controls="collapseExample"><i class="fa-solid fa-arrows-to-dot"></i> N = ${questionSchlosser.soNut}</p>
                        </div>
                    </c:forEach>
                </div>                
            </c:if>
            
            <p>Thời gian làm bài: ${requestScope.timeForTest} phút.</p>
            <!-- Nhãn thời gian vector de bai end -->

            <!-- Nhãn thời gian vector bai lam begin -->
            <c:if test="${isSolved == false}">
                <c:forEach var="questionSchlosser" items="${questionSchlossers}" varStatus="status">
                    <form autocomplete="off" class="collapse" action="<c:url value='${request.contextPath}/algorithm/schlosser'/>" method="post" id="de-${questionSchlosser.id}">
                        <div class="d-flex justify-content-between mb-3">
                            <div>
                                <h6 class="text-success mb-0">N = <c:out value="${questionSchlosser.soNut}"></c:out></h6>
                                <p class="text-danger mb-0 me-1"><c:out value="Số lượng láng giềng cho mỗi nút: ${questionSchlosser.so_lang_gieng}"></c:out></p>
                            </div>
                            
                            <input autocomplete="off" class="btn btn-success" type="submit" value="Nộp bài">
                        </div>

                        <input autocomplete="off" type="hidden" name="id" value="${questionSchlosser.id}">
                        <input autocomplete="off" type="hidden" name="time">

                        <div class="table-responsive position-relative">
                            <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                <thead style="background-color: #d30000" class="text-white align-middle">
                                    <tr class="text-center align-middle text-nowrap">
                                        <th style="background-color: #d30000" scope="col" class="position-sticky start-0">Nút</th>
                                        <c:forEach var="i" begin="0" end="${questionSchlosser.soNut-1}" step="1">
                                            <th scope="col">${i}</th>
                                        </c:forEach>
                                    </tr>
                                </thead>
                                <tbody class="fw-bold align-middle text-black">
                                    <c:forEach var="i" begin="0" end="${questionSchlosser.soNut-1}" step="1">
                                        <tr>
                                            <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">${i}</th>
                                            <c:forEach var="j" begin="0" end="${questionSchlosser.soNut-1}" step="1">
                                                <td>
                                                    <input autocomplete="off" style="min-width: 100px" class="form-control" type="text" name="${i}-${j}" class="text-danger">
                                                </td>
                                            </c:forEach>                                       
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>                        
                        </div>
                        <div class="mt-4">
                            <p id="time-${questionSchlosser.id}" class="fs-4 text-success">Thời gian: 00:00:00</p>
                        </div>
                    </form>                    
                </c:forEach>
            </c:if>
            
            <c:if test="${isSolved == true}">
                <div class="d-flex justify-content-between mb-2">
                    <div>
                        <h6 class="text-success mb-0">N = <c:out value="${questionSchlosser.soNut}"></c:out></h6>
                        <p class="text-danger mb-0 me-1"><c:out value="Số lượng láng giềng cho mỗi nút: ${questionSchlosser.so_lang_gieng}"></c:out></p>
                    </div>
                    <h3 class="text-danger mb-0">Điểm: <c:out value="${score}"></c:out></h3>
                </div>

                <div class="table-responsive position-relative">
                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                        <thead style="background-color: #d30000" class="text-white align-middle">
                            <tr class="text-center align-middle text-nowrap">
                                <th style="background-color: #d30000; max-width: 1rem;" scope="col" class="position-sticky start-0">Nút</th>
                                <c:forEach var="i" begin="0" end="${questionSchlosser.soNut-1}" step="1">
                                    <th scope="col">${i}</th>
                                </c:forEach>
                            </tr>
                        </thead>
                        <tbody class="fw-bold align-middle text-black text-center">
                            <c:forEach var="i" begin="0" end="${questionSchlosser.soNut-1}" step="1">
                                <tr>
                                    <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">${i}</th>
                                    <c:forEach var="j" begin="0" end="${questionSchlosser.soNut-1}" step="1">
                                        <td>${ans[i][j]}</td>
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
                    <h3 class="text-success mb-0 me-1">Đáp án</h3>
                    <h3 class="text-success mb-0">${time}</h3>
                </div>

                <div class="table-responsive position-relative">
                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                        <thead style="background-color: #d30000" class="text-white align-middle">
                            <tr class="text-center align-middle text-nowrap">
                                <th style="background-color: #d30000; max-width: 1rem;" scope="col" class="position-sticky start-0">Nút</th>
                                <c:forEach var="i" begin="0" end="${questionSchlosser.soNut-1}" step="1">
                                    <th scope="col">${i}</th>
                                </c:forEach>
                            </tr>
                        </thead>
                        <tbody class="fw-bold align-middle text-black text-center">
                            <c:forEach var="i" begin="0" end="${questionSchlosser.soNut-1}" step="1">
                                <tr>
                                    <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">${i}</th>
                                    <c:forEach var="j" begin="0" end="${questionSchlosser.soNut-1}" step="1">
                                        <td>
                                            <c:if test="${questionSchlosser.result[i][j] != 0}">
                                                ${questionSchlosser.result[i][j]}
                                            </c:if>
                                        </td>
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
                $("#time-" + id).text('Thời gian: 00:00:00');

                $("#de-bai .collapse.show").each(function () {
                    if (this.id !== ('de-' + id)) {
                        $(this).removeClass('show');
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
                        switch($(".collapse.show").length) {
                            case 0: {
                                text = "";
                                break;
                            }
                            case 1: {                             
                                break;
                            }
                        }
                        
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
