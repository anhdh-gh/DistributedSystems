package controllers.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Account;
import org.joda.time.LocalDateTime;
import org.joda.time.Minutes;
import util.ServletUtil;

@WebFilter(filterName = "LogFilter")
public class LogFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        ServletContext context = req.getServletContext();
        
        // Cập nhật lại thời gian cho tài khoản hiện tại
        Account account = (Account) session.getAttribute("account");
        if(account != null) {
            context.setAttribute(account.getUsername(), LocalDateTime.now());
        }        
        
        // Kiểm tra các tài khoản khác có thời gian >= 120 không. Nếu có thì xóa
        for (Account a : Account.getAccounts()) {
            LocalDateTime dateTime = (LocalDateTime) context.getAttribute(a.getUsername());
            if(dateTime != null && Math.abs(Minutes.minutesBetween(LocalDateTime.now(), dateTime).getMinutes()) >= 120) {
                context.removeAttribute(a.getUsername());
            }   
        }
        
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {}
}