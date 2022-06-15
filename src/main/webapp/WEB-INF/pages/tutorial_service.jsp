<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tutorial service</title>
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

            <!-- Tutorial service begin -->
            <div class="d-flex justify-content-center">
                <h4 class="fw-bold my-4 pb-3 border-4 border-bottom border-danger"><a href="" class="text-reset text-decoration-none">Service tutorial</a></h4>
            </div>
            
            <h5 class="text-danger mt-4">1. Hướng dẫn lấy file C# từ đường dẫn mô tả dịch vụ web:</h5>
            <ul>
                <li>Gõ "cmd" vào ô tìm kiếm trên windows 10 và mở với quyền administrator</li>
                <li>
                    Gõ lệnh: cd <đường dẫn đến thư mục chứa file wsdl.exe> (thư mục "C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools")
                    <ul>
                        <li>Ví dụ: cd C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools</li>
                    </ul>
                </li>
                <li>
                    Gõ lệnh: wsdl url_server (url_server là đường dẫn mở ra trang chứa mô tả dịch vụ web)
                    <ul>
                        <li>Ví dụ: wsdl http://distributed-systems-ptit.herokuapp.com/ExamForBerkeley?wsdl</li>
                    </ul>
                </li>
            </ul>

            <h5 class="text-danger mt-4">2. Hướng dẫn code:</h5>
            <ul>
                <li>Cài visual studio 2019 (trong option chọn ".NET desktop development" và "ASP.NET and web development")</li>
                <li>Vào visual studio 2019 và tạo một project "Console App (.NET Framework)"</li>
                <li>Vào thư mục chứa file wsdl.exe (thư mục "C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools"), copy file vừa sinh ra bằng câu lệnh wsdl</li>
                <li>Tạo một thư mục "code" ở trong project vừa tạo và paste file này vào thư mục của project</li>
                <li>Trong visual studio, chỗ Solution Explorer, bấm nút Show All Files -> Nháy chuột phải vào thư mục code -> Chọn Include in Project</li>
                <li>Click chuộc phải vào chữ "References" -> "Add references" -> Search "System.Web.Services" trong Assembly -> Tích vào</li>
                <li>Ra file program.cs và code theo yêu cầu đề bài, sử dụng các hàm của file sinh bởi wsdl</li>
            </ul>
            <!-- Tutorial service end -->
        </div>      

        <!-- Footer begin -->
        <jsp:include page="./includes/footer.jsp" />
        <!-- Footer end -->

        <!-- Javascript begin -->
        <jsp:include page="./includes/html-body-end.jsp" />
        <!-- Javascript end -->
    </body>
</html>
