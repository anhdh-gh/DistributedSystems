<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign in</title>
        <jsp:include page="./includes/html-head.jsp" />
    </head>
    <body style="background-color: #F6F8FA;">
        <!-- Loader begin -->
        <jsp:include page="./includes/loader.jsp"/>
        <!-- Loader end -->

        <div class="container-xl min-vh-100">
            <!-- Header begin -->
            <%--<jsp:include page="./includes/header.jsp"/>--%>
            <!-- Header end -->  

            <!-- Background begin -->
            <div class="position-absolute start-0 bottom-0 " style="width: 42.5%;">
                <img class="w-100" src="<c:url value='${request.contextPath}/assets/img/bg_left.png'/>" alt="bg_left"/>
            </div>
            <div class="position-absolute end-0 bottom-0 " style="width: 42.5%;">
                <img class="w-100" src="<c:url value='${request.contextPath}/assets/img/bg_right.png'/>" alt="bg_right"/>
            </div>
            <!-- Background end -->


            <div class="d-flex justify-content-center align-items-center vh-100">
                <!-- Form login begin -->
                <form action="" method="POST"
                      style="
                      border-radius: 11.99px;
                      box-shadow: 0 0 8px 0 rgb(44 44 44 / 20%);
                      background-color: #fff;
                      font-size: 16.8px;
                      z-index: 1000"
                      class="p-5 d-flex flex-column align-items-center"
                      >
                    <img style="width: 57.6px;" src="<c:url value='${request.contextPath}/assets/img/logo_ptit.png'/>" alt="logo_ptit"/>
                    <label class="fw-bold">Sign in</label>
                    <div class="mb-3 mt-2">
                        <label for="username" class="form-label text-muted">Username:</label>
                        <input style="min-width: 100px" type="text" class="form-control" id="username" name="username" value="${username}">
                    </div>
                    <div class="mb-3 mt-2">
                        <label for="password" class="form-label text-muted">Password:</label>
                        <input style="min-width: 100px" type="password" class="form-control" id="password" name="password" value="${password}">
                    </div>
                    <input type="hidden" name="url_return" value="${return_url != null && return_url != "" ? return_url : "/"}">
                    <button type="submit" class="btn btn-danger fw-bold mt-2" style="background-color: #d30000;  min-width: 100%">Sign in</button>
                
                    <div class="mt-3">
                        <a class="text-decoration-none fw-bold text-danger" href="<c:url value='${request.contextPath}/'/>">Home</a>
                    </div>
                </form>     
                <!-- Form login end -->
            </div>
        </div>      

        <!-- Footer begin -->
        <%--<jsp:include page="./includes/footer.jsp" />--%>
        <!-- Footer end -->

        <!-- Javascript begin -->
        <jsp:include page="./includes/html-body-end.jsp" />
        <!-- Javascript end -->
        
        <c:if test="${not empty notify}">
            <script>
                Toastify({
                    text: "${notify}",
                    className: "info",
                    duration: 5000,
                    newWindow: true,
                    close: true,
                    gravity: "bottom", // `top` or `bottom`
                    position: "center", // `left`, `center` or `right`
                    stopOnFocus: true, // Prevents dismissing of toast on hover
                    style: {
                        background: "linear-gradient(90deg, rgba(0,0,0,1) 0%, rgba(211,0,0,1) 100%)"
                    }
                }).showToast();
            </script>
        </c:if>
    </body>
</html>
