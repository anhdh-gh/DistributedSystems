package util;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletUtil {

    private ServletUtil() {
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
