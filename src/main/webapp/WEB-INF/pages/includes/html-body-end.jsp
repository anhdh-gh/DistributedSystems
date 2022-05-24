<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Javascript -->
<script src="<c:url value='${request.contextPath}/assets/js/bootstrap.bundle.min.js'/>"></script>

<script src="<c:url value='${request.contextPath}/assets/js/jquery-3.6.0.min.js'/>"></script>

<!--Validate form--> 
<script src="<c:url value='${request.contextPath}/assets/js/jquery.validate.min.js'/>"></script>
<script src="<c:url value='${request.contextPath}/assets/js/Validation.js'/>"></script>

<!-- Loader -->
<script src="<c:url value='${request.contextPath}/assets/js/loader.js'/>"></script>

<!-- Toastify -->
<script src="<c:url value='${request.contextPath}/assets/js/toastify.min.js'/>"></script>

<script>
    $(document).ready(() => {
        // Initialize tooltips
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });
        
        // Set active link in navbar
        $("nav a[href='" + window.location.pathname +"']").addClass('active');
        $("nav .nav-item.dropdown").each(function(i) {
            if($(this).find("a.active").length > 0) {
                $(this).children("span").removeClass("active");
                $(this).children("span").first().addClass("active");
            }
        });
        
        // Replace https://...?wsdl to http://...?wsdl
        $("a").each(function (i) {
            const href = $(this).attr("href");
            if(href.includes("?wsdl"))
                $(this).attr("href", window.location.origin.replace("https://", "http://") + href);
        });
    });
</script>