<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Examination</title>
        <jsp:include page="./includes/html-head.jsp" />
    </head>
    <body>
        <!-- Loader begin -->
        <jsp:include page="./includes/loader.jsp"/>
        <!-- Loader end -->

        <div class="container-xl min-vh-100 position-relative">
            <!-- Header begin -->
            <jsp:include page="./includes/header.jsp"/>
            <!-- Header end -->  

            <!-- Header begin -->
            <jsp:include page="./includes/navbar.jsp"/>
            <!-- Header end --> 

            <c:choose>
                <c:when test="${questionExams != null}">
                    <div class="d-flex justify-content-center">
                        <h4 class="fw-bold my-4 pb-3 border-4 border-bottom border-danger"><a href="" class="text-reset text-decoration-none">Examination</a></h4>
                    </div>

                    <p class="fs-5 text-success">Thời gian làm bài: ${requestScope.timeForTest} phút.</p>

                    <!-- Examination bài làm begin -->
                    <c:if test="${isSolved == false}">                
                        <div class="d-flex justify-content-between position-sticky top-0 bg-white py-2" style="z-index: 100">
                            <div class="d-flex">
                                <p id="time" class="text-center fs-4 text-success fw-bold m-0">00:00:00</p>
                            </div>

                            <div class="d-flex">
                                <button type="submit" class="btn btn-success m-auto" form="bai-lam">Nộp bài</button>
                            </div>
                        </div>

                        <form id="bai-lam" autocomplete="off" action="<c:url value='${request.contextPath}/examination'/>" method="post">
                            <input autocomplete="off" type="hidden" name="time">

                            <c:forEach var="i" begin="0" end="${fn:length(questionExams) - 1}" varStatus="status">
                                <c:set var="questionExam" value="${questionExams[i]}"/>
                                <div class="mb-5">
                                    <h5 class="text-danger fw-bold mt-4">Câu ${status.count} (${questionExam.score} điểm):</h5>
                                    <input autocomplete="off" type="hidden" name="id" value="${questionExam.id}">

                                    <c:choose>
                                        <c:when test="${questionExam.nameAlgorithm == 'VectorTimestamp'}">
                                            <c:choose>
                                                <c:when test="${questionExam.type == 1}">
                                                    <c:set var="questionVectorTimestamp" value="${questionExam.question}"/>

                                                    <!-- Đề bài -->
                                                    <div>
                                                        <p>Nhãn thời gian của mỗi tiến trình được đặt theo cấu trúc (P1,...,P${fn:length(questionVectorTimestamp.res)}). Các sự kiện trên mỗi tiến trình thể hiện như sau:</p>
                                                        <ul>
                                                            <li>eX,Y thể hiện sự kiện</li>
                                                            <li>X là số hiệu tiến trình</li>
                                                            <li>Y là số thứ tự sự kiện trong tiến trình</li>
                                                        </ul>
                                                        <p>Thông điệp giữa các tiến trình như sau:</p>
                                                        <ul>
                                                            <c:forEach var="listMesi" items="${questionVectorTimestamp.listMes}">
                                                                <li>${listMesi}</li>
                                                                </c:forEach>
                                                        </ul>
                                                        <p>Hãy điền nhãn thời gian vector cho các sự kiện của mỗi tiến trình (chú ý xóa tên sự kiện trước khi điền giá trị).</p>

                                                        <!-- Bài làm -->
                                                        <div class="table-responsive position-relative">
                                                            <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                                                <thead style="background-color: #d30000" class="text-white align-middle">
                                                                    <tr class="text-center align-middle text-nowrap">
                                                                        <th style="background-color: #d30000" scope="col" class="position-sticky start-0">TT</th>
                                                                            <c:forEach var="i" begin="0" end="${fn:length(questionVectorTimestamp.res[0]) - 1}">
                                                                            <th scope="col">eX,${i}</th>
                                                                            </c:forEach>
                                                                    </tr>
                                                                </thead>
                                                                <tbody class="fw-bold align-middle text-black">
                                                                    <c:set var="isIcr"><%= java.lang.Math.round(java.lang.Math.random() * 2) % 2%></c:set>
                                                                <input autocomplete="off" type="hidden" name="questionVectorTimestamp_${questionExam.id}_isIcr" value="${isIcr}">
                                                                <c:forEach var="icr" begin="0" end="${fn:length(questionVectorTimestamp.res) - 1}" step="1">
                                                                    <c:set var="i" value="${isIcr == 0 ? icr : fn:length(questionVectorTimestamp.res)-1-icr}"/>
                                                                    <tr>
                                                                        <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">P${i+1}</th>
                                                                            <c:forEach var="j" begin="0" end="${fn:length(questionVectorTimestamp.res[i]) - 1}" step="+1">
                                                                            <td>
                                                                                <c:if test="${j == 0}">
                                                                                    ${questionVectorTimestamp.res[i][j]}
                                                                                </c:if>

                                                                                <c:if test="${j != 0}">
                                                                                    <input autocomplete="off" style="min-width: 100px" class="form-control" type="text" name="questionVectorTimestamp_${questionExam.id}_${i}_${j}" value="e${i + 1},${j}">
                                                                                </c:if>
                                                                            </td>
                                                                        </c:forEach>                                       
                                                                    </tr>
                                                                </c:forEach>
                                                                </tbody>
                                                            </table>                        
                                                        </div>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </c:when>

                                        <c:when test="${questionExam.nameAlgorithm == 'TrungBinh'}">
                                            <c:choose>
                                                <c:when test="${questionExam.type == 1}">
                                                    <c:set var="questionTrungBinh" value="${questionExam.question}"/>

                                                    <!-- Đề bài -->
                                                    <p>Tại một thời điểm các tiến trình đồng loại gửi thời gian cho các tiến trình khác trong nhóm, giả thiết sau đó mỗi tiến trình đều nhận được thời gian của các tiến trình khác, hãy tính thời gian của mỗi tiến trình sau khi thực hiện giải thuật đồng bộ (ghi thời gian theo định dạng yyyy-mm-dd hh:mi:ss:ms).</p>

                                                    <!-- Bài làm -->
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
                                                                            <input autocomplete="off" style="min-width: 100px" class="form-control" type="text" name="questionTrungBinh_${questionExam.id}_correctedMs_${statusMemberTimes.count}" class="text-danger" size="10">
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>                        
                                                    </div>
                                                </c:when>                                        
                                            </c:choose>
                                        </c:when>

                                        <c:when test="${questionExam.nameAlgorithm == 'Schlosser'}">
                                            <c:choose>
                                                <c:when test="${questionExam.type == 1}">
                                                    <c:set var="questionSchlosser" value="${questionExam.question}"/>

                                                    <!-- Đề bài -->
                                                    <p>Có ${questionSchlosser.soNut} nút mạng được thiết kế theo phương pháp Schlosser, định danh của các nút thể hiện trên các hàng và các cột tiêu đề, hãy điền giá trị của các cạnh đến mỗi nút láng giềng của mình.</p>

                                                    <!-- Bài làm -->
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
                                                                                <input autocomplete="off" style="min-width: 100px" class="form-control" type="text" name="questionSchlosser_${questionExam.id}_${i}_${j}" class="text-danger">
                                                                            </td>
                                                                        </c:forEach>                                       
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>                        
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </c:when>

                                        <c:when test="${questionExam.nameAlgorithm == 'Rbs'}">
                                            <c:choose>
                                                <c:when test="${questionExam.type == 1}">
                                                    <c:set var="questionForRbs" value="${questionExam.question}"/>

                                                    <!-- Đề bài -->
                                                    <p>Tiến trình P thực hiện ${fn:length(questionForRbs.diffPQ)} lần gửi tín hiệu đồng bộ thời gian vật lý đến tiến trình Q như bảng dưới đây. Tính độ lệch thời gian tính bằng đơn vị Tick giữa P và Q.</p>

                                                    <!-- Đáp án -->
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
                                                                        <td><input autocomplete="off" style="min-width: 100px" class="form-control" type="text" name="questionForRbs_${questionExam.id}_diffPQ_${i}" class="text-danger" size="10"></td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>                        
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </c:when>

                                        <c:when test="${questionExam.nameAlgorithm == 'Lamport'}">
                                            <c:choose>
                                                <c:when test="${questionExam.type == 1}">
                                                    <c:set var="questionLamport" value="${questionExam.question}"/>

                                                    <!-- Đề bài -->
                                                    <p>Có ${fn:length(questionLamport.deBai)} tiến trình P1, ..., P${fn:length(questionLamport.deBai)}, mỗi tiến trình đều có bộ đếm thời gian riêng nhưng nhịp đếm không giống nhau. Mỗi tiến trình Pi có bộ đếm Ci để đánh dấu thời điểm xảy tra các sự kiện trong tiến trình, sự kiện ở đây có thể là nội tại trong tiến trình hoặc gửi thông điệp cho tiến trình khác. Các sự kiện trên mỗi tiến trình thể hiện như sau:</p>
                                                    <ul>
                                                        <li>eX,Y thể hiện sự kiện</li>
                                                        <li>X là số hiệu tiến trình</li>
                                                        <li>Y là số thứ tự sự kiện trong tiến trình</li>
                                                    </ul>
                                                    <p>Bộ đếm thời gian của mỗi tiến trình và thông điệp giữa các tiến trình như sau:</p>
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

                                                    <!-- Bài làm -->
                                                    <p>Hãy điền nhãn thời gian lamport cho các sự kiện của mỗi tiến trình (chú ý xóa tên sự kiện trước khi điền giá trị).</p>
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
                                                            <input autocomplete="off" type="hidden" name="questionLamport_${questionExam.id}_debai_isIcr" value="${map.get(questionLamport.id)}">
                                                            <input autocomplete="off" type="hidden" name="questionLamport_${questionExam.id}_bailam_isIcr" value="${isIcr}">
                                                            <c:forEach var="icr" begin="0" end="${fn:length(questionLamport.result) - 1}" step="1">
                                                                <c:set var="i" value="${isIcr == 0 ? icr : fn:length(questionLamport.result)-1-icr}"/>
                                                                <tr>
                                                                    <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">P${i+1}</th>
                                                                        <c:forEach var="j" begin="0" end="${fn:length(questionLamport.result[i]) - 1}" step="+1">
                                                                        <td>
                                                                            <input autocomplete="off" style="min-width: 100px" class="form-control" type="text" name="questionLamport_${questionExam.id}_${i}_${j}" value="e${i + 1},${j}">
                                                                        </td>
                                                                    </c:forEach>                                       
                                                                </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>                        
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </c:when>

                                        <c:when test="${questionExam.nameAlgorithm == 'DongThuanPhanTan'}">
                                            <c:choose>
                                                <c:when test="${questionExam.type == 1}">
                                                    <c:set var="questionDongThuanPhanTan" value="${questionExam.question}"/>

                                                    <!-- Đề bài -->
                                                    <p>Điền giá trị của các bước thực hiện giải thuật đồng thuật phân tán cho các tiến trình sau:</p>
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
                                                    <p>Giả thiết tiến trình lỗi nhận được thông điệp từ các tiến trình không lỗi nhưng không gửi được thông điệp cho các tiến trình khác. Thứ tự giá trị được lưu trữ theo số thứ tự tiến trình tăng dần.</p>

                                                    <!-- Bài làm -->
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
                                                                            <input autocomplete="off" style="min-width: 100px" class="form-control" type="text" name="questionDongThuanPhanTan_${questionExam.id}_result_1_${i}">
                                                                        </td>
                                                                    </c:forEach>
                                                                </tr>

                                                                <tr>
                                                                    <th>Kết quả lần thứ hai</th>
                                                                        <c:forEach var="j" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                                                        <td>
                                                                            <c:forEach var="i" begin="0" end="${fn:length(questionDongThuanPhanTan.result_2) - 1}">
                                                                                <input autocomplete="off" style="min-width: 100px" class="form-control mb-${fn:length(questionDongThuanPhanTan.result_2) - 1 == i ? 0 : 2}" type="text" name="questionDongThuanPhanTan_${questionExam.id}_result_2_${i}_${j}">
                                                                            </c:forEach>
                                                                        </td>
                                                                    </c:forEach>
                                                                </tr>

                                                                <tr>
                                                                    <th>Kết quả cuối cùng</th>
                                                                        <c:forEach var="i" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                                                        <td>
                                                                            <input autocomplete="off" style="min-width: 100px" class="form-control" type="text" name="questionDongThuanPhanTan_${questionExam.id}_result_final_${i}">
                                                                        </td>
                                                                    </c:forEach>
                                                                </tr>
                                                            </tbody>
                                                        </table>                        
                                                    </div> 
                                                </c:when>
                                            </c:choose>
                                        </c:when>

                                        <c:when test="${questionExam.nameAlgorithm == 'Cristian'}">
                                            <c:choose>
                                                <c:when test="${questionExam.type == 1}">
                                                    <c:set var="questionCristian" value="${questionExam.question}"/>

                                                    <!-- Đề bài -->
                                                    <p>Máy khách thực hiện đồng bộ thời gian vật lý với máy chủ, thời gian gửi và nhận các thông điệp như sau:</p>
                                                    <div class="table-responsive">
                                                        <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                                            <thead style="background-color: #d30000" class="text-white align-middle">
                                                                <tr class="text-center align-middle text-nowrap">
                                                                    <th scope="col">Các mốc thời gian</th>
                                                                    <th scope="col">Giá trị</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody class="fw-bold align-middle text-black">
                                                                <tr>
                                                                    <td class="text-success">Thời gian máy khách gửi</td>
                                                                    <td class="text-center">${questionCristian.originateSendTimestamp}</td>
                                                                </tr>  

                                                                <tr>
                                                                    <td class="text-success">Thời gian máy chủ nhận</td>
                                                                    <td class="text-center">${questionCristian.receiveTimestamp}</td>
                                                                </tr>  

                                                                <tr>
                                                                    <td class="text-success">Thời gian máy chủ gửi</td>
                                                                    <td class="text-center">${questionCristian.transmitTimestamp}</td>
                                                                </tr>  

                                                                <tr>
                                                                    <td class="text-success">Thời gian máy khách nhận</td>
                                                                    <td class="text-center">${questionCristian.originateReceiveTime}</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>                        
                                                    </div>
                                                    <p>Tính thời gian máy khách ngay sau khi hoàn thành đồng bộ (Ghi theo định dạng yyyy-mm-dd hh:mi:ss.ms).</p>

                                                    <!-- Bài làm -->
                                                    <div class="table-responsive">
                                                        <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                                            <thead style="background-color: #d30000" class="text-white align-middle">
                                                                <tr class="text-center align-middle text-nowrap">
                                                                    <th scope="col">Điền câu trả lời</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody class="fw-bold align-middle text-black">
                                                                <tr>
                                                                    <td><input autocomplete="off" style="min-width: 100px" class="form-control" type="text" name="questionCristian_${questionExam.id}_dateTimeAfterSynchronize" placeholder="Ghi theo định dạng yyyy-mm-dd hh:mi:ss.ms"></td>
                                                                </tr>  
                                                            </tbody>
                                                        </table>                        
                                                    </div>                        
                                                </c:when>

                                                <c:when test="${questionExam.type == 2}">
                                                    <c:set var="questionCristianNtp" value="${questionExam.question}"/>

                                                    <!-- Đề bài -->
                                                    <p>Lập trình viên thực hiện đồng bộ thời gian máy tính với máy chủ NTP, hãy tính thời gian gửi, thời gian máy chủ nhận, thời gian máy chủ gửi, thời gian mới trên máy khách (thời gian địa phương, viết theo định dạng yyyy-mm-dd hh:mi:ss.ms) và độ lệch thời gian (tính bằng đơn vị tick) giữa máy khách và máy chủ nếu thời gian nhận được trên máy khách và bản tin NTP nhận được có giá trị như sau:</p>
                                                    <div class="table-responsive position-relative">
                                                        <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                                            <thead style="background-color: #d30000" class="text-white align-middle text-center">
                                                            <th style="background-color: #d30000" scope="col" class="position-sticky start-0">Byte</th>
                                                                <c:forEach var="i" begin="0" end="${fn:length(questionCristianNtp.ntpMesage)-1}">
                                                                    <c:if test="${i < 10}">
                                                                    <th scope="col">0${i}</th>
                                                                    </c:if>
                                                                    <c:if test="${i >= 10}">
                                                                    <th scope="col">${i}</th>
                                                                    </c:if>
                                                                </c:forEach>                                            
                                                            </thead>
                                                            <tbody class="fw-bold align-middle text-black">
                                                                <tr>
                                                                    <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">Giá trị</th>
                                                                        <c:forEach var="i" begin="0" end="${fn:length(questionCristianNtp.ntpMesage)-1}">
                                                                        <td>
                                                                            <c:if test="${questionCristianNtp.ntpMesage[i] < 10}">
                                                                                0${questionCristianNtp.ntpMesage[i]}
                                                                            </c:if>
                                                                            <c:if test="${questionCristianNtp.ntpMesage[i] >= 10}">
                                                                                ${questionCristianNtp.ntpMesage[i]}
                                                                            </c:if>                                                        
                                                                        </td>
                                                                    </c:forEach>                                       
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>

                                                    <!-- Bài làm -->
                                                    <div class="table-responsive mt-4">
                                                        <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                                            <thead style="background-color: #d30000" class="text-white align-middle">
                                                                <tr class="text-center align-middle text-nowrap">
                                                                    <th scope="col">Câu hỏi</th>
                                                                    <th scope="col">Thời gian</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody class="fw-bold align-middle text-black">
                                                                <tr>
                                                                    <td class="text-success">Thời gian máy khách gửi</td>
                                                                    <td><input autocomplete="off" style="min-width: 200px" class="form-control" type="text" name="questionCristianNtp_${questionExam.id}_originateSendTimestamp" class="text-danger"></td>
                                                                </tr>  

                                                                <tr>
                                                                    <td class="text-success">Thời gian máy chủ NTP nhận</td>
                                                                    <td><input autocomplete="off" style="min-width: 200px" class="form-control" type="text" name="questionCristianNtp_${questionExam.id}_receiveTimestamp" class="text-danger"></td>
                                                                </tr>  

                                                                <tr>
                                                                    <td class="text-success">Thời gian máy chủ NTP gửi</td>
                                                                    <td><input autocomplete="off" style="min-width: 200px" class="form-control" type="text" name="questionCristianNtp_${questionExam.id}_transmitTimestamp" class="text-danger"></td>
                                                                </tr>  

                                                                <tr>
                                                                    <td class="text-success">Thời gian mới cần thiết lập cho máy khách</td>
                                                                    <td><input autocomplete="off" style="min-width: 200px" class="form-control" type="text" name="questionCristianNtp_${questionExam.id}_dateTimeAfterSynchronize" class="text-danger"></td>
                                                                </tr>

                                                                <tr>
                                                                    <td class="text-success">Độ lệch thời gian giữa máy khách và máy chủ (tính bằng đơn vị Tick)</td>
                                                                    <td><input autocomplete="off" style="min-width: 200px" class="form-control" type="text" name="questionCristianNtp_${questionExam.id}_differentTicks" class="text-danger"></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>                        
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </c:when>

                                        <c:when test="${questionExam.nameAlgorithm == 'Berkeley'}">
                                            <c:choose>
                                                <c:when test="${questionExam.type == 1}">
                                                    <c:set var="questionBerkeley" value="${questionExam.question}"/>

                                                    <!-- Đề bài -->
                                                    <p>Sử dụng giải thuật Berkeley tính giá trị cần điều trình (mili giây) và thời gian sau khi đồng bộ (ghi theo định dạng yyyy-mm-dd hh:mi:ss:ms) cho ${fn:length(questionBerkeley.memberTimes)} tiến trình sau:</p>

                                                    <!-- Bài làm -->
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
                                                                            <input autocomplete="off" style="min-width: 100px" class="form-control" type="text" name="questionBerkeley_${questionExam.id}_calibratedRes_${statusMemberTimes.count}" class="text-danger" size="10">
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>

                                                                <tr class="text-center">
                                                                    <td colspan="2"class="text-success">Thời gian sau khi đồng bộ</td>
                                                                    <td colspan="2"><input autocomplete="off" style="min-width: 100px" class="form-control" type="text" name="questionBerkeley_${questionExam.id}_correctedDateTime" class="text-danger" size="10"></td>
                                                                </tr>  
                                                            </tbody>
                                                        </table>                        
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </c:when>

                                        <c:when test="${questionExam.nameAlgorithm == 'BauChonKhongDay'}">
                                            <c:choose>
                                                <c:when test="${questionExam.type == 1}">
                                                    <c:set var="questionBauChonKhongDay" value="${questionExam.question}"/>

                                                    <!-- Đề bài -->
                                                    <p>Cho ${questionBauChonKhongDay.so_tien_trinh} tiến trình trong mạng không dây, mỗi tiến trình thể hiện bằng cặp tên và giá trị tham gia bầu chọn của tiến trình đó kèm theo mỗi quan hệ cha con với các tiến trình khác như sau:</p>
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
                                                    <p>Điền các thông điệp bầu chọn theo dịnh dạng cặp tên tiến trình và giá trị bầu chọn phân cách bằng dấu phẩy (Ví dụ P5,10). Quy định: Hàng là tiến trình gửi, cột là tiến trình nhận. Giao của hàng và cột là cặp tên tiến trình và giá trị bầu chọn cách nhau bởi dấu phẩy.</p>

                                                    <!-- Bài làm -->
                                                    <div class="table-responsive position-relative">
                                                        <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                                            <thead style="background-color: #d30000" class="text-white align-middle text-center">
                                                            <th style="background-color: #d30000" scope="col" class="position-sticky start-0">Tiến trình</th>
                                                                <c:forEach var="i" begin="0" end="${questionBauChonKhongDay.so_tien_trinh-1}">
                                                                <th scope="col">P${i+1}</th>
                                                                </c:forEach>                                            
                                                            </thead>
                                                            <tbody class="fw-bold align-middle text-black">
                                                                <c:forEach var="i" begin="0" end="${questionBauChonKhongDay.so_tien_trinh-1}" step="1">
                                                                    <tr>
                                                                        <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">P${i+1}</th>
                                                                            <c:forEach var="j" begin="0" end="${questionBauChonKhongDay.so_tien_trinh-1}" step="1">
                                                                            <td>
                                                                                <input autocomplete="off" style="min-width: 100px" class="form-control" type="text" name="questionBauChonKhongDay_${questionExam.id}_dapAn_${i}_${j}" class="text-danger" size="10">
                                                                            </td>
                                                                        </c:forEach>                                       
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>                        
                                                    </div>
                                                </c:when>

                                                <c:when test="${questionExam.type == 2}">
                                                    <c:set var="questionBauChonKhongDay" value="${questionExam.question}"/>

                                                    <!-- Đề bài -->
                                                    <p>Cho ${questionBauChonKhongDay.so_tien_trinh} tiến trình trong mạng không dây, mỗi tiến trình thể hiện bằng cặp tên và giá trị tham gia bầu chọn của tiến trình đó kèm theo mỗi quan hệ cha con với các tiến trình khác như sau:</p>
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
                                                    <p>Khởi nguồn từ tiến trình P1. Điền các thông điệp bầu chọn theo dịnh dạng cặp tên tiến trình và giá trị bầu chọn phân cách bằng dấu phẩy (Ví dụ P5,10).</p>

                                                    <!-- Bài làm -->
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
                                                                                    <input autocomplete="off" style="min-width: 100px" class="form-control" type="text" name="questionBauChonKhongDay_${questionExam.id}_dapAn_${i}_${j}" class="text-danger" size="10">
                                                                                </td>
                                                                            </tr>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>                        
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </c:when>
                                    </c:choose>   
                                </div>
                            </c:forEach>
                        </form>
                    </c:if>
                    <!-- Examination bài làm end -->

                    <!-- Examination đáp án begin -->
                    <c:if test="${isSolved == true}">
                        <div class="d-flex justify-content-between position-sticky top-0 bg-white py-2" style="z-index: 100">
                            <div class="d-flex">
                                <p class="text-center fs-4 text-success fw-bold m-0">Điểm: ${totalScore}</p>
                            </div>

                            <div class="d-flex">
                                <p class="text-center fs-4 text-success fw-bold m-0">${time}</p>
                            </div>
                        </div>

                        <c:forEach var="i" begin="0" end="${fn:length(questionExams) - 1}" varStatus="status">
                            <c:set var="questionExam" value="${questionExams[i]}"/>
                            <div class="mb-5">
                                <h5 class="text-danger fw-bold mt-4">Câu ${status.count} (${questionExam.score} điểm):</h5>

                                <c:choose>
                                    <c:when test="${questionExam.nameAlgorithm == 'VectorTimestamp'}">
                                        <c:choose>
                                            <c:when test="${questionExam.type == 1}">
                                                <c:set var="questionVectorTimestamp" value="${questionExam.question}"/>

                                                <!-- Đề bài -->
                                                <div>
                                                    <p>Nhãn thời gian của mỗi tiến trình được đặt theo cấu trúc (P1,...,P${fn:length(questionVectorTimestamp.res)}). Các sự kiện trên mỗi tiến trình thể hiện như sau:</p>
                                                    <ul>
                                                        <li>eX,Y thể hiện sự kiện</li>
                                                        <li>X là số hiệu tiến trình</li>
                                                        <li>Y là số thứ tự sự kiện trong tiến trình</li>
                                                    </ul>
                                                    <p>Thông điệp giữa các tiến trình như sau:</p>
                                                    <ul>
                                                        <c:forEach var="listMesi" items="${questionVectorTimestamp.listMes}">
                                                            <li>${listMesi}</li>
                                                            </c:forEach>
                                                    </ul>
                                                    <p>Hãy điền nhãn thời gian vector cho các sự kiện của mỗi tiến trình (chú ý xóa tên sự kiện trước khi điền giá trị).</p>

                                                    <!-- Bài làm -->
                                                    <div class="table-responsive position-relative">
                                                        <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                                            <thead style="background-color: #d30000" class="text-white align-middle">
                                                                <tr class="text-center align-middle text-nowrap">
                                                                    <th style="background-color: #d30000" scope="col" class="position-sticky start-0">TT</th>
                                                                        <c:forEach var="i" begin="0" end="${fn:length(questionVectorTimestamp.res[0]) - 1}">
                                                                        <th scope="col">eX,${i}</th>
                                                                        </c:forEach>
                                                                </tr>
                                                            </thead>
                                                            <tbody class="fw-bold align-middle text-black text-center">
                                                                <c:set var="isIcr" value="questionVectorTimestamp_${questionExam.id}_isIcr"/>
                                                                <c:forEach var="icr" begin="0" end="${fn:length(questionVectorTimestamp.res) - 1}" step="1">
                                                                    <c:set var="i" value="${requestScope[isIcr] == 0 ? icr : fn:length(questionVectorTimestamp.res) - 1 - icr}"/>
                                                                    <tr>
                                                                        <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">P${i+1}</th>
                                                                            <c:forEach var="j" begin="0" end="${fn:length(questionVectorTimestamp.res[i]) - 1}" step="+1">
                                                                            <td>
                                                                                <c:if test="${j == 0}">
                                                                                    ${questionVectorTimestamp.res[i][j]}
                                                                                </c:if>

                                                                                <c:if test="${j != 0}">
                                                                                    <c:set var="ans" value="questionVectorTimestamp_${questionExam.id}_${i}_${j}"/>
                                                                                    ${requestScope[ans]}
                                                                                </c:if>
                                                                            </td>
                                                                        </c:forEach>                                       
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>                        
                                                    </div>

                                                    <!-- Đáp án --> 
                                                    <div class="d-flex justify-content-between mb-2 mt-4">
                                                        <h5 class="text-success mb-0">Đáp án</h5>
                                                        <c:set var="score" value="questionVectorTimestamp_${questionExam.id}_score"/>
                                                        <h5 class="text-success mb-0">Điểm: ${requestScope[score]}</h5>
                                                    </div>

                                                    <div class="table-responsive position-relative">
                                                        <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                                            <thead style="background-color: #d30000" class="text-white align-middle">
                                                                <tr class="text-center align-middle text-nowrap">
                                                                    <th style="background-color: #d30000" scope="col" class="position-sticky start-0">TT</th>
                                                                        <c:forEach var="i" begin="0" end="${fn:length(questionVectorTimestamp.res[0]) - 1}">
                                                                        <th scope="col">eX,${i}</th>
                                                                        </c:forEach>
                                                                </tr>
                                                            </thead>
                                                            <tbody class="fw-bold align-middle text-black text-center">
                                                                <c:set var="isIcr" value="questionVectorTimestamp_${questionExam.id}_isIcr"/>
                                                                <c:forEach var="icr" begin="0" end="${fn:length(questionVectorTimestamp.res) - 1}" step="1">
                                                                    <c:set var="i" value="${requestScope[isIcr] == 0 ? icr : fn:length(questionVectorTimestamp.res) - 1 - icr}"/>
                                                                    <tr>
                                                                        <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">P${i+1}</th>
                                                                            <c:forEach var="j" begin="0" end="${fn:length(questionVectorTimestamp.res[i]) - 1}" step="+1">
                                                                            <td>${questionVectorTimestamp.res[i][j]}</td>
                                                                        </c:forEach>                                       
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>                        
                                                    </div>   
                                                </div>
                                            </c:when>
                                        </c:choose>
                                    </c:when>

                                    <c:when test="${questionExam.nameAlgorithm == 'TrungBinh'}">
                                        <c:choose>
                                            <c:when test="${questionExam.type == 1}">
                                                <c:set var="questionTrungBinh" value="${questionExam.question}"/>

                                                <!-- Đề bài -->
                                                <p>Tại một thời điểm các tiến trình đồng loại gửi thời gian cho các tiến trình khác trong nhóm, giả thiết sau đó mỗi tiến trình đều nhận được thời gian của các tiến trình khác, hãy tính thời gian của mỗi tiến trình sau khi thực hiện giải thuật đồng bộ (ghi thời gian theo định dạng yyyy-mm-dd hh:mi:ss:ms).</p>

                                                <!-- Bài làm và đáp án -->
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
                                                                    <c:set var="correctedMsÁns" value="questionTrungBinh_${questionExam.id}_correctedMs_${statusMemberTimes.count}"/>
                                                                    <td>${requestScope[correctedMsÁns]}</td>                                    
                                                                    <td>${questionTrungBinh.correctedMs[statusMemberTimes.count-1]}</td>
                                                                </tr>
                                                            </c:forEach>

                                                            <c:set var="score" value="questionTrungBinh_${questionExam.id}_score"/>
                                                            <tr>
                                                                <td colspan="4" class="text-success fw-normal"><h5 class="mb-0">Điểm: ${requestScope[score]}</h5></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>                        
                                                </div>  
                                            </c:when>                                        
                                        </c:choose>
                                    </c:when>

                                    <c:when test="${questionExam.nameAlgorithm == 'Schlosser'}">
                                        <c:choose>
                                            <c:when test="${questionExam.type == 1}">
                                                <c:set var="questionSchlosser" value="${questionExam.question}"/>

                                                <!-- Đề bài -->
                                                <p>Có ${questionSchlosser.soNut} nút mạng được thiết kế theo phương pháp Schlosser, định danh của các nút thể hiện trên các hàng và các cột tiêu đề, hãy điền giá trị của các cạnh đến mỗi nút láng giềng của mình. Biết rằng số lượng láng giềng cho mỗi nút: ${questionSchlosser.so_lang_gieng}.</p>

                                                <!-- Bài làm -->
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
                                                                            <c:set var="ans" value="questionSchlosser_${questionExam.id}_${i}_${j}"/>
                                                                        <td>${requestScope[ans]}</td>
                                                                    </c:forEach>                                       
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>                        
                                                </div>

                                                <!-- Đáp án --> 
                                                <div class="d-flex justify-content-between mb-2 mt-4">
                                                    <h5 class="text-success mb-0 me-1">Đáp án</h5>
                                                    <c:set var="score" value="questionSchlosser_${questionExam.id}_score"/>
                                                    <h5 class="text-success mb-0">Điểm: ${requestScope[score]}</h5>
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
                                            </c:when>
                                        </c:choose>
                                    </c:when>

                                    <c:when test="${questionExam.nameAlgorithm == 'Rbs'}">
                                        <c:choose>
                                            <c:when test="${questionExam.type == 1}">
                                                <c:set var="questionForRbs" value="${questionExam.question}"/>

                                                <!-- Đề bài -->
                                                <p>Tiến trình P thực hiện ${fn:length(questionForRbs.diffPQ)} lần gửi tín hiệu đồng bộ thời gian vật lý đến tiến trình Q như bảng dưới đây. Tính độ lệch thời gian tính bằng đơn vị Tick giữa P và Q.</p>

                                                <!-- Bài làm và đáp án -->
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
                                                                    <c:set var="ans" value="questionForRbs_${questionExam.id}_diffPQ_${i}"/>
                                                                    <td>${requestScope[ans]}</td>
                                                                    <td>${questionForRbs.diffPQ[i]}</td>
                                                                </tr>
                                                            </c:forEach>

                                                            <c:set var="score" value="questionForRbs_${questionExam.id}_score"/>
                                                            <tr>
                                                                <td colspan="4" class="text-success"><h5 class="mb-0">Điểm: ${requestScope[score]}</h5></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>                        
                                                </div>   
                                            </c:when>
                                        </c:choose>
                                    </c:when>

                                    <c:when test="${questionExam.nameAlgorithm == 'Lamport'}">
                                        <c:choose>
                                            <c:when test="${questionExam.type == 1}">
                                                <c:set var="questionLamport" value="${questionExam.question}"/>

                                                <!-- Đề bài -->
                                                <p>Có ${fn:length(questionLamport.deBai)} tiến trình P1, ..., P${fn:length(questionLamport.deBai)}, mỗi tiến trình đều có bộ đếm thời gian riêng nhưng nhịp đếm không giống nhau. Mỗi tiến trình Pi có bộ đếm Ci để đánh dấu thời điểm xảy tra các sự kiện trong tiến trình, sự kiện ở đây có thể là nội tại trong tiến trình hoặc gửi thông điệp cho tiến trình khác. Các sự kiện trên mỗi tiến trình thể hiện như sau:</p>
                                                <ul>
                                                    <li>eX,Y thể hiện sự kiện</li>
                                                    <li>X là số hiệu tiến trình</li>
                                                    <li>Y là số thứ tự sự kiện trong tiến trình</li>
                                                </ul>
                                                <p>Bộ đếm thời gian của mỗi tiến trình và thông điệp giữa các tiến trình như sau:</p>
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
                                                                            <c:set var="debai_isIcr" value="questionLamport_${questionExam.id}_debai_isIcr"/>
                                                                            <c:forEach var="icr" begin="0" end="${fn:length(questionLamport.deBai) - 1}" step="1">
                                                                                <c:set var="i" value="${requestScope[debai_isIcr] == 0 ? icr : fn:length(questionLamport.deBai)-1-icr}"/>
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

                                                <!-- Bài làm -->
                                                <p>Hãy điền nhãn thời gian lamport cho các sự kiện của mỗi tiến trình (chú ý xóa tên sự kiện trước khi điền giá trị).</p>
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
                                                            <c:set var="bailam_isIcr" value="questionLamport_${questionExam.id}_bailam_isIcr"/>
                                                            <c:forEach var="icr" begin="0" end="${fn:length(questionLamport.result) - 1}" step="1">
                                                                <c:set var="i" value="${requestScope[bailam_isIcr] == 0 ? icr : fn:length(questionLamport.result) - 1 - icr}"/>
                                                                <tr>
                                                                    <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">P${i+1}</th>
                                                                        <c:forEach var="j" begin="0" end="${fn:length(questionLamport.result[i]) - 1}" step="+1">
                                                                            <c:set var="ans" value="questionLamport_${questionExam.id}_${i}_${j}"/>
                                                                        <td>${requestScope[ans]}</td>
                                                                    </c:forEach>                                       
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>                        
                                                </div>

                                                <!-- Đáp án -->
                                                <div class="d-flex justify-content-between mb-2 mt-4">
                                                    <h5 class="text-success mb-0">Đáp án</h5>
                                                    <c:set var="score" value="questionLamport_${questionExam.id}_score"/>
                                                    <h5 class="text-success mb-0">Điểm: ${requestScope[score]}</h5>
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
                                                            <c:set var="bailam_isIcr" value="questionLamport_${questionExam.id}_bailam_isIcr"/>
                                                            <c:forEach var="icr" begin="0" end="${fn:length(questionLamport.result) - 1}" step="1">
                                                                <c:set var="i" value="${requestScope[bailam_isIcr] == 0 ? icr : fn:length(questionLamport.result) - 1 - icr}"/>
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
                                            </c:when>
                                        </c:choose>
                                    </c:when>

                                    <c:when test="${questionExam.nameAlgorithm == 'DongThuanPhanTan'}">
                                        <c:choose>
                                            <c:when test="${questionExam.type == 1}">
                                                <c:set var="questionDongThuanPhanTan" value="${questionExam.question}"/>

                                                <!-- Đề bài -->
                                                <p>Điền giá trị của các bước thực hiện giải thuật đồng thuật phân tán cho các tiến trình sau:</p>
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
                                                <p>Giả thiết tiến trình lỗi nhận được thông điệp từ các tiến trình không lỗi nhưng không gửi được thông điệp cho các tiến trình khác. Thứ tự giá trị được lưu trữ theo số thứ tự tiến trình tăng dần.</p>

                                                <!-- Bài làm -->
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
                                                                        <c:set var="ans_result_1" value="questionDongThuanPhanTan_${questionExam.id}_result_1_${i}"/>
                                                                    <td class="text-center">${requestScope[ans_result_1]}</td>
                                                                </c:forEach>
                                                            </tr>

                                                            <tr>
                                                                <th>Kết quả lần thứ hai</th>
                                                                    <c:forEach var="j" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                                                    <td class="text-center">
                                                                        <c:forEach var="i" begin="0" end="${fn:length(questionDongThuanPhanTan.result_2) - 1}">
                                                                            <c:set var="ans_result_2" value="questionDongThuanPhanTan_${questionExam.id}_result_2_${i}_${j}"/>
                                                                            <div class="mb-${fn:length(questionDongThuanPhanTan.result_2) - 1 == i ? 0 : 2}">
                                                                                ${requestScope[ans_result_2]}
                                                                            </div>
                                                                        </c:forEach>
                                                                    </td>
                                                                </c:forEach>
                                                            </tr>

                                                            <tr>
                                                                <th>Kết quả cuối cùng</th>
                                                                    <c:forEach var="i" begin="0" end="${questionDongThuanPhanTan.soTienTrinh - 1}">
                                                                        <c:set var="ans_result_final" value="questionDongThuanPhanTan_${questionExam.id}_result_final_${i}"/>
                                                                    <td class="text-center">${requestScope[ans_result_final]}</td>
                                                                </c:forEach>
                                                            </tr>
                                                        </tbody>
                                                    </table>                        
                                                </div> 

                                                <!-- Đáp án -->
                                                <div class="d-flex justify-content-between mb-2 mt-4">
                                                    <h5 class="text-success mb-0">Đáp án</h5>
                                                    <c:set var="score" value="questionDongThuanPhanTan_${questionExam.id}_score"/>
                                                    <h5 class="text-success mb-0">Điểm: ${requestScope[score]}</h5>
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
                                            </c:when>
                                        </c:choose>
                                    </c:when>

                                    <c:when test="${questionExam.nameAlgorithm == 'Cristian'}">
                                        <c:choose>
                                            <c:when test="${questionExam.type == 1}">
                                                <c:set var="questionCristian" value="${questionExam.question}"/>

                                                <!-- Đề bài -->
                                                <p>Máy khách thực hiện đồng bộ thời gian vật lý với máy chủ, thời gian gửi và nhận các thông điệp như sau:</p>
                                                <div class="table-responsive">
                                                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                                        <thead style="background-color: #d30000" class="text-white align-middle">
                                                            <tr class="text-center align-middle text-nowrap">
                                                                <th scope="col">Các mốc thời gian</th>
                                                                <th scope="col">Giá trị</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody class="fw-bold align-middle text-black">
                                                            <tr>
                                                                <td class="text-success">Thời gian máy khách gửi</td>
                                                                <td class="text-center">${questionCristian.originateSendTimestamp}</td>
                                                            </tr>  

                                                            <tr>
                                                                <td class="text-success">Thời gian máy chủ nhận</td>
                                                                <td class="text-center">${questionCristian.receiveTimestamp}</td>
                                                            </tr>  

                                                            <tr>
                                                                <td class="text-success">Thời gian máy chủ gửi</td>
                                                                <td class="text-center">${questionCristian.transmitTimestamp}</td>
                                                            </tr>  

                                                            <tr>
                                                                <td class="text-success">Thời gian máy khách nhận</td>
                                                                <td class="text-center">${questionCristian.originateReceiveTime}</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>                        
                                                </div>
                                                <p>Tính thời gian máy khách ngay sau khi hoàn thành đồng bộ (Ghi theo định dạng yyyy-mm-dd hh:mi:ss.ms).</p>

                                                <!-- Bài làm và kết quả -->
                                                <div class="table-responsive">
                                                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                                        <thead style="background-color: #d30000" class="text-white align-middle">
                                                            <tr class="text-center align-middle text-nowrap">
                                                                <th scope="col">Câu trả lời</th>
                                                                <th scope="col">Đáp án</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody class="fw-bold align-middle text-black">
                                                            <tr>
                                                                <c:set var="dateTimeAfterSynchronize" value="questionCristian_${questionExam.id}_dateTimeAfterSynchronize"/>
                                                                <td class="text-center">${requestScope[dateTimeAfterSynchronize]}</td>
                                                                <td class="text-center">${questionCristian.dateTimeAfterSynchronize}</td>
                                                            </tr> 

                                                            <c:set var="score" value="questionCristian_${questionExam.id}_score"/>
                                                            <tr>
                                                                <td colspan="2" class="text-success fs-6"><h5 class="mb-0">Điểm: ${requestScope[score]}</h5></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>                        
                                                </div>                        
                                            </c:when>

                                            <c:when test="${questionExam.type == 2}">
                                                <c:set var="questionCristianNtp" value="${questionExam.question}"/>

                                                <!-- Đề bài -->
                                                <p>Lập trình viên thực hiện đồng bộ thời gian máy tính với máy chủ NTP, hãy tính thời gian gửi, thời gian máy chủ nhận, thời gian máy chủ gửi, thời gian mới trên máy khách (thời gian địa phương, viết theo định dạng yyyy-mm-dd hh:mi:ss.ms) và độ lệch thời gian (tính bằng đơn vị tick) giữa máy khách và máy chủ nếu thời gian nhận được trên máy khách và bản tin NTP nhận được có giá trị như sau:</p>
                                                <div class="table-responsive position-relative">
                                                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                                        <thead style="background-color: #d30000" class="text-white align-middle text-center">
                                                        <th style="background-color: #d30000" scope="col" class="position-sticky start-0">Byte</th>
                                                            <c:forEach var="i" begin="0" end="${fn:length(questionCristianNtp.ntpMesage)-1}">
                                                                <c:if test="${i < 10}">
                                                                <th scope="col">0${i}</th>
                                                                </c:if>
                                                                <c:if test="${i >= 10}">
                                                                <th scope="col">${i}</th>
                                                                </c:if>
                                                            </c:forEach>                                            
                                                        </thead>
                                                        <tbody class="fw-bold align-middle text-black">
                                                            <tr>
                                                                <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">Giá trị</th>
                                                                    <c:forEach var="i" begin="0" end="${fn:length(questionCristianNtp.ntpMesage)-1}">
                                                                    <td>
                                                                        <c:if test="${questionCristianNtp.ntpMesage[i] < 10}">
                                                                            0${questionCristianNtp.ntpMesage[i]}
                                                                        </c:if>
                                                                        <c:if test="${questionCristianNtp.ntpMesage[i] >= 10}">
                                                                            ${questionCristianNtp.ntpMesage[i]}
                                                                        </c:if>                                                        
                                                                    </td>
                                                                </c:forEach>                                       
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <p>Thời gian nhận được bản ghi: ${questionCristianNtp.originateReceiveTime}</p>

                                                <!-- Bài làm và kết quả -->
                                                <div class="table-responsive">
                                                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                                        <thead style="background-color: #d30000" class="text-white align-middle">
                                                            <tr class="text-center align-middle text-nowrap">
                                                                <th scope="col">Câu hỏi</th>
                                                                <th scope="col">Thời gian</th>
                                                                <th scope="col">Đáp án</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody class="fw-bold align-middle text-black">
                                                            <tr>
                                                                <td class="text-success">Thời gian máy khách gửi</td>
                                                                <c:set var="originateSendTimestamp" value="questionCristianNtp_${questionExam.id}_originateSendTimestamp"/>
                                                                <td class="text-center">${requestScope[originateSendTimestamp]}</td>
                                                                <td class="text-center">${questionCristianNtp.originateSendTimestamp}</td>
                                                            </tr>  

                                                            <tr>
                                                                <td class="text-success">Thời gian máy chủ NTP nhận</td>
                                                                <c:set var="receiveTimestamp" value="questionCristianNtp_${questionExam.id}_receiveTimestamp"/>
                                                                <td class="text-center">${requestScope[receiveTimestamp]}</td>
                                                                <td class="text-center">${questionCristianNtp.receiveTimestamp}</td>
                                                            </tr>  

                                                            <tr>
                                                                <td class="text-success">Thời gian máy chủ NTP gửi</td>
                                                                <c:set var="transmitTimestamp" value="questionCristianNtp_${questionExam.id}_transmitTimestamp"/>
                                                                <td class="text-center">${requestScope[transmitTimestamp]}</td>
                                                                <td class="text-center">${questionCristianNtp.transmitTimestamp}</td>
                                                            </tr>  

                                                            <tr>
                                                                <td class="text-success">Thời gian mới cần thiết lập cho máy khách</td>
                                                                <c:set var="dateTimeAfterSynchronize" value="questionCristianNtp_${questionExam.id}_dateTimeAfterSynchronize"/>
                                                                <td class="text-center">${requestScope[dateTimeAfterSynchronize]}</td>
                                                                <td class="text-center">${questionCristianNtp.dateTimeAfterSynchronize}</td>
                                                            </tr>

                                                            <tr>
                                                                <td class="text-success">Độ lệch thời gian giữa máy khách và máy chủ (tính bằng đơn vị Tick)</td>
                                                                <c:set var="differentTicks" value="questionCristianNtp_${questionExam.id}_differentTicks"/>
                                                                <td class="text-center">${requestScope[differentTicks]}</td>
                                                                <td class="text-center">${questionCristianNtp.differentTicks}</td>
                                                            </tr>

                                                            <c:set var="score" value="questionCristianNtp_${questionExam.id}_score"/>
                                                            <tr>
                                                                <td colspan="3" class="text-success fs-6"><h5 class="mb-0">Điểm: ${requestScope[score]}</h5></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>                        
                                                </div>       
                                            </c:when>
                                        </c:choose>
                                    </c:when>

                                    <c:when test="${questionExam.nameAlgorithm == 'Berkeley'}">
                                        <c:choose>
                                            <c:when test="${questionExam.type == 1}">
                                                <c:set var="questionBerkeley" value="${questionExam.question}"/>

                                                <!-- Đề bài -->
                                                <p>Sử dụng giải thuật Berkeley tính giá trị cần điều trình (mili giây) và thời gian sau khi đồng bộ (ghi theo định dạng yyyy-mm-dd hh:mi:ss:ms) cho ${fn:length(questionBerkeley.memberTimes)} tiến trình sau:</p>

                                                <!-- Bài làm và đáp án -->
                                                <div class="table-responsive">
                                                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                                        <thead style="background-color: #d30000" class="text-white align-middle">
                                                            <tr class="text-center align-middle text-nowrap">
                                                                <th scope="col">Tiến trình</th>
                                                                <th scope="col">Loại</th>
                                                                <th scope="col">Thời gian trước khi đồng bộ</th>
                                                                <th scope="col">Giá trị điều chỉnh</th>
                                                                <th scope="col">Đáp án</th>
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

                                                                    <c:set var="calibratedAns" value="questionBerkeley_${questionExam.id}_calibratedRes_${statusMemberTimes.count}"/>
                                                                    <td>${requestScope[calibratedAns]}</td>

                                                                    <td>${questionBerkeley.calibratedRes[statusMemberTimes.count-1]}</td>
                                                                </tr>
                                                            </c:forEach>

                                                            <tr class="text-center">
                                                                <td colspan="2" class="text-danger">Thời gian sau khi đồng bộ</td>
                                                                <c:set var="correctedDateTimeAns" value="questionBerkeley_${questionExam.id}_correctedDateTime"/>
                                                                <td colspan="2" class="text-success">${requestScope[correctedDateTimeAns]}</td>
                                                                <td class="text-success">${questionBerkeley.correctedDateTime}</td>
                                                            </tr> 

                                                            <c:set var="score" value="questionBerkeley_${questionExam.id}_score"/>
                                                            <tr>
                                                                <td colspan="5" class="text-success fs-6"><h5 class="mb-0">Điểm: ${requestScope[score]}</h5></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>                        
                                                </div>   
                                            </c:when>
                                        </c:choose>
                                    </c:when>

                                    <c:when test="${questionExam.nameAlgorithm == 'BauChonKhongDay'}">
                                        <c:choose>
                                            <c:when test="${questionExam.type == 1}">
                                                <c:set var="questionBauChonKhongDay" value="${questionExam.question}"/>

                                                <!-- Đề bài -->
                                                <p>Cho ${questionBauChonKhongDay.so_tien_trinh} tiến trình trong mạng không dây, mỗi tiến trình thể hiện bằng cặp tên và giá trị tham gia bầu chọn của tiến trình đó kèm theo mỗi quan hệ cha con với các tiến trình khác như sau:</p>
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
                                                <p>Điền các thông điệp bầu chọn theo dịnh dạng cặp tên tiến trình và giá trị bầu chọn phân cách bằng dấu phẩy (Ví dụ P5,10). Quy định: Hàng là tiến trình gửi, cột là tiến trình nhận. Giao của hàng và cột là cặp tên tiến trình và giá trị bầu chọn cách nhau bởi dấu phẩy.</p>

                                                <!-- Bài làm -->
                                                <div class="table-responsive position-relative">
                                                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                                        <thead style="background-color: #d30000" class="text-white align-middle text-center">
                                                        <th style="background-color: #d30000" scope="col" class="position-sticky start-0">Tiến trình</th>
                                                            <c:forEach var="i" begin="0" end="${questionBauChonKhongDay.so_tien_trinh-1}">
                                                            <th scope="col">P${i+1}</th>
                                                            </c:forEach>                                            
                                                        </thead>
                                                        <tbody class="fw-bold align-middle text-black text-center">
                                                        <tbody class="fw-bold align-middle text-black">
                                                            <c:forEach var="i" begin="0" end="${questionBauChonKhongDay.so_tien_trinh-1}" step="1">
                                                                <tr class="text-center">
                                                                    <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">P${i+1}</th>
                                                                        <c:forEach var="j" begin="0" end="${questionBauChonKhongDay.so_tien_trinh-1}" step="1">
                                                                            <c:set var="danAnAns" value="questionBauChonKhongDay_${questionExam.id}_dapAn_${i}_${j}"/>
                                                                        <td>${requestScope[danAnAns]}</td>
                                                                    </c:forEach>                                       
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                        </tbody>
                                                    </table>                        
                                                </div>

                                                <!-- Đáp án -->
                                                <div class="d-flex justify-content-between mt-4 mb-2">
                                                    <h5 class="text-success mb-0">Đáp án</h5>
                                                    <c:set var="score" value="questionBauChonKhongDay_${questionExam.id}_score"/>
                                                    <h5 class="text-success mb-0">Điểm: ${requestScope[score]}</h5>
                                                </div>

                                                <div class="table-responsive position-relative">
                                                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                                                        <thead style="background-color: #d30000" class="text-white align-middle text-center">
                                                        <th style="background-color: #d30000" scope="col" class="position-sticky start-0">
                                                            Nhận <br/>
                                                            <i class="fa-solid fa-arrow-right-long"></i> <br/>
                                                            Gửi <br/>
                                                            <i class="fa-solid fa-arrow-down-long"></i>
                                                        </th>
                                                        <c:forEach var="i" begin="0" end="${questionBauChonKhongDay.so_tien_trinh-1}">
                                                            <th scope="col">P${i+1}</th>
                                                            </c:forEach>                                            
                                                        </thead>
                                                        <tbody class="fw-bold align-middle text-black">
                                                            <c:forEach var="i" begin="0" end="${questionBauChonKhongDay.so_tien_trinh-1}" step="1">
                                                                <tr>
                                                                    <th style="background-color: #d30000" class="text-white text-center position-sticky start-0">P${i+1}</th>
                                                                        <c:forEach var="j" begin="0" end="${questionBauChonKhongDay.so_tien_trinh-1}" step="1">
                                                                            <c:if test="${fn:contains(questionBauChonKhongDay.dapAn[i][j], '(được chọn)')}">
                                                                                <c:set var = "dapAn" value = "${fn:replace(questionBauChonKhongDay.dapAn[i][j], '(được chọn)', '<br/>(được chọn)')}" />
                                                                            <td class="text-center bg-warning">
                                                                                ${dapAn}
                                                                            </td>                                        
                                                                        </c:if>
                                                                        <c:if test="${!fn:contains(questionBauChonKhongDay.dapAn[i][j], '(được chọn)')}">
                                                                            <td class="text-center">
                                                                                ${questionBauChonKhongDay.dapAn[i][j]}
                                                                            </td>                                        
                                                                        </c:if>
                                                                    </c:forEach>                                       
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>                        
                                                </div>   
                                            </c:when>

                                            <c:when test="${questionExam.type == 2}">
                                                <c:set var="questionBauChonKhongDay" value="${questionExam.question}"/>

                                                <!-- Đề bài -->
                                                <p>Cho ${questionBauChonKhongDay.so_tien_trinh} tiến trình trong mạng không dây, mỗi tiến trình thể hiện bằng cặp tên và giá trị tham gia bầu chọn của tiến trình đó kèm theo mỗi quan hệ cha con với các tiến trình khác như sau:</p>
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
                                                <p>Khởi nguồn từ tiến trình P1. Điền các thông điệp bầu chọn theo dịnh dạng cặp tên tiến trình và giá trị bầu chọn phân cách bằng dấu phẩy (Ví dụ P5,10).</p>

                                                <!-- Bài làm và đáp án -->
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
                                                                                <c:set var="danAnAns" value="questionBauChonKhongDay_${questionExam.id}_dapAn_${i}_${j}"/>
                                                                            <td class="text-center">${requestScope[danAnAns]}</td>
                                                                            <td class="text-center">${fn:replace(questionBauChonKhongDay.dapAn[i][j], ' (được chọn)', '')}</td>
                                                                        </tr>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:forEach>

                                                            <c:set var="score" value="questionBauChonKhongDay_${questionExam.id}_score"/>
                                                            <tr>
                                                                <td colspan="3" class="text-success fs-6"><h5 class="mb-0">Điểm: ${requestScope[score]}</h5></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>                        
                                                </div>
                                            </c:when>
                                        </c:choose>
                                    </c:when>
                                </c:choose>   
                            </div>                    
                        </c:forEach>    
                    </c:if>
                    <!-- Examination đáp án end -->
                </c:when>

                <c:otherwise>
                    <div id="notify-error" class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <p>Có lỗi xảy ra. Không thể tạo được bài kiểm tra. Hãy thử lại.</p>
                                </div>
                                <div class="modal-footer">
                                    <button onclick="location.reload();" type="button" class="btn btn-primary" data-bs-dismiss="modal">Thử lại</button>
                                </div>
                            </div>
                        </div>
                    </div>                 
                </c:otherwise>
            </c:choose>
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

        <!-- Footer begin -->
        <jsp:include page="./includes/html-body-end.jsp" />
        <!-- Footer end -->

        <script>
            $(document).ready(function () {
            <c:choose>
                <c:when test="${questionExams != null}">
                // Trong trường hợp các câu hỏi không null
                let x;
                let notify = new bootstrap.Modal(document.getElementById('notify'));

                clearInterval(x);

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

                    // Output the result in an element
                    let text = "";
                    text += (hours < 10 ? "0" + hours : hours) + ":";
                    text += (minutes < 10 ? "0" + minutes : minutes) + ":";
                    text += (seconds < 10 ? "0" + seconds : seconds);

                    <c:if test="${isSolved == false}">
                        $('#time').text(text);
                        $('input[name="time"]').val(text);

                        if (countSeconds === max)
                            notify.show();
                    </c:if>
                }, 1000);
                </c:when>
                <c:otherwise>
                // Trong trường hợp các câu hỏi null
                let notify_error = new bootstrap.Modal(document.getElementById('notify-error'));
                notify_error.show();
                </c:otherwise>
            </c:choose>
            });
        </script>
    </body>
</html>