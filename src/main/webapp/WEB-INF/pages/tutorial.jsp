<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tutorial</title>
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

            <!-- Tutorial service begin -->
            <h4 class="fw-bold my-4 pb-3 border-4 border-bottom border-danger d-inline-block">1. Service tutorial</h4>
            <pre>
a) Hướng dẫn tạo file C# từ đường dẫn mô tả dịch vụ web:
    - Gõ "cmd" vào ô tìm kiếm trên windows 10 và mở với quyền administrator
    - Gõ lệnh: cd <đường dẫn đến thư mục chứa file wsdl.exe> (thư mục "C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools")
        + Ví dụ: cd C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools
    - Gõ lệnh: wsdl url_server (url_server là đường dẫn mở ra trang chứa mô tả dịch vụ web)
        + Ví dụ: wsdl http://https://chtpt-exercise.herokuapp.com/ExamForBerkeley?wsdl

b) Hướng dẫn code 
    - Cài visual studio 2019 (trong option chọn ".NET desktop development" và "ASP.NET and web development")
    - Vào visual studio 2019 và tạo một project "Console App (.NET Framework)"
    - Vào thư mục chứa file wsdl.exe (thư mục "C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools"), copy file vừa sinh ra bằng câu lệnh wsdl
    - Tạo một thư mục "code" ở trong project vừa tạo và paste file này vào thư mục của project
    - Trong VS, chỗ Solution Explorer, bấm nút Show All Files -> Nháy chuột phải vào thư mục code -> chọn Include in Project
    - Click chuộc phải vào chữ "References" -> "Add references" -> Search "System.Web.Services" trong Assembly -> Tích vào
    - Ra file program.cs và code theo yêu cầu đề bài, sử dụng các hàm của file sinh bởi wsdl
            </pre>
            <!-- Tutorial service end -->
        </div>      

        <!-- Footer begin -->
        <jsp:include page="./includes/html-body.jsp" />
        <!-- Footer end -->
    </body>
</html>
