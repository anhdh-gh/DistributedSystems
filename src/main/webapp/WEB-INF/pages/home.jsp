<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <jsp:include page="./includes/html-head.jsp" />

        <style>
            .user-link {
                background: #efefef;
                line-height: 45px;
                height: 45px;
                border-radius: 5px;
            }

            .user-img {
                display: inline-block;
                position: relative;
            }

            .user-img img {
                border: 1px solid #00B871;
            }
            .rounded-circle {
                border-radius: 50%!important;
            }

            .user-img .status {
                bottom: 18px;
                border-radius: 50%;
                display: inline-block;
                height: 7px;
                position: absolute;
                left: -4px;
                width: 7px;
                border: 1px solid #fff;
            }
            .status.online {
                background-color: #55ce63;
            }
        </style>
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

            <div class="d-flex justify-content-center">
                <h4 class="fw-bold my-4 pb-3 border-4 border-bottom border-danger"><a href="" class="text-reset text-decoration-none">Welcome</a></h4>
            </div>

            <c:if test="${sessionScope.account != null}">
                <!-- Người dùng đang sử dụng begin-->
                <h5 class="text-danger mt-4">1. User status:</h5>
                <div class="row mt-3">
                    <c:forEach var="account" items="${accounts}" varStatus="status">
                        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                            <div class="user-link ps-3 pe-2 d-flex">
                                <span class="user-img">
                                    <img class="rounded-circle" src="<c:url value='${request.contextPath}/assets/img/avata-icon.jpg'/>" width="30" alt="Avata">
                                    <span class="status ${account.value == 0 ? 'online' : account.value > 0 ? 'bg-warning' : 'bg-danger'}"></span>
                                </span>     

                                <div class="d-inline d-flex flex-column justify-content-center ms-2" style="line-height: normal;">
                                    <span class="fw-bold" style="font-size: 14px">${account.key}</span>
                                    <span class="text-muted" style="font-size: 10px">
                                        <c:choose>
                                            <c:when test="${account.value == 0}">Online</c:when>
                                            <c:when test="${account.value > 0}">Online ${account.value} mins ago</c:when>
                                            <c:otherwise>Offline</c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                            </div>  
                        </div>
                    </c:forEach>
                </div>
                <!-- Người dùng đang sử dụng end-->

                <!-- Chú ý begin -->
                <h5 class="text-danger mt-4">2. Important notes:</h5>
                <ul>
                    <li>Khi sử dụng xong hệ thống thì phải luôn <b>đăng xuất tài khoản</b>.</li>
                    <li>Tài khoản đang sử dụng thì sẽ không thể đăng nhập được ở bất kỳ trình duyệt nào khác.</li>
                    <li>Nếu lỡ quên đăng xuất tài khoản, đừng lo lắng. Hãy thử đăng nhập lại sau 30 -> 120 phút. Hoặc sử dụng một tài khoản khác chưa được đăng nhập.</li>
                </ul>    
                <!-- Chú ý end -->                
            </c:if>

            <!-- Tree begin -->
            <h5 class="text-danger mt-4">${sessionScope.account == null ? '1' : '3'}. Algorithms:</h5>
            <div id="tree" class="overflow-auto">
                <ul>
                    <li data-jstree='{"opened":true, "icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                        <span>TRAO ĐỔI THÔNG TIN TRONG HỆ THỐNG PHÂN TÁN</span>
                        <ul>
                            <li data-jstree='{"opened":true, "icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                                <span>Truyền thông theo nhóm</span>
                                <ul>
                                    <li data-jstree='{"opened":true, "icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                                        <span>Quảng bá trong nhóm</span>
                                        <ul>
                                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/schlosser'/>">Giải thuật Schlosser</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>

                    <li data-jstree='{"opened":true, "icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                        <span>ĐỒNG BỘ VÀ CÁC GIẢI THUẬT PHÂN TÁN</span>
                        <ul>
                            <li data-jstree='{"opened":true, "icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                                <a href="#">Đồng bộ đồng hồ vật lý</a>
                                <ul>
                                    <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                                        <a href="#">Giải thuật Cristian</a>
                                        <ul>
                                            <li data-jstree='{"opened":true, "icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                                                <a href="#">Dạng điền form</a>
                                                <ul>
                                                    <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/cristian'/>">Dạng cơ bản</a></li>
                                                    <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/cristian-ntp'/>">Dạng bản tin NTP</a></li>
                                                </ul>
                                            </li>

                                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/service/cristian-ntp'/>">Dạng gọi service (NTP)</a></li>
                                        </ul>
                                    </li>

                                    <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                                        <a href="#">Giải thuật Berkeley</a>
                                        <ul>
                                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/berkeley'/>">Dạng điền form</a></li>
                                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/service/berkeley'/>">Dạng gọi service</a></li>
                                        </ul>                                  
                                    </li>

                                    <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                                        <a href="#">Giải thuật trung bình</a>
                                        <ul>
                                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/trung-binh'/>">Dạng điền form</a></li>
                                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/service/trung-binh'/>">Dạng gọi service</a></li>
                                        </ul>                                  
                                    </li>

                                    <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                                        <a href="#">Giải thuật tham chiếu quảng bá (RBS)</a>
                                        <ul>
                                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/rbs'/>">Dạng điền form</a></li>
                                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/service/rbs'/>">Dạng gọi service</a></li>
                                        </ul>                                  
                                    </li>
                                </ul>
                            </li>

                            <li data-jstree='{"opened":true, "icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                                <a href="#">Thời gian và đồng hồ logic</a>
                                <ul>
                                    <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/lamport'/>">Đồng hồ Lamport</a></li>
                                    <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/vector-timestamp'/>">Đồng hồ vector</a></li>
                                </ul>
                            </li>

                            <li data-jstree='{"opened":true, "icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                                <a href="#">Các giải thuật bầu chọn</a>
                                <ul>
                                    <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                                        <a href="#">Bầu chọn trong môi trường không dây</a>
                                        <ul>
                                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/bau-chon-khong-day'/>">Dạng 1</a></li>
                                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/bau-chon-khong-day-2'/>">Dạng 2</a></li>
                                        </ul>                                       
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>

                    <li data-jstree='{"opened":true, "icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                        <span>PHỤC HỒI VÀ TÍNH CHỊU LỖI</span>
                        <ul>
                            <li data-jstree='{"opened":true, "icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                                <span>Các biện pháp đảm bảo tính chịu lỗi</span>
                                <ul>
                                    <li data-jstree='{"opened":true, "icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                                        <span>Tiến trình bền bỉ</span>
                                        <ul>
                                            <li data-jstree='{"opened":true, "icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                                                <span>Đồng thuận trong các hệ thống lỗi</span>
                                                <ul>
                                                    <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/dong-thuan-phan-tan'/>">Thuật toán đồng thuận phân tán</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>      
            <!-- Tree end -->
        </div>      

        <!-- Footer begin -->
        <jsp:include page="./includes/footer.jsp" />
        <!-- Footer end -->

        <!-- Footer begin -->
        <jsp:include page="./includes/html-body-end.jsp" />
        <!-- Footer end -->

        <script>
            $.jstree.defaults.core.themes.variant = "large";

            $('#tree')
                    .jstree({"plugins": ["types"]})
                    .on("activate_node.jstree", function (e, data) {
                        let href = data.node.a_attr.href;
                        let target = data.node.a_attr.target;
                        if (href !== '#')
                            if (target === '_blank')
                                window.open(href, target).focus();
                            else
                                window.location.href = href;
                    });
        </script>
    </body>
</html>