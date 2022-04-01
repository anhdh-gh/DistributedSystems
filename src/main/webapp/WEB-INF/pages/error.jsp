<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage = "true" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="./includes/html-head.jsp" />
        <title>Error</title>

        <style>
            @import url("https://fonts.googleapis.com/css?family=Merriweather");

            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            .error-container {
                margin: 0;
                padding: 0;
                display: flex;
                min-height: 100vh;
                justify-content: flex-start;
                align-items: center;
                flex-direction: column;
                background-color: black;
                font-family: "Merriweather", serif;
                padding: 1rem;
            }

            .error-container .title {
                color: #fff;
                font-size: 130px;
                margin-top: 40px;
            }

            .error-container p {
                font-size: 22px;
                color: #fff;
            }

            .error-container a {
                margin-top: 10px;
                padding: 10px 30px;
                border: 0px;
                background: #880000;
                color: #fff;
                font-size: 18px;
                letter-spacing: 2px;
                outline: none;
                cursor: pointer;
                border-radius: 10px;
                transition: 0.3s all;
                font-family: "Merriweather", serif;
                text-decoration: none;
                font-weight: bold;
            }

            .error-container a:hover {
                background: #660000;
                text-decoration: none;
            }

            .error-container a:active {
                transform: translate(-5px, 5px);
            }
        </style>
    </head>

    <body>
        <!-- Begin -->

        <!-- Loader begin -->
        <jsp:include page="./includes/loader.jsp"/>
        <!-- Loader end -->

        <div class="error-container">
            <c:choose>
                <c:when test="${pageContext.exception == null}">
                    <div class="title">404!</div>
                    <p>Trang này không tồn tại</p>                           
                </c:when>

                <c:otherwise>
                    <div class="title">OPPS..!</div>
                    <p>Có lỗi xảy ra</p>                                              
                </c:otherwise>
            </c:choose>

            <a href="${pageContext.servletContext.contextPath}">Go back</a>    

            <div class="table-responsive mt-5" style="max-width: 100%">
                <table class="table table-dark">
                    <tbody>
                        <c:if test="${pageContext.errorData.requestURI != null}">
                            <tr>
                                <td class="fw-bold text-nowrap">URI:</td>
                                <td>${pageContext.errorData.requestURI}</td>
                            </tr>                                
                        </c:if>

                        <c:if test="${pageContext.errorData.statusCode != null && pageContext.errorData.statusCode != 0}">
                            <tr class="fw-bold text-nowrap">
                                <td>Status code:</td>
                                <td>${pageContext.errorData.statusCode}</td>
                            </tr>       

                            <c:choose>
                                <c:when test="${pageContext.errorData.statusCode == 404}">
                                    <tr>
                                        <td class="fw-bold text-nowrap">Message</td>
                                        <td>Trang này không tồn tại</td>
                                    </tr>                                       
                                </c:when>
                            </c:choose>
                        </c:if>                               

                        <c:if test="${pageContext.exception != null}">
                            <tr>
                                <td class="fw-bold text-nowrap">Class:</td>
                                <td><%= exception.getClass()%></td>
                            </tr>
                            <tr>
                                <td class="fw-bold text-nowrap">Message:</td>
                                <td>${pageContext.exception.message}</td>
                            </tr>
                        </c:if>

                        <c:if test="${pageContext.exception.stackTrace != null}">
                            <tr class="text-nowrap">
                                <td class="fw-bold">Stack trace:</td>
                                <td>
                                    <c:forEach var = "trace" items = "${pageContext.exception.stackTrace}">
                                        <span>${trace}<br/></span>
                                    </c:forEach>
                                </td>
                            </tr>                     
                        </c:if>   
                    </tbody>
                </table>
            </div>
        </div>
        <!-- End -->

        <!-- Javascript begin -->
        <jsp:include page="./includes/html-body-end.jsp" />
        <!-- Javascript end -->


        <script type="text/javascript">
            $(document).ready(() => {
                $("a").click(e => {
                    e.preventDefault();
                    history.go(-1);
                });
            });
        </script>   
    </body>
</html>