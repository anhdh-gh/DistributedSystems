<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>RBS</title>
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
                <h4 class="fw-bold my-4 pb-3 border-4 border-bottom border-danger d-inline-block">Rbs</h4>
            </div>

            <!-- Rbs de bai begin -->
            <div>
                <h5 class="text-danger mt-4">1. Đề bài:</h5>
                <p style="text-align: justify;">
                    Tiến trình P thực hiện M lần gửi tín hiệu đồng bộ thời gian vật lý đến tiến trình Q. 
                    Viết ứng dụng dạng Console Application bằng ngôn ngữ C#, sử dụng dịch vụ web 
                    <a target="_blank" href="<c:url value='${request.contextPath}/ExamForRbs?wsdl'/>"><script>document.write(window.location.origin.replace("https://", "http://"));</script>${pageContext.request.contextPath}/ExamForRbs?wsdl</a> 
                    gọi hàm GetInputData để 
                    lấy giá trị thời gian của các tiến trình. Tính độ lệch thời gian tính bằng đơn 
                    vị Tick giữa P và Q sau đó gọi hàm Submit để cập nhật kết quả tính toán lên máy chủ. 
                    Nén mã nguồn của chương trình học viên đã viết (chỉ cần tập tin Program.cs) và tải tập 
                    tin nén (.zip) lên máy chủ khi nộp bài.
                </p>
                <p>
                    Các tham số gọi hàm trong dịch vụ web: ExamId = 1, QuestionId = 
                    <c:if test="${fn:length(questionForRbses) == 1}">
                        ${questionForRbses[0].questionId}.
                    </c:if>
                    <c:if test="${fn:length(questionForRbses) > 1}">
                        [<c:forEach var="questionForRbs" items="${questionForRbses}" varStatus="status">
                            ${questionForRbs.questionId}
                            <c:if test="${status.count < fn:length(questionForRbses)}">, </c:if>
                        </c:forEach>].                        
                    </c:if>  
                </p>
                <p class="mt-3 mb-2 fw-bold">Thời gian làm bài: ${requestScope.timeForTest} phút.</p>
                <p id="time" class="mt-2 fs-4 text-success"></p>
                <button id="time-control" class="btn btn-success" onclick="countTime()">Start</button>                 
            </div>
            <!-- Rbs de bai end --> 

            <!-- Rbs list question begin -->
            <h5 class="text-danger mt-5">2. Đáp án:</h5>
            <div class="mt-2">
                <div class="table-responsive">
                    <table class="table table-hover border border-danger table-bordered align-middle w-100">
                        <thead
                            style="background-color: #d30000"
                            class="text-white align-middle"
                            >
                            <tr class="text-center align-middle text-nowrap">
                                <th style="width: 1rem;">QuestionId</th>
                                <th>Đáp án</th>
                            </tr>
                        </thead>
                        <tbody class="fw-bold align-middle">
                            <c:forEach var="questionForRbs" items="${questionForRbses}">
                                <tr>
                                    <td class="text-center">${questionForRbs.questionId}</td>
                                    <td class="text-center">
                                        <span class="text-success" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#dapan-${questionForRbs.questionId}" aria-expanded="false" aria-controls="collapseExample">
                                            Xem đáp án
                                        </span>

                                        <div class="mt-3 table-responsive collapse" id="dapan-${questionForRbs.questionId}">
                                            <table class="table table-warning table-hover border border-danger table-bordered align-middle w-100">
                                                <thead class="align-middle text-danger">
                                                    <tr class="text-center align-middle text-nowrap">
                                                        <th scope="col">Thời gian tiến trình P</th>
                                                        <th scope="col">Thời gian tiến trình Q</th>
                                                        <th scope="col">Độ lêch (Ticks)</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="fw-bold align-middle text-black">
                                                    <c:forEach var="i" begin="0" end="${fn:length(questionForRbs.pTimes) - 1}">
                                                        <tr class="text-center">
                                                            <th>${questionForRbs.pTimes[i]}</th>
                                                            <th>${questionForRbs.qTimes[i]}</th>
                                                            <th>${questionForRbs.diffPQ[i]}</th>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>                        
                                        </div>
                                    </td>
                                </tr>                                
                            </c:forEach>
                        </tbody>
                    </table>            
                </div>               
            </div>
            <!-- Rbs list question end -->

            <!-- Huong dan lam bai begin -->
            <h5 class="text-danger mt-4">3. Hướng dẫn:</h5>
            <p class="mt-3 mb-2 fw-bold text-success" data-bs-toggle="collapse" data-bs-target="#code-mau" aria-expanded="false" style="cursor: pointer">Code mẫu</p>
            <div class="collapse" id="code-mau">
                <div class="card card-body">
                    <code class="text-black" style="font-family: Consolas; color: crimson; background-color: #f1f1f1; padding: 2px; font-size: 105%;"><pre>
    static void Main(string[] args)
    {
        ExamForRbs ex = new ExamForRbs();
        string format = "yyyy-MM-dd HH:mm:ss.fff";
        string[] q;
        string[] p;
        ex.GetInputData("anonymous", "anonymous", 1, 1, out p, out q);
        int length = q.Length;
        string[] diffPQ = new string[length];
        long[] dq = new long[length];
        for(int i = 0; i < length; i++)
        {
            dq[i] = DateTime.Parse(p[i]).Ticks - DateTime.Parse(q[i]).Ticks;
            diffPQ[i] = dq[i].ToString();
        }
        for (int i = 0; i < length; i++)
        {
            Console.WriteLine(diffPQ[i]);
        }
        ex.Submit("anonymous", "anonymous", 475, 35196, diffPQ);
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
            let x;
            let notify = new bootstrap.Modal(document.getElementById('notify'));

            function countTime() {

                if ($('#time-control').text() === 'Stop') {
                    clearInterval(x);
                    $('#time-control').text("Start");
                } else if ($('#time-control').text() === 'Start') {
                    $('#time-control').text("Stop");

                    // Update the count every 1 second
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