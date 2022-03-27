<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
    <head>
        <title>Bầu chọn</title>
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

            <!-- Bầu chọn không dây de bai begin -->
            <h4 id="vector-timestamp" class="fw-bold my-4 pb-3 border-4 border-bottom border-danger d-inline-block">Bầu chọn không dây</h4>
            <p>Cho N tiến trình trong mạng không dây, mỗi tiến trình thể hiện bằng cặp tên và giá trị tham gia bầu chọn của tiến trình đó kèmn theo mỗi quan hệ cha con với các tiến trình khác như sau:</p>

            <c:if test="${isSolved == false}">
                <ul id="de-bai">
                    <c:forEach var="questionBauChon" items="${questionBauChons}" varStatus="status">
                        <li>
                            <p onclick="showDeBai(${status.count}, ${questionBauChon.id})" class="text-danger" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#de-${questionBauChon.id}" aria-expanded="false" aria-controls="collapseExample">Xem đề ${status.count}</p>

                            <div class="collapse" id="de-${questionBauChon.id}">
                                <div class="table-responsive">
                                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                        <thead style="background-color: #d30000" class="text-white align-middle text-center">
                                            <th scope="col">Tiến trình</th>
                                            <c:forEach var="i" begin="0" end="${questionBauChon.so_tien_trinh-1}">
                                               <th scope="col">P${i+1}</th>
                                            </c:forEach>                                            
                                        </thead>
                                        <tbody class="fw-bold align-middle text-black">
                                            <tr>
                                                <th class="text-danger align-middle">Giá trị ứng cử</th>
                                                <c:forEach var="i" begin="0" end="${questionBauChon.so_tien_trinh-1}">
                                                    <td class="text-center">${questionBauChon.deBai[0][i]}</td>
                                                </c:forEach>
                                            </tr>
                                            <tr>
                                                <th class="text-danger align-middle">Tiến trình cha</th>
                                                <c:forEach var="i" begin="0" end="${questionBauChon.so_tien_trinh-1}">
                                                    <td class="text-center">${questionBauChon.deBai[1][i]}</td>
                                                </c:forEach>                                            
                                            </tr>
                                        </tbody>
                                    </table>
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

            <p>Điền các thông điệp bầu chọn theo dịnh dạng cặp tên tiến trình và giá trị bầu chọn phân cách bằng dấu phẩy (Ví dụ P5,10). Quy định: Hàng là tiến trình gửi, cột là tiến trình nhận. Giao của hàng và cột là cặp tên tiến trình và giá trị bầu chọn cách nhau bởi dấu phẩy.</p>
            <!-- Bầu chọn không dây de bai end -->

            <!-- Bầu chọn không dây bai lam begin -->
            <c:if test="${isSolved == false}">
                <c:forEach var="questionBauChon" items="${questionBauChons}" varStatus="status">
                    <form class="collapse" action="<c:url value='${request.contextPath}/bau-chon'/>" method="post" id="de-${questionBauChon.id}">
                        <div class="d-flex justify-content-between mb-3">
                            <h3 class="text-success mb-0">Đề số: <c:out value="${questionBauChon.id}"></c:out></h3>
                                <input class="btn btn-success" type="submit" value="Nộp bài">
                            </div>

                            <input type="hidden" name="id" value="${questionBauChon.id}">

                        <div class="table-responsive">
                            <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                <thead style="background-color: #d30000" class="text-white align-middle text-center">
                                    <th scope="col">Tiến trình</th>
                                    <c:forEach var="i" begin="0" end="${questionBauChon.so_tien_trinh-1}">
                                       <th scope="col">P${i+1}</th>
                                    </c:forEach>                                            
                                </thead>
                                <tbody class="fw-bold align-middle text-black">
                                    <c:forEach var="i" begin="0" end="${questionBauChon.so_tien_trinh-1}" step="1">
                                        <tr>
                                            <th class="text-danger text-center">P${i+1}</th>
                                            <c:forEach var="j" begin="0" end="${questionBauChon.so_tien_trinh-1}" step="1">
                                                <td>
                                                    <input style="min-width: 100px" class="form-control" type="text" name="dapAn-${i}-${j}" class="text-danger" size="10">
                                                </td>
                                            </c:forEach>                                       
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>                        
                        </div>
                    </form>                    
                </c:forEach>
            </c:if>
            
            <c:if test="${isSolved == true}">
                <div class="d-flex justify-content-between mb-2">
                    <h3 class="text-danger mb-0">Đề số: <c:out value="${questionBauChon.id}"></c:out></h3>
                    <h3 class="text-danger mb-0">Điểm: <c:out value="${score}"></c:out></h3>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover border border-danger table-bordered align-middle w-100">
                            <thead style="background-color: #d30000" class="text-white align-middle text-center">
                                <th scope="col">Tiến trình</th>
                                <c:forEach var="i" begin="0" end="${questionBauChon.so_tien_trinh-1}">
                                   <th scope="col">P${i+1}</th>
                                </c:forEach>                                            
                            </thead>
                            <tbody class="fw-bold align-middle text-black text-center">
                                <tbody class="fw-bold align-middle text-black">
                                    <c:forEach var="i" begin="0" end="${questionBauChon.so_tien_trinh-1}" step="1">
                                        <tr class="text-center">
                                            <th class="text-danger">P${i+1}</th>
                                            <c:forEach var="j" begin="0" end="${questionBauChon.so_tien_trinh-1}" step="1">
                                                <td>${danAnAns[i][j]}</td>
                                            </c:forEach>                                       
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </tbody>
                    </table>                        
                </div>
            </c:if>
            <!-- Bầu chọn không dây bai lam end -->

            <!-- Bầu chọn không dây ketqua begin -->
            <c:if test="${isSolved == true}">
                <div class="d-flex justify-content-between mb-2">
                    <h3 class="text-success mb-0">Đáp án</h3>
                    <a class="btn btn-success" href="<c:url value='${request.contextPath}/bau-chon'/>">Back</a>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                        <thead style="background-color: #d30000" class="text-white align-middle text-center">
                            <th scope="col">
                                Nhận <br/>
                                <i class="fa-solid fa-arrow-right-long"></i> <br/>
                                Gửi <br/>
                                <i class="fa-solid fa-arrow-down-long"></i>
                            </th>
                            <c:forEach var="i" begin="0" end="${questionBauChon.so_tien_trinh-1}">
                               <th scope="col">P${i+1}</th>
                            </c:forEach>                                            
                        </thead>
                        <tbody class="fw-bold align-middle text-black">
                            <c:forEach var="i" begin="0" end="${questionBauChon.so_tien_trinh-1}" step="1">
                                <tr>
                                    <th class="text-danger text-center">P${i+1}</th>
                                    <c:forEach var="j" begin="0" end="${questionBauChon.so_tien_trinh-1}" step="1">
                                        <c:if test="${fn:contains(questionBauChon.dapAn[i][j], '(được chọn)')}">
                                            <c:set var = "dapAn" value = "${fn:replace(questionBauChon.dapAn[i][j], '(được chọn)', '<br/>(được chọn)')}" />
                                            <td class="text-center bg-warning">
                                                ${dapAn}
                                            </td>                                        
                                        </c:if>
                                        <c:if test="${!fn:contains(questionBauChon.dapAn[i][j], '(được chọn)')}">
                                            <td class="text-center">
                                                ${questionBauChon.dapAn[i][j]}
                                            </td>                                        
                                        </c:if>
                                    </c:forEach>                                       
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>                        
                </div>               
            </c:if>
            <!-- Bầu chọn không dây ketqua end -->
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
