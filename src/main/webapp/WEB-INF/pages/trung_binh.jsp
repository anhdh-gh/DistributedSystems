<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Trung bình</title>
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

            <!-- Header begin -->
            <jsp:include page="./includes/navbar.jsp"/>
            <!-- Header end --> 

            <!-- Trung bình de bai begin -->
            <h4 id="vector-timestamp" class="fw-bold my-4 pb-3 border-4 border-bottom border-danger d-inline-block">Giải thuật Trung bình</h4>

            <p>Tại một thời điểm các tiến trình đồng loại gửi thời gian cho các tiến trình khác trong nhóm, giả thiết sau đó mỗi tiến trình đều nhận được thời gian của các tiến trình khác, hãy tính thời gian của mỗi tiến trình sau khi thực hiện giải thuật đồng bộ (ghi thời gian theo định dạng yyyy-mm-dd hh:mi:ss:ms).</p>

            <c:if test="${isSolved == false}">
                <ul id="de-bai">
                    <c:forEach var="questionTrungBinh" items="${questionTrungBinhs}" varStatus="status">
                        <li>
                            <p onclick="showDeBai(${status.count}, ${questionTrungBinh.questionId})" class="text-danger" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#de-${questionTrungBinh.questionId}" aria-expanded="false" aria-controls="collapseExample">Xem đề ${status.count}</p>
                        </li>
                    </c:forEach>
                </ul>                
            </c:if>
            <!-- Trung bình de bai end -->

            <!-- Trung bình bai lam begin -->
            <c:if test="${isSolved == false}">
                <c:forEach var="questionTrungBinh" items="${questionTrungBinhs}" varStatus="status">
                    <form class="collapse" action="<c:url value='${request.contextPath}/trung-binh'/>" method="post" id="de-${questionTrungBinh.questionId}">
                        <div class="d-flex justify-content-between mb-3">
                            <h3 class="text-success mb-0">Đề số: <c:out value="${questionTrungBinh.questionId}"></c:out></h3>
                                <input class="btn btn-success" type="submit" value="Nộp bài">
                            </div>

                            <input type="hidden" name="questionId" value="${questionTrungBinh.questionId}">

                        <div class="table-responsive">
                            <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                <thead style="background-color: #d30000" class="text-white align-middle">
                                    <tr class="text-center align-middle text-nowrap">
                                        <th scope="col">Tiến trình</th>
                                        <th scope="col">Trước đồng bộ</th>
                                        <th scope="col">Sau đồng bộ</th>
                                    </tr>
                                </thead>
                                <tbody class="fw-bold align-middle text-black">
                                    <c:forEach var="memberTime" items="${questionTrungBinh.memberTimes}" varStatus="statusMemberTimes">
                                        <tr class="text-center">
                                            <th class="text-danger">${statusMemberTimes.count}</th>
                                            
                                            <td>${memberTime}</td>
                                            
                                            <td>
                                                <input style="min-width: 100px" class="form-control" type="text" name="correctedMs-${statusMemberTimes.count}" class="text-danger" size="10">
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>                        
                        </div>
                    </form>                    
                </c:forEach>
            </c:if>
            <!-- Trung bình bai lam end -->

            <!-- Trung bình ketqua begin -->
            <c:if test="${isSolved == true}">
                <div class="d-flex justify-content-between mb-2 mt-4">
                    <h3 class="text-success mb-0">Đáp án đề ${questionTrungBinh.questionId}:</h3>
                    <h3 class="text-danger mb-0">Điểm: <c:out value="${score}"></c:out></h3>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                        <thead style="background-color: #d30000" class="text-white align-middle">
                            <tr class="text-center align-middle text-nowrap">
                                <th scope="col">Tiến trình</th>
                                <th scope="col">Trước đồng bộ</th>
                                <th scope="col">Sau đồng bộ</th>
                                <th scope="col">Đáp án</th>
                            </tr>
                        </thead>
                        <tbody class="fw-bold align-middle text-black">
                            <c:forEach var="memberTime" items="${questionTrungBinh.memberTimes}" varStatus="statusMemberTimes">
                                <tr class="text-center">
                                    <th class="text-danger">${statusMemberTimes.count}</th>

                                    <td>${memberTime}</td>
                                    <td>${correctedMsÁns[statusMemberTimes.count-1]}</td>                                    
                                    <td>${questionTrungBinh.correctedMs[statusMemberTimes.count-1]}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>                        
                </div>    
                
                <a class="btn btn-success" href="<c:url value='${request.contextPath}/trung-binh'/>">Back</a>
            </c:if>
            <!-- Trung bình ketqua end -->
        </div>      

        <!-- Footer begin -->
        <jsp:include page="./includes/html-body.jsp" />
        <!-- Footer end -->

        <script>
            function showDeBai(index, vector_id) {
                $("#de-bai .collapse.show").each(function () {
                    if (this.id !== ('de-' + vector_id))
                        $(this).removeClass('show');
                });

                $("form.collapse.show").each(function () {
                    if (this.id !== ('de-' + vector_id)) {
                        $(this).removeClass('show');
                        $(this).trigger("reset");
                    }
                });
            }
        </script>
    </body>
</html>
