package algorithms.trungbinh;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "TrungBinhServlet", urlPatterns = {"/trung-binh"})
public class TrungBinhServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("questionTrungBinhs", QuestionTrungBinh.getQuestionTrungBinhs());
        req.getRequestDispatcher("/WEB-INF/pages/trung-binh.jsp").forward(req, resp);
    }
}
