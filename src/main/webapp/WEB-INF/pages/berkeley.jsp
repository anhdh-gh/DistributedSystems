<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Berkeley</title>
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

            <!-- Berkeley de bai begin -->
            <h4 id="vector-timestamp" class="fw-bold my-4 pb-3 border-4 border-bottom border-danger d-inline-block">Giải thuật Berkeley</h4>

            <c:if test="${isSolved == false}">
                <p>Sử dụng giải thuật Berkeley tính giá trị cần điều trình (mili giây) và thời gian sau khi đồng bộ (ghi theo định dạng yyyy-mm-dd hh:mi:ss:ms) cho các tiến trình sau:</p>
                <ul id="de-bai">
                    <c:forEach var="questionBerkeley" items="${questionBerkeleys}" varStatus="status">
                        <li>
                            <p onclick="showDeBai(${status.count}, ${questionBerkeley.questionId})" class="text-danger" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#de-${questionBerkeley.questionId}" aria-expanded="false" aria-controls="collapseExample">Xem đề ${status.count}</p>
                        </li>
                    </c:forEach>
                </ul>                
            </c:if>

            <c:if test="${isSolved == true}">
                <p>Sử dụng giải thuật Berkeley tính giá trị cần điều trình (mili giây) và thời gian sau khi đồng bộ (ghi theo định dạng yyyy-mm-dd hh:mi:ss:ms) cho ${fn:length(questionBerkeley.memberTimes)} tiến trình sau:</p>
            </c:if>
                
            <p>Thời gian làm bài: ${requestScope.timeForTest} phút.</p>
            <!-- Berkeley de bai end -->

            <!-- Berkeley bai lam begin -->
            <c:if test="${isSolved == false}">
                <c:forEach var="questionBerkeley" items="${questionBerkeleys}" varStatus="status">
                    <form class="collapse" action="<c:url value='${request.contextPath}/berkeley'/>" method="post" id="de-${questionBerkeley.questionId}">
                        <div class="d-flex justify-content-between mb-3">
                            <h3 class="text-success mb-0">Đề số: <c:out value="${questionBerkeley.questionId}"></c:out></h3>
                                <input class="btn btn-success" type="submit" value="Nộp bài">
                            </div>

                            <input type="hidden" name="questionId" value="${questionBerkeley.questionId}">

                        <div class="table-responsive">
                            <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                <thead style="background-color: #d30000" class="text-white align-middle">
                                    <tr class="text-center align-middle text-nowrap">
                                        <th scope="col">Tiến trình</th>
                                        <th scope="col">Loại</th>
                                        <th scope="col">Thời gian trước khi đồng bộ</th>
                                        <th scope="col">Giá trị điều chỉnh</th>
                                    </tr>
                                </thead>
                                <tbody class="fw-bold align-middle text-black">
                                    <c:forEach var="memberTime" items="${questionBerkeley.memberTimes}" varStatus="statusMemberTimes">
                                        <tr class="text-center">
                                            <th class="text-danger">P${statusMemberTimes.count}</th>
                                            <td>
                                                <c:if test="${statusMemberTimes.count == 1}">
                                                    Điều phối
                                                </c:if>
                                                <c:if test="${statusMemberTimes.count != 1}">
                                                    Thành viên
                                                </c:if>                                                    
                                            </td>
                                            
                                            <td>${memberTime}</td>
                                            
                                            <td>
                                                <input style="min-width: 100px" class="form-control" type="text" name="calibratedRes-${statusMemberTimes.count}" class="text-danger" size="10">
                                            </td>
                                        </tr>
                                    </c:forEach>
                                        
                                    <tr class="text-center">
                                        <td colspan="2"class="text-success">Thời gian sau khi đồng bộ</td>
                                        <td colspan="2"><input style="min-width: 100px" class="form-control" type="text" name="correctedDateTime" class="text-danger" size="10"></td>
                                    </tr>  
                                </tbody>
                            </table>                        
                        </div>
                            
                        <div class="mt-4">
                            <p id="time-${questionBerkeley.questionId}" class="fs-4 text-success"></p>
                        </div>
                    </form>                    
                </c:forEach>
            </c:if>
            <c:if test="${isSolved == true}">
                <div class="d-flex justify-content-between mb-2">
                    <h3 class="text-danger mb-0">Đề số: <c:out value="${questionBerkeley.questionId}"></c:out></h3>
                    <h3 class="text-danger mb-0">Điểm: <c:out value="${score}"></c:out></h3>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover border border-danger table-bordered align-middle w-100">
                            <thead style="background-color: #d30000" class="text-white align-middle">
                                <tr class="text-center align-middle text-nowrap">
                                    <th scope="col">Tiến trình</th>
                                    <th scope="col">Loại</th>
                                    <th scope="col">Thời gian trước khi đồng bộ</th>
                                    <th scope="col">Giá trị điều chỉnh</th>
                                </tr>
                            </thead>
                                <tbody class="fw-bold align-middle text-black">
                                    <c:forEach var="memberTime" items="${questionBerkeley.memberTimes}" varStatus="statusMemberTimes">
                                        <tr class="text-center">
                                            <th class="text-danger">P${statusMemberTimes.count}</th>
                                            <td>
                                                <c:if test="${statusMemberTimes.count == 1}">
                                                    Điều phối
                                                </c:if>
                                                <c:if test="${statusMemberTimes.count != 1}">
                                                    Thành viên
                                                </c:if>                                                    
                                            </td>
                                            
                                            <td>${memberTime}</td>
                                            
                                            <td>${calibratedAns[statusMemberTimes.count-1]}</td>
                                        </tr>
                                    </c:forEach>
                                        
                                    <tr class="text-center">
                                        <td colspan="2" class="text-danger">Thời gian sau khi đồng bộ</td>
                                        <td colspan="2" class="text-success">${correctedDateTimeAns}</td>
                                    </tr>  
                                </tbody>
                    </table>                        
                </div>
            </c:if>
            <!-- Berkeley bai lam end -->

            <!-- Berkeley ketqua begin -->
            <c:if test="${isSolved == true}">
                <div class="d-flex justify-content-between mb-2 mt-4">
                    <h3 class="text-success mb-0">Đáp án</h3>
                    <a class="btn btn-success" href="<c:url value='${request.contextPath}/berkeley'/>">Back</a>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                        <thead style="background-color: #d30000" class="text-white align-middle">
                            <tr class="text-center align-middle text-nowrap">
                                <th scope="col">Tiến trình</th>
                                <th scope="col">Loại</th>
                                <th scope="col">Thời gian trước khi đồng bộ</th>
                                <th scope="col">Giá trị điều chỉnh</th>
                            </tr>
                        </thead>
                        <tbody class="fw-bold align-middle text-black">
                            <c:forEach var="memberTime" items="${questionBerkeley.memberTimes}" varStatus="statusMemberTimes">
                                <tr class="text-center">
                                    <th class="text-danger">P${statusMemberTimes.count}</th>
                                    <td>
                                        <c:if test="${statusMemberTimes.count == 1}">
                                            Điều phối
                                        </c:if>
                                        <c:if test="${statusMemberTimes.count != 1}">
                                            Thành viên
                                        </c:if>                                                    
                                    </td>

                                    <td>${memberTime}</td>

                                    <td>${questionBerkeley.calibratedRes[statusMemberTimes.count-1]}</td>
                                </tr>
                            </c:forEach>

                            <tr class="text-center">
                                <td colspan="2" class="text-danger">Thời gian sau khi đồng bộ</td>
                                <td colspan="2" class="text-success">${questionBerkeley.correctedDateTime}</td>
                            </tr>  
                        </tbody>
                    </table>                        
                </div>               
            </c:if>
            <!-- Berkeley ketqua end -->
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
