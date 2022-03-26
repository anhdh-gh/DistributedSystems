package algorithms.berkeley;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.ServletUtil;


@WebServlet(name = "BerkeleyServlet", urlPatterns = {"/berkeley"})
public class BerkeleyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("questionBerkeleys", QuestionBerkeley.getQuestionBerkeleys());
        ServletUtil.forward("/WEB-INF/pages/berkeley.jsp", req, resp);
    }
}
