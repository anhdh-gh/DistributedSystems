<!--Footer-->
<div id="footer-page" class="
     mt-4
     border-bottom border-4 border-danger
     d-flex flex-column align-items-center justify-content-around
     p-2"
     style="background-color: #f3f7f9"
     >
    <div>
        <a class="px-2" href="#"><i data-bs-toggle="tooltip" data-bs-placement="bottom" title="Facebook" class="h3 fa-brands fa-facebook text-primary"></i></a>

        <a class="px-2" href="mailto:abc@def.com"><i data-bs-toggle="tooltip" data-bs-placement="bottom" title="Mail" class="h3 far fa-envelope text-danger"></i></a>              


        <a class="px-2" href="#"><i data-bs-toggle="tooltip" data-bs-placement="bottom" title="Github" class="h3 fab fa-github text-dark"></i></a>


        <a class="px-2" href="#" class="ms-2"><i data-bs-toggle="tooltip" data-bs-placement="bottom" title="Youtube" class="h3 fab fa-youtube text-danger"></i></a>               
    </div>

    <p class="fw-bold text-center m-0">
        Copyright &copy;
        <script>document.write(new Date().getFullYear());</script>. ALL RIGHTS RESERVED. | Design by <a class="text-danger text-decoration-none" href="#">
            Anonymous
        </a>
    </p>

</div>

<!-- Javascript -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="<c:url value='${request.contextPath}/assets/js/bootstrap.bundle.min.js'/>"></script>

<script src="<c:url value='${request.contextPath}/assets/js/jquery-3.6.0.min.js'/>"></script>

<!--Validate form--> 
<script src="<c:url value='${request.contextPath}/assets/js/jquery.validate.min.js'/>"></script>
<script src="<c:url value='${request.contextPath}/assets/js/Validation.js'/>"></script>

<!-- Loader -->
<script src="<c:url value='${request.contextPath}/assets/js/loader.js'/>"></script>

<script>
    // Initialize tooltips
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
</script>