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

            <!-- Header begin -->
            <jsp:include page="./includes/navbar.jsp"/>
            <!-- Header end --> 

            <!-- Nhãn thời gian vector de bai begin -->
            <h4 id="vector-timestamp" class="fw-bold my-4 pb-3 border-4 border-bottom border-danger d-inline-block">Schlosser</h4>
            <p>N nút mạng được thiết kế theo phương pháp Schlosser, định danh của các nút thể hiện trên các hàng và các cột tiêu đề, hãy điền giá trị của các cạnh đến mỗi nút láng ghiềng của mình.</p>
            <p>Thực hiện với:</p>

            <c:if test="${isSolved == false}">
                <ul id="de-bai">
                    <c:forEach var="questionSchlosser" items="${questionSchlossers}" varStatus="status">
                        <li>
                            <p onclick="showDeBai(${status.count}, ${questionSchlosser.id})" class="text-danger" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#de-${questionSchlosser.id}" aria-expanded="false" aria-controls="collapseExample">N = ${questionSchlosser.soNut}</p>
                        </li>
                    </c:forEach>
                </ul>                
            </c:if>

            <c:if test="${isSolved == true}">
                <ul>
                    <li>N = ${questionSchlosser.soNut}</li>
                </ul>
            </c:if>
            <!-- Nhãn thời gian vector de bai end -->

            <!-- Nhãn thời gian vector bai lam begin -->
            <c:if test="${isSolved == false}">
                <c:forEach var="questionSchlosser" items="${questionSchlossers}" varStatus="status">
                    <form class="collapse" action="<c:url value='${request.contextPath}/schlosser'/>" method="post" id="de-${questionSchlosser.id}">
                        <div class="d-flex justify-content-between mb-3">
                            <h3 class="text-success mb-0">N = <c:out value="${questionSchlosser.soNut}"></c:out></h3>
                            <h6 class="text-danger mb-0"><c:out value="Số lượng láng giềng cho mỗi nút: ${questionSchlosser.so_lang_gieng}"></c:out></h6>
                            <input class="btn btn-success" type="submit" value="Nộp bài">
                        </div>

                        <input type="hidden" name="id" value="${questionSchlosser.id}">

                        <div class="table-responsive">
                            <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                <thead style="background-color: #d30000" class="text-white align-middle">
                                    <tr class="text-center align-middle text-nowrap">
                                        <th scope="col">Nút</th>
                                        <c:forEach var="i" begin="0" end="${questionSchlosser.soNut-1}" step="1">
                                            <th scope="col">${i}</th>
                                        </c:forEach>
                                    </tr>
                                </thead>
                                <tbody class="fw-bold align-middle text-black">
                                    <c:forEach var="i" begin="0" end="${questionSchlosser.soNut-1}" step="1">
                                        <tr>
                                            <th class="text-danger text-center">${i}</th>
                                            <c:forEach var="j" begin="0" end="${questionSchlosser.soNut-1}" step="1">
                                                <td>
                                                    <input class="form-control" type="text" name="${i}-${j}" class="text-danger">
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
                    <h3 class="text-success mb-0">N = <c:out value="${questionSchlosser.soNut}"></c:out></h3>
                    <h6 class="text-danger mb-0"><c:out value="Số lượng láng giềng cho mỗi nút: ${questionSchlosser.so_lang_gieng}"></c:out></h6>
                    <h3 class="text-danger mb-0">Điểm: <c:out value="${score}"></c:out></h3>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                        <thead style="background-color: #d30000" class="text-white align-middle">
                            <tr class="text-center align-middle text-nowrap">
                                <th scope="col">Nút</th>
                                <c:forEach var="i" begin="0" end="${questionSchlosser.soNut-1}" step="1">
                                    <th scope="col">${i}</th>
                                </c:forEach>
                            </tr>
                        </thead>
                        <tbody class="fw-bold align-middle text-black text-center">
                            <c:forEach var="i" begin="0" end="${questionSchlosser.soNut-1}" step="1">
                                <tr>
                                    <th class="text-danger text-center">${i}</th>
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
                <div class="d-flex justify-content-between mb-2">
                    <h3 class="text-success mb-0">Đáp án</h3>
                    <a class="btn btn-success" href="<c:url value='${request.contextPath}/schlosser'/>">Back</a>
                </div>

                <div class="table-responsive">
                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                        <thead style="background-color: #d30000" class="text-white align-middle">
                            <tr class="text-center align-middle text-nowrap">
                                <th scope="col">Nút</th>
                                <c:forEach var="i" begin="0" end="${questionSchlosser.soNut-1}" step="1">
                                    <th scope="col">${i}</th>
                                </c:forEach>
                            </tr>
                        </thead>
                        <tbody class="fw-bold align-middle text-black text-center">
                            <c:forEach var="i" begin="0" end="${questionSchlosser.soNut-1}" step="1">
                                <tr>
                                    <th class="text-danger text-center">${i}</th>
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
