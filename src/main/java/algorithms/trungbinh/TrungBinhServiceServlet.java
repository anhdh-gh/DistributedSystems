package algorithms.trungbinh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.ServletUtil;

@WebServlet(name = "TrungBinhServlet", urlPatterns = {"/service/trung-binh"})
public class TrungBinhServiceServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("questionTrungBinhs", QuestionTrungBinh.getQuestionTrungBinhs());
        ServletUtil.forward("/WEB-INF/pages/trung_binh_service.jsp", req, resp);
    }
}
