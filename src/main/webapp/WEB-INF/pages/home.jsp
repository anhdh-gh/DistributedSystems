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
                <h4 class="fw-bold my-4 pb-3 border-4 border-bottom border-danger">Wellcome</h4>
            </div>
            
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
            
            <!-- Tree begin -->
            <h5 class="text-danger mt-4">3. Các thuật toán:</h5>
            <div id="tree">
                <ul>
                    <li data-jstree='{"opened":true, "icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                        <span>Algorithms</span>
                        <ul>
                            <li data-jstree='{"opened":true, "icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                                <a href="#">Bầu chọn không dây</a>
                                <ul>
                                    <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/bau-chon-khong-day'/>">Dạng 1</a></li>
       
                                    <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/bau-chon-khong-day-2'/>">Dạng 2</a></li>
                                </ul>
                            </li>

                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/vector-timestamp'/>">Nhãn thời gian vector</a></li>

                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/lamport'/>">Nhãn thời gian lamport</a></li>
                            
                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/schlosser'/>">Schlosser</a></li>

                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/berkeley'/>">Berkeley</a></li>

                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/trung-binh'/>">Trung bình</a></li>

                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/cristian-ntp'/>">Cristian - NTP</a></li>

                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/cristian'/>">Cristian</a></li>

                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/algorithm/dong-thuan-phan-tan'/>">Đồng thuận phân tán</a></li>
                        </ul>
                    </li>

                    <li data-jstree='{"opened":true, "icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                        <span>Services</span>
                        <ul>
                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/service/tutorial'/>">Tutorial</a></li>                    

                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/service/berkeley'/>">Berkeley</a></li>

                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/service/trung-binh'/>">Trung bình</a></li>

                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/service/rbs'/>">Rbs</a></li>

                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a href="<c:url value='${request.contextPath}/service/cristian-ntp'/>">Cristian - NTP</a></li>
                        </ul>
                    </li>   
                    
                    <li data-jstree='{"opened":true, "icon":"<c:url value='${request.contextPath}/assets/img/tree.png'/>"}'>
                        <span>Sv ptit</span>
                        <ul>
                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a target="_blank" href="<c:url value='https://youtube.com/playlist?list=PLjzUB93NObY7bHA504Z3faI84mfv-wKJ8'/>">Kênh youtube</a></li>                    

                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a target="_blank" href="<c:url value='https://drive.google.com/file/d/194u9TyF4Op2hdj3ekGriu39ImjI4H-dr/view'/>">Danh sách phát</a></li>

                            <li data-jstree='{"icon":"<c:url value='${request.contextPath}/assets/img/link-icon.png'/>"}'><a target="_blank" href="<c:url value='https://drive.google.com/drive/folders/1b2DXnw92ytdGiRrhS-KQ7fCQe_5ZHpio'/>">Tài liệu</a></li>                    
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
                .jstree({"plugins" : [ "types"]})
                .on("activate_node.jstree", function(e, data){
                    let href = data.node.a_attr.href;
                    let target = data.node.a_attr.target;
                    if(href !== '#')
                        if(target === '_blank')
                            window.open(href, target).focus();
                        else
                            window.location.href = href;
                });
        </script>
    </body>
</html>