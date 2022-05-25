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
                            <a class="dropdown-item dropdown-toggle" href="#">Bầu chọn không dây</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/bau-chon-khong-day'/>">Dạng 1</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/bau-chon-khong-day-2'/>">Dạng 2</a></li>
                            </ul>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/vector-timestamp'/>">Nhãn thời gian vector</a></li>
                        <li><hr class="dropdown-divider"></li>
                        
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/lamport'/>">Nhãn thời gian lamport</a></li>
                        <li><hr class="dropdown-divider"></li>
                        
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/schlosser'/>">Schlosser</a></li>
                        <li><hr class="dropdown-divider"></li>
                        
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/berkeley'/>">Berkeley</a></li>
                        <li><hr class="dropdown-divider"></li>
                        
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/trung-binh'/>">Trung bình</a></li>
                        <li><hr class="dropdown-divider"></li>
                        
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/cristian-ntp'/>">Cristian - NTP</a></li>
                        <li><hr class="dropdown-divider"></li>
                        
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/cristian'/>">Cristian</a></li>
                        <li><hr class="dropdown-divider"></li>
                        
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/algorithm/dong-thuan-phan-tan'/>">Đồng thuận phân tán</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <span class="
                          nav-link
                          dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false"
                          >
                        Services
                    </span>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/service/tutorial'/>">Tutorial</a></li>                    
                        <li><hr class="dropdown-divider"></li>
                        
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/service/berkeley'/>">Berkeley</a></li>
                        <li><hr class="dropdown-divider"></li>
                        
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/service/trung-binh'/>">Trung bình</a></li>
                        <li><hr class="dropdown-divider"></li>
                        
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/service/rbs'/>">Rbs</a></li>
                        <li><hr class="dropdown-divider"></li>
                        
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/service/cristian-ntp'/>">Cristian - NTP</a></li>
                    </ul>
                </li>   
                
                <li class="nav-item dropdown">
                    <span class="
                          nav-link
                          dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false"
                          >
                        Sv ptit
                    </span>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a target="_blank" class="dropdown-item" href="<c:url value='https://youtube.com/playlist?list=PLjzUB93NObY7bHA504Z3faI84mfv-wKJ8'/>">Kênh youtube</a></li>                    
                        <li><hr class="dropdown-divider"></li>
                        
                        <li><a target="_blank" class="dropdown-item" href="<c:url value='https://drive.google.com/file/d/194u9TyF4Op2hdj3ekGriu39ImjI4H-dr/view'/>">Danh sách phát</a></li>
                        <li><hr class="dropdown-divider"></li>
                        
                        <li><a target="_blank" class="dropdown-item" href="<c:url value='https://drive.google.com/drive/folders/1b2DXnw92ytdGiRrhS-KQ7fCQe_5ZHpio'/>">Tài liệu</a></li>                    
                    </ul>
                </li>  

                <li class="nav-item dropdown ms-auto">
                    <span class="
                          nav-link text-danger fw-bold
                          dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false"
                          >
                        ${sessionScope.account.username}
                    </span>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/signin'/>">
                                <i class="fa-solid fa-right-from-bracket"></i> Sign out
                            </a></li>
                    </ul>
                </li>  
            </ul>
        </div>
    </div>
</nav>