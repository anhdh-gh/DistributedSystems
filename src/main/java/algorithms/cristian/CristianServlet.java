package algorithms.cristian;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ServletUtil;

@WebServlet(name = "CristianServlet", urlPatterns = {"/algorithm/cristian"})
public class CristianServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xét có thể nhận dc tiếng việt
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        request.setAttribute("timeForTest", 30);

        // Phải gọi cả hàm này của lớp cha
        super.service(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            QuestionCristian questionCristian = QuestionCristian.getQuestionCristianByQuestionId(Integer.parseInt(req.getParameter("questionId")));

            String dateTimeAfterSynchronize = req.getParameter("dateTimeAfterSynchronize");

            double totalPoint = 0;
            double answerPoint = (double) 10/1;

            if(dateTimeAfterSynchronize.equals(questionCristian.getDateTimeAfterSynchronize()))
                totalPoint += answerPoint;

            req.setAttribute("score", ((double) Math.round(totalPoint * 10) / 10));

            req.setAttribute("dateTimeAfterSynchronize", dateTimeAfterSynchronize);

            req.setAttribute("isSolved", true);
            req.setAttribute("questionCristian", questionCristian);
            req.setAttribute("time", req.getParameter("time"));
            ServletUtil.forward("/WEB-INF/pages/cristian.jsp", req, resp);
        } catch (NumberFormatException | NullPointerException e) {
            ServletUtil.sendRedirect("/algorithm/cristian", req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("questionCristians", QuestionCristian.getQuestionCristians());
        req.setAttribute("isSolved", false);
        req.setAttribute("timeForTest", 30);
        ServletUtil.forward("/WEB-INF/pages/cristian.jsp", req, resp);
    }
}
