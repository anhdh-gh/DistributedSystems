<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
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
            
            <!-- Người dùng đang sử dụng begin-->
            <h5 class="text-danger mt-4">1. Users are using:</h5>
            <div class="table-responsive">
                <table class="table table-warning border border-danger table-bordered align-middle w-100 mb-0">
                    <thead class="text-danger align-middle">
                        <tr class="text-center align-middle text-nowrap">
                            <th scope="col">ID</th>
                            <th scope="col">Username</th>
                            <th scope="col">Time</th>
                        </tr>
                    </thead>
                    <tbody class="fw-bold align-middle text-black">
                        <c:forEach var="account" items="${accounts}" varStatus="status">
                            <tr class="text-center">
                                <td>${status.count}</td>
                                <td>${account.key}</td>
                                <td>${account.value}</td>
                            </tr>  
                        </c:forEach>
                    </tbody>
                </table>                        
            </div>
            <!-- Người dùng đang sử dụng end-->
            
            <!-- Chú ý begin -->
            <h5 class="text-danger mt-4">2. Important notes:</h5>
            <ul>
                <li>Khi sử dụng xong hệ thống thì phải luôn <b>đăng xuất tài khoản</b>.</li>
                <li>Tài khoản đang sử dụng thì sẽ không thể đăng nhập được ở một trình duyệt nào khác.</li>
            </ul>    
            <!-- Chú ý end -->
        </div>      

        <!-- Footer begin -->
        <jsp:include page="./includes/footer.jsp" />
        <!-- Footer end -->
            
        <!-- Footer begin -->
        <jsp:include page="./includes/html-body-end.jsp" />
        <!-- Footer end -->
    </body>
</html>