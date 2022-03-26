<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="<c:url value='${request.contextPath}/tutorial'/>">Tutorial</a>
                </li>

                <li class="nav-item dropdown">
                    <span class="
                          nav-link
                          dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false"
                          >
                        Services
                    </span>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/berkeley'/>">Berkeley</a></li>
                        <li><a class="dropdown-item" href="<c:url value='${request.contextPath}/trung-binh'/>">Trung bình</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>