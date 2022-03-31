package controllers.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.ServletUtil;


@WebServlet(name = "AuthenServlet", urlPatterns = {"/signin"})
public class AuthenServlet extends HttpServlet {
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xét có thể nhận dc tiếng việt
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        // Phải gọi cả hàm này của lớp cha
        super.service(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletUtil.forward("/WEB-INF/pages/signin.jsp", req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }    
}
