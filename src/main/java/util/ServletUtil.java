package util;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletUtil {

    private ServletUtil() {}

    /**
    Hàm này thực hiện lấy url và return một string gồm "servletPath" + "pathInfo" + "queryString"
    @param request: HttpServletRequest
    @param response: HttpServletResponse
    @return path: String
    */
    public static String getUrlPath(HttpServletRequest request, HttpServletResponse response) {
        return (request.getServletPath() != null ? request.getServletPath() : "")
                + (request.getPathInfo() != null ? "/" + request.getPathInfo() : "")
                + (request.getQueryString() != null ? "?" + request.getQueryString() : "");
    }
    
    public static void sendRedirect(String location, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect(request.getContextPath() + location);
    }

    public static void forward(String path, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(path).forward(request, response);
    }

    public static void forwardErrorPage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ServletUtil.forward("/WEB-INF/pages/error.jsp", request, response);
    }
}
