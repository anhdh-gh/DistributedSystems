<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-sm navbar-light bg-light">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav d-block d-sm-flex w-100">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='${request.contextPath}/'/>">Home</a>
                </li>

                <li class="nav-item dropdown">
                    <span class="
                          nav-link
                          dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false"
                          >
                        Algorithms
                    </span>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li class="dropdown-submenu">
                            <a class="dropdown-item dropdown-toggle" href="#">Cristian</a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-submenu">
                                    <a class="dropdown-item dropdown-toggle" href="#">Dạng NTP</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/cristian-ntp'/>">Dạng điền form</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/service/cristian-ntp'/>">Dạng gọi service</a></li>
                                    </ul>                                    
                                </li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/cristian'/>">Dạng cơ bản</a></li>
                            </ul>
                        </li>
                        <li><hr class="dropdown-divider"></li>   

                        <li class="dropdown-submenu">
                            <a class="dropdown-item dropdown-toggle" href="#">Berkeley</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/berkeley'/>">Dạng điển form</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/service/berkeley'/>">Dạng gọi service</a></li>
                            </ul>
                        </li>
                        <li><hr class="dropdown-divider"></li>

                        <li class="dropdown-submenu">
                            <a class="dropdown-item dropdown-toggle" href="#">Trung bình</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/trung-binh'/>">Dạng điển form</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/service/trung-binh'/>">Dạng gọi service</a></li>
                            </ul>
                        </li>
                        <li><hr class="dropdown-divider"></li>

                        <li class="dropdown-submenu">
                            <a class="dropdown-item dropdown-toggle" href="#">Rbs</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/rbs'/>">Dạng điển form</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/service/rbs'/>">Dạng gọi service</a></li>
                            </ul>
                        </li>
                        <li><hr class="dropdown-divider"></li>                       

                        <li class="dropdown-submenu">
                            <a class="dropdown-item dropdown-toggle" href="#">Bầu chọn không dây</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/bau-chon-khong-day'/>">Dạng 1</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/bau-chon-khong-day-2'/>">Dạng 2</a></li>
                            </ul>
                        </li>
                        <li><hr class="dropdown-divider"></li>

                        <li class="dropdown-submenu">
                            <a class="dropdown-item dropdown-toggle" href="#">Nhãn thời gian</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/lamport'/>">Lamport</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/vector-timestamp'/>">Vector</a></li>
                            </ul>
                        </li>
                        <li><hr class="dropdown-divider"></li>                    

                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/schlosser'/>">Schlosser</a></li>
                        <li><hr class="dropdown-divider"></li>

                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/dong-thuan-phan-tan'/>">Đồng thuận phân tán</a></li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='${request.contextPath}/examination'/>">Examination</a>
                </li>

                <li class="nav-item dropdown">
                    <span class="
                          nav-link
                          dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false"
                          >
                        Tutorial
                    </span>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li class="dropdown-submenu">
                            <a class="dropdown-item dropdown-toggle" href="#">Sv ptit</a>
                            <ul class="dropdown-menu">
                                <li><a target="_blank" class="dropdown-item" href="<c:url value='https://youtube.com/playlist?list=PLjzUB93NObY7bHA504Z3faI84mfv-wKJ8'/>">Kênh youtube</a></li>                    
                                <li><hr class="dropdown-divider"></li>

                                <li><a target="_blank" class="dropdown-item" href="<c:url value='https://drive.google.com/file/d/194u9TyF4Op2hdj3ekGriu39ImjI4H-dr/view'/>">Danh sách phát</a></li>
                                <li><hr class="dropdown-divider"></li>

                                <li><a target="_blank" class="dropdown-item" href="<c:url value='https://drive.google.com/drive/folders/1b2DXnw92ytdGiRrhS-KQ7fCQe_5ZHpio'/>">Tài liệu</a></li>  
                            </ul>
                        </li>    
                        <li><hr class="dropdown-divider"></li>  
                        
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/tutorial'/>">Tutorial</a></li>                    
                    </ul>
                </li>  

                <c:if test="${sessionScope.account != null}">
                    <li class="nav-item dropdown ms-auto">
                        <span class="
                              nav-link text-danger fw-bold
                              dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false"
                              >
                            ${sessionScope.account.username}
                        </span>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuLink">
                            <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/signin?back_to_home=true'/>">
                                    <i class="fa-solid fa-right-from-bracket"></i> Sign out
                                </a></li>
                        </ul>
                    </li>                      
                </c:if>

                <c:if test="${sessionScope.account == null}">
                    <li class="nav-item ms-auto">
                        <a class="nav-link" href="<c:url value='${request.contextPath}/signin'/>"><i class="fa-solid fa-user"></i> Sign in</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>