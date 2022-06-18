package controllers.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Role;
import org.joda.time.LocalDateTime;
import org.joda.time.Minutes;
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
        String bth = req.getParameter("back_to_home");
        if(bth != null && bth.equals("true")) {
            ServletUtil.sendRedirect("/", req, resp);
        }
        else {
            String return_url = "";
            String urlPath = ServletUtil.getUrlPath(req, resp);
            int index = urlPath.indexOf("?return_url=");

            if(index >= 0) 
                return_url = urlPath.substring(index).replace("?return_url=", "");

            req.setAttribute("return_url", return_url);
            
            Account accountDefault = Account.getAccounts().stream().filter(account -> account.getRole() == Role.DefaultUser).findFirst().get();
            req.setAttribute("username", accountDefault.getUsername());
            req.setAttribute("password", accountDefault.getPassword());
            ServletUtil.forward("/WEB-INF/pages/signin.jsp", req, resp);            
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String url_return = req.getParameter("url_return");
        
        req.setAttribute("username", username);
        req.setAttribute("password", password);
        req.setAttribute("return_url", url_return);
        
        Account account = Account.authentication(username, password);
        
        if(account == null) {
            req.setAttribute("notify", "Incorrect username or password");
            ServletUtil.forward("/WEB-INF/pages/signin.jsp", req, resp);
        }
        else {
            LocalDateTime dateTime = (LocalDateTime) this.getServletContext().getAttribute(account.getUsername());
                
            if(dateTime != null && Math.abs(Minutes.minutesBetween(LocalDateTime.now(), dateTime).getMinutes()) < 120) {
                req.setAttribute("notify", "This account is already in use");
                ServletUtil.forward("/WEB-INF/pages/signin.jsp", req, resp);  
            }
            else {
                this.getServletContext().setAttribute(account.getUsername(), LocalDateTime.now());
                req.getSession().setAttribute("account", account);
                ServletUtil.sendRedirect(url_return != null && !url_return.isEmpty() ? url_return : "/", req, resp);
            }            
        }
    }    
}
