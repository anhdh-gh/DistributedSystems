<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="mt-3 pb-2 border-bottom border-3 border-danger d-flex">
    <img class="d-none d-md-inline" Src="<c:url value='${request.contextPath}/assets/img/ptit-logo.png'/>" alt="Logo ptit"/>
    <div class="flex-fill text-center text-sm-start d-sm-flex justify-content-between flex-md-column flex-lg-row">
        <div>
            <h5 class="fw-bold text-muted">HỌC VIỆN CÔNG NGHỆ BƯU CHÍNH VIỄN THÔNG</h5>
            <h5 class="d-none d-sm-block text-danger fw-normal">Posts and Telecommunications Institute of Technology</h5>
        </div>
        <div class="fs-4 d-flex d-sm-block d-md-flex justify-content-center justify-content-sm-start">
            <div class="d-flex justify-content-between">
                <a href="https://www.facebook.com/anhdh.fb" target="_blank"><i class="fa-brands fa-facebook text-primary"></i></a>
                <a href="mailto:anhdh.cv@gmail.com" target="_blank" class="ms-2 ms-sm-0 ms-md-2"><i class="far fa-envelope text-danger"></i></a>              
            </div>

            <div class="ms-2 ms-sm-0 ms-md-2">
                <a href="https://github.com/anhdh-gh" target="_blank"><i class="fab fa-github text-dark"></i></a>
                <a href="https://www.youtube.com/channel/UCuZUp0A9aLrfHSPr3eg05Ow"  target="_blank"><i class="fab fa-youtube text-danger"></i></a>               
            </div>
        </div>            
    </div>

</div>