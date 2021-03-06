package controllers.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Account;

@WebFilter(filterName = "ClearSessionFilter")
public class ClearSessionFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        
        // Xóa thông tin đăng nhập trong ServletContext
        Account account = (Account) session.getAttribute("account");
        if(account != null)
            req.getServletContext().removeAttribute(account.getUsername());
        
        // Xóa mọi thông tin trong Session
        session.invalidate();
        
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}
