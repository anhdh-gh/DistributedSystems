<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

            <div class="d-flex justify-content-center">
                <h4 class="fw-bold my-4 pb-3 border-4 border-bottom border-danger d-inline-block">Berkeley</h4>
            </div>

            <!-- Berkeley de bai begin -->
            <div>
                <h5 class="text-danger mt-4">1. Đề bài:</h5>
                <p style="text-align: justify;">
                    Viết ứng dụng dạng Console Application bằng ngôn ngữ C#. Sử dụng dịch vụ web <a target="_blank" href="<c:url value='${request.contextPath}/ExamForBerkeley?wsdl'/>"><script>document.write(window.location.origin.replace("https://", "http://"));</script>${pageContext.request.contextPath}/ExamForBerkeley?wsdl</a>
                    gọi hàm GetInputData để lấy giá trị các tham số thời gian, tính toán cần điều chỉnh cho mỗi tiến trình (đơn vị ms) và thời gian sau khi đồng bộ ghi theo định dạng yyyy-mm-dd hh:mi:ss.ms, gọi hàm Submit để cập nhật kết quả tính toán lên máy chủ. Nén mã nguồn của chương trình học viên đã viến (chỉ cần tập tin Program.cs) và tải tập tin nén (.zip) lên máy chủ khi nộp bài.
                </p>
                <p>
                    Các tham số gọi hàm trong dịch vụ web: ExamId = 1, QuestionId = 
                    <c:if test="${fn:length(questionBerkeleys) == 1}">
                        ${questionBerkeley.questionId}.
                    </c:if>
                    <c:if test="${fn:length(questionBerkeleys) > 1}">
                        [<c:forEach var="questionBerkeley" items="${questionBerkeleys}" varStatus="status">
                            ${questionBerkeley.questionId}
                            <c:if test="${status.count < fn:length(questionBerkeleys)}">, </c:if>
                        </c:forEach>].                        
                    </c:if>
                </p>
                <p class="mt-3 mb-2 fw-bold">Thời gian làm bài: ${requestScope.timeForTest} phút.</p>
                <p id="time" class="mt-2 fs-4 text-success"></p>
                <button id="time-control" class="btn btn-success" onclick="countTime()">Start</button>                
            </div>
            <!-- Berkeley de bai end -->

            <!-- Berkeley list question begin -->
            <h5 class="text-danger mt-5">2. Đáp án:</h5>
            <div class="mt-2">
                <c:forEach var="questionBerkeley" items="${questionBerkeleys}">
                    <p class="text-success" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#dapan-${questionBerkeley.questionId}" aria-expanded="false" aria-controls="collapseExample">
                        <i class="fa-solid fa-circle-dot"></i> QUESTION-ID: ${questionBerkeley.questionId}
                    </p>         

                    <div class="mt-3 table-responsive collapse" id="dapan-${questionBerkeley.questionId}">
                        <table class="table table-warning table-hover border border-danger table-bordered align-middle w-100">
                            <thead class="align-middle text-danger">
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
                </c:forEach>            
            </div>
            <!-- Berkeley list question end -->

            <!-- Huong dan lam bai begin -->
            <h5 class="text-danger mt-4">3. Hướng dẫn:</h5>
            <p class="mt-3 mb-2 fw-bold text-success" data-bs-toggle="collapse" data-bs-target="#code-mau" aria-expanded="false" style="cursor: pointer">Code mẫu</p>
            <div class="collapse" id="code-mau">
                <div class="card card-body">
                    <code class="text-black" style="font-family: Consolas; color: crimson; background-color: #f1f1f1; padding: 2px; font-size: 105%;"><pre>
    static void Main(string[] args)
    {
        string fomat = "yyyy-MM-dd HH:mm:ss.fff";

        ExamForBerkeley exam = new ExamForBerkeley();
        string[] memberTimes;
        string res = exam.getInputData("anonymous", "anonymous", 1, 5, out memberTimes);

        Console.WriteLine(res);
        long length = memberTimes.Length;

        DateTime[] times = new DateTime[length];
        long sum = 0;
        for(int i = 0; i < length; i++)
        {
            Console.WriteLine(i + " - " + memberTimes[i]);
            times[i] = DateTime.Parse(memberTimes[i]);
            sum += (times[i].Ticks - times[0].Ticks) / 10000;
        }

        long tb = (long)Math.Round((double) sum/length, 0, MidpointRounding.AwayFromZero);

        DateTime final = times[0].AddMilliseconds(tb);
        Console.WriteLine(final.ToString(fomat));

        int[] calibrateMs = new int[length];

        for(int i = 0; i < calibrateMs.Length; i++)
        {
            calibrateMs[i] = (int) (final.Ticks - times[i].Ticks) / 10000;
            Console.WriteLine(calibrateMs[i]);
        }

        res = exam.submit("anonymous", "anonymous", 1, 5, calibrateMs, final.ToString(fomat));
        Console.WriteLine(res);

        Console.ReadKey();
    }</pre></code>                
                </div>
            </div>
            <!-- Huong dan lam bai end --> 
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
            // Set cho height ở cột đề bài và cột đáp án bằng nhau


            let x;
            let notify = new bootstrap.Modal(document.getElementById('notify'));

            function countTime() {

                if ($('#time-control').text() === 'Stop') {
                    clearInterval(x);
                    $('#time-control').text("Start");
                } else if ($('#time-control').text() === 'Start') {
                    $('#time-control').text("Stop");

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

                        $('#time').text(text);

                        if (countSeconds === max)
                            notify.show();
                    }, 1000);
                }
            }
        </script>
    </body>
</html>
