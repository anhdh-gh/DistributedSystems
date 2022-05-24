<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<meta charset="UTF-8">
<link rel="shortcut icon" href="<c:url value='${request.contextPath}/assets/img/favicon.png'/>" />
<meta name="description" content="Website thực hành luyện tập các thuật toán học phần Các hệ thống phân tán">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- font-awesome-->
<link rel="stylesheet" href="<c:url value='${request.contextPath}/assets/css/all.min.css'/>"/>

<!-- Bootstrap -->
<link rel="stylesheet" href="<c:url value='${request.contextPath}/assets/css/bootstrap.min.css'/>"/>

<!-- Loader -->
<link rel="stylesheet" href="<c:url value='${request.contextPath}/assets/css/loader.css'/>"/>

<!-- Toastify -->
<link rel="stylesheet" href="<c:url value='${request.contextPath}/assets/css/toastify.min.css'/>"/>

<!-- Dropdown -->
<style>
    .dropdown-submenu {
        position: relative;
    }

    .dropdown-submenu a::after {
        transform: rotate(-90deg);
        position: absolute;
        right: 6px;
        top: .8em;
    }

    .dropdown-submenu .dropdown-menu {
        top: 0;
        left: 100%;
        margin-left: .1rem;
        margin-right: .1rem;
    }
</style>