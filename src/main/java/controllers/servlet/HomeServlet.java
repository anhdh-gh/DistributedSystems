package controllers.servlet;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import org.joda.time.LocalDateTime;
import util.DateUtil;
import util.ServletUtil;

@WebServlet(name = "HomeServlet", urlPatterns = {""})
public class HomeServlet extends HttpServlet {

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
        // Lấy ra các người dùng đang sử dụng trong hệ thống
        Map accounts = new HashMap();
        
        for (Account account : Account.getAccounts()) {
            LocalDateTime dateTime = (LocalDateTime) this.getServletContext().getAttribute(account.getUsername());
            if(dateTime != null)
                accounts.put(account.getUsername(), DateUtil.getDateTimeStringFormat(dateTime.toDate()));
        }
        
        req.setAttribute("accounts", accounts);
        ServletUtil.forward("/WEB-INF/pages/home.jsp", req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
