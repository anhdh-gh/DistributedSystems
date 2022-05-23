package controllers.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
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
        String return_url = "";
        String urlPath = ServletUtil.getUrlPath(req, resp);
        int index = urlPath.indexOf("?return_url=");
        
        if(index >= 0) 
            return_url = urlPath.substring(index).replace("?return_url=", "");
  
        req.setAttribute("return_url", return_url);
        ServletUtil.forward("/WEB-INF/pages/signin.jsp", req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String url_return = req.getParameter("url_return");
        
        Account account = Account.authentication(username, password);
        if(account == null) {
            req.setAttribute("username", username);
            req.setAttribute("password", password);
            req.setAttribute("return_url", url_return);
            
            ServletUtil.forward("/WEB-INF/pages/signin.jsp", req, resp);
        }
        else {
            HttpSession session = req.getSession();
            session.setAttribute("account", account);
            ServletUtil.sendRedirect(url_return != null && !url_return.isEmpty() ? url_return : "/", req, resp);
        }
    }    
}
