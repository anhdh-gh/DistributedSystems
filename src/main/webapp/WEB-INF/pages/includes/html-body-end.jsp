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

<!-- Tree view -->
<script src="<c:url value='${request.contextPath}/assets/js/jstree.min.js'/>"></script>

<!-- Messenger Plugin chat Code -->
<div id="fb-root"></div>

<!-- Your Plugin chat code -->
<div id="fb-customer-chat" class="fb-customerchat"></div>

<script>
  var chatbox = document.getElementById('fb-customer-chat');
  chatbox.setAttribute("page_id", "104997555249635");
  chatbox.setAttribute("attribution", "biz_inbox");
</script>

<!-- Your SDK code -->
<script>
    window.fbAsyncInit = function() {
      FB.init({
        xfbml            : true,
        version          : 'v14.0'
      });
    };

    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js';
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>

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
        
        // Dropdown
        $('.dropdown-menu a.dropdown-toggle').on('click', function(e) {
            if (!$(this).next().hasClass('show')) {
              $(this).parents('.dropdown-menu').first().find('.show').removeClass('show');
            }
            var $subMenu = $(this).next('.dropdown-menu');
            $subMenu.toggleClass('show');

            $(this).parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function(e) {
              $('.dropdown-submenu .show').removeClass('show');
            });

            return false;
        });
    });
</script>