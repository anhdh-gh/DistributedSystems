<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cristian NTP</title>
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
                <h4 class="fw-bold my-4 pb-3 border-4 border-bottom border-danger d-inline-block"><a href="" class="text-reset text-decoration-none">Cristian NTP</a></h4>
            </div>

            <!-- Berkeley de bai begin -->
            <div>
                <h5 class="text-danger mt-4">1. Đề bài:</h5>
                <p style="text-align: justify;">
                    Viết ứng dụng dạng Console Application bằng ngôn ngữ C#. 
                    Sử dụng dịch vụ web <a target="_blank" href="<c:url value='${request.contextPath}/ExamForCristianNTP?wsdl'/>"><script>document.write(window.location.origin.replace("https://", "http://"));</script>${pageContext.request.contextPath}/ExamForCristianNTP?wsdl</a>
                    gọi hàm getNtpMessage để lấy giá trị các tham số thời gian, 
                    sau khi tính toán qui đổi ra thời gian địa phương và độ lệch thời gian (Tíck), 
                    gọi hàm Submit để cập nhật kết quả tính toán lên máy chủ. 
                    Nén mã nguồn của chương trình học viên đã viến (chỉ cần tập tin Program.cs) 
                    và tải tập tin nén (.zip) lên máy chủ khi nộp bài.
                </p>
                <p>
                    Các tham số gọi hàm trong dịch vụ web: ExamId = 1, QuestionId = 
                    <c:if test="${fn:length(questionCristianNtps) == 1}">
                        ${questionCristianNtps[0].questionId}.
                    </c:if>
                    <c:if test="${fn:length(questionCristianNtps) > 1}">
                        [<c:forEach var="questionCristianNtp" items="${questionCristianNtps}" varStatus="status">
                            ${questionCristianNtp.questionId}
                            <c:if test="${status.count < fn:length(questionCristianNtps)}">, </c:if>
                        </c:forEach>].                        
                    </c:if>
                </p>
                <p class="mt-3 mb-2 fw-bold">Thời gian làm bài: ${requestScope.timeForTest} phút.</p>
                <p id="time" class="mt-2 fs-4 text-success"></p>
                <button id="time-control" class="btn btn-success" onclick="countTime()">Start</button>                
            </div>
            <!-- Berkeley de bai end -->

            <!-- Cristian NTP list question begin -->
            <h5 class="text-danger mt-5">2. Đáp án:</h5>
            <div class="mt-2">
                <c:forEach var="questionCristianNtp" items="${questionCristianNtps}">
                    <p class="text-success" style="cursor: pointer" data-bs-toggle="collapse" data-bs-target="#dapan-${questionCristianNtp.questionId}" aria-expanded="false" aria-controls="collapseExample">
                        <i class="fa-solid fa-circle-dot"></i> QUESTION-ID: ${questionCristianNtp.questionId}
                    </p>

                    <div class="collapse" id="dapan-${questionCristianNtp.questionId}">
                        <div class="table-responsive position-relative">
                            <table class="table table-warning border border-danger table-bordered align-middle w-100">
                                <thead class="align-middle text-center">
                                <th class="text-danger" colspan="${fn:length(questionCristianNtp.ntpMesage) + 1}">Bản tin ntp</th>                                   
                                </thead>
                                <tbody class="fw-bold align-middle text-black">
                                    <tr>
                                        <th scope="col" class="position-sticky start-0">Byte</th>
                                            <c:forEach var="i" begin="0" end="${fn:length(questionCristianNtp.ntpMesage)-1}">
                                                <c:if test="${i < 10}">
                                                <th scope="col">0${i}</th>
                                                </c:if>
                                                <c:if test="${i >= 10}">
                                                <th scope="col">${i}</th>
                                                </c:if>
                                            </c:forEach>
                                    </tr>
                                    <tr>
                                        <th class="text-center position-sticky start-0">Giá trị</th>
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

                        <div class="text-center mt-3 table-responsive">
                            <table class="table table-warning table-hover border border-danger table-bordered align-middle w-100">
                                <thead class="align-middle">
                                    <tr class="text-danger" class="align-middle text-nowrap">
                                        <th scope="col">Tham số</th>
                                        <th scope="col">Đáp án</th>
                                    </tr>
                                </thead>
                                <tbody class="fw-bold align-middle text-black">
                                    <tr>
                                        <td class="text-start">Thời gian máy khách gửi</td>
                                        <td class="text-start">${questionCristianNtp.originateSendTimestamp}</td>
                                    </tr>  

                                    <tr>
                                        <td class="text-start">Thời gian máy chủ NTP nhận</td>
                                        <td class="text-start">${questionCristianNtp.receiveTimestamp}</td>
                                    </tr>  

                                    <tr>
                                        <td class="text-start">Thời gian máy chủ NTP gửi</td>
                                        <td class="text-start">${questionCristianNtp.transmitTimestamp}</td>
                                    </tr>  

                                    <tr>
                                        <td class="text-start">Thời gian máy khách nhận</td>
                                        <td class="text-start">${questionCristianNtp.originateReceiveTime} = ${questionCristianNtp.originateTimeUtcTick} (Tick)</td>
                                    </tr>

                                    <tr>
                                        <td class="text-start">Thời gian mới cần thiết lập cho máy khách</td>
                                        <td class="text-start">${questionCristianNtp.dateTimeAfterSynchronize}</td>
                                    </tr>

                                    <tr>
                                        <td class="text-start">Độ lệch thời gian giữa máy khách và máy chủ (tính bằng đơn vị Tick)</td>
                                        <td class="text-start">${questionCristianNtp.differentTicks}</td>
                                    </tr>
                                </tbody>
                            </table>                        
                        </div> 
                    </div>
                </c:forEach>
            </div>
            <!-- Cristian NTP list question end -->

            <!-- Huong dan lam bai begin -->
            <h5 class="text-danger mt-4">3. Hướng dẫn:</h5>
            <p class="mt-3 mb-2 fw-bold text-success" data-bs-toggle="collapse" data-bs-target="#code-mau" aria-expanded="false" style="cursor: pointer">Code mẫu</p>
            <div class="collapse" id="code-mau">
                <div class="card card-body">
                    <code class="text-black" style="font-family: Consolas; color: crimson; background-color: #f1f1f1; padding: 2px; font-size: 105%;"><pre>
    static void Main(string[] args)
    {
        ExamForCristianNTP exam = new ExamForCristianNTP();
        string fomat = "yyyy-MM-dd HH:mm:ss.fff";

        long t4Tick = 0;
        byte[] ntpMessage = new byte[48];
        string res = exam.getInputData("anonymous", "anonymous", 1, 6, ref t4Tick, ref ntpMessage);

        Console.WriteLine(res);
        for(int i = 0; i < ntpMessage.Length; i++)
        {
            Console.WriteLine(i + " - " + ntpMessage[i]);
        }

        DateTime t1 = Convert(ntpMessage, 16).ToLocalTime();
        DateTime t2 = Convert(ntpMessage, 32).ToLocalTime();
        DateTime t3 = Convert(ntpMessage, 40).ToLocalTime();
        DateTime t4 = new DateTime(t4Tick);
        long theta = (long)Math.Round(((t2.Ticks-t1.Ticks)+(t3.Ticks-t4.Ticks))/2.0, 0, MidpointRounding.AwayFromZero);
        DateTime final = t4.AddTicks(theta);

        Console.WriteLine("T1: " + t1.ToString(fomat));
        Console.WriteLine("T2: " + t2.ToString(fomat));
        Console.WriteLine("T3: " + t3.ToString(fomat));
        Console.WriteLine("T4: " + t4.ToString(fomat));
        Console.WriteLine("Fianl: " + final.ToString(fomat));
        Console.WriteLine("Theta: " + theta);

        res = exam.submit("anonymous", "anonymous", 1, 6, t1, t2, t3, t4, theta, final);
        Console.WriteLine(res);

        Console.ReadKey();
    }

    // Cách 1
    static DateTime Convert(byte[] ntpMessage, int position)
    {
        DateTime res = new DateTime(1900, 1, 1, 0, 0, 0);

        ulong nguyen = 0, le = 0;
        for(int i = 0; i < 4; i++)
        {
            nguyen += (ulong)ntpMessage[position + i] << (8 * (3 - i));
            le += (ulong)ntpMessage[position + 4 + i] << (8 * (3 - i));
        }

        return res.AddMilliseconds(nguyen * 1000 + le * 1000 / UInt32.MaxValue);
    }

    // Cách 2
    static DateTime Convert(byte[] ntpMessage, int position)
    {
        DateTime res = new DateTime(1900, 1, 1, 0, 0, 0);
        byte[] arr = new byte[4];

        Array.Copy(ntpMessage, position, arr, 0, 4);
        Array.Reverse(arr);
        ulong nguyen = (ulong) BitConverter.ToUInt32(arr, 0);

        Array.Copy(ntpMessage, position + 4, arr, 0, 4);
        Array.Reverse(arr);
        ulong le = (ulong)BitConverter.ToUInt32(arr, 0);

        return res.AddMilliseconds(nguyen*1000 + le*1000/UInt32.MaxValue);
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
