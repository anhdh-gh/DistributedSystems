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
                    <a class="nav-link" aria-current="page" href="<c:url value='${request.contextPath}/tutorial'/>">Tutorial</a>
                </li>

                <li class="nav-item dropdown">
                    <span class="
                          nav-link
                          dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false"
                          >
                        Algorithms
                    </span>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/vector-timestamp'/>">Nhãn thời gian vector</a></li>
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/schlosser'/>">Schlosser</a></li>
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/berkeley'/>">Berkeley</a></li>
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/trung-binh'/>">Trung bình</a></li>
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/bau-chon'/>">Bầu chọn không dây</a></li>
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/cristian-ntp'/>">Cristian - NTP</a></li>
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
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/service/berkeley'/>">Berkeley</a></li>
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/service/trung-binh'/>">Trung bình</a></li>
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/service/cristian-ntp'/>">Cristian - NTP</a></li>                    
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