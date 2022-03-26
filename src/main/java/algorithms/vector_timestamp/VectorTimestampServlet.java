package algorithms.vector_timestamp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.ServletUtil;

@WebServlet(name = "VectorTimestampServlet", urlPatterns = {"/vector_timestamp"})
public class VectorTimestampServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            QuestionVectorTimestamp questionVectorTimestamp = QuestionVectorTimestamp.getQuestionVectorTimestampByVector_id(Integer.parseInt(req.getParameter("vector_id")));

            double answerPoint = (double) 10 / 24;
            double score = 0;
            String[][] ans = new String[3][9];
            String[][] res = questionVectorTimestamp.getRes();
            for (int i = 0; i < ans.length; i++) {
                for (int j = 0; j < ans[i].length; j++) {
                    ans[i][j] = req.getParameter(i + "-" + j);
                    if (j != 0 && res[i][j].equals(ans[i][j])) { // 3 ô đầu tiên mỗi hàng ko tính điểm
                        score += answerPoint;
                    }
                }
            }

            req.setAttribute("score", (double) ((double) Math.round(score * 10) / 10));
            req.setAttribute("ans", ans);
            req.setAttribute("isSolved", true);
            req.setAttribute("questionVectorTimestamp", questionVectorTimestamp);
            ServletUtil.forward("/WEB-INF/pages/vector_timestamp.jsp", req, resp);
        } catch (NumberFormatException | NullPointerException e) {
            ServletUtil.sendRedirect("vector_timestamp", req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("questionVectorTimestamps", QuestionVectorTimestamp.getQuestionVectorTimestamps());
        req.setAttribute("isSolved", false);
        ServletUtil.forward("/WEB-INF/pages/vector_timestamp.jsp", req, resp);
    }
}
