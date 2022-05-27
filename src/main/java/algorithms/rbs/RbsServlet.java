package algorithms.rbs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.ServletUtil;

@WebServlet(name = "RbsServlet", urlPatterns = {"/algorithm/rbs"})
public class RbsServlet extends HttpServlet {
    
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
            QuestionForRbs questionForRbs = QuestionForRbs.getQuestionForRbsByQuestionId(Integer.parseInt(req.getParameter("questionId")));
            
            String[] result = questionForRbs.getDiffPQ();
            String[] ans = new String[result.length];

            double totalPoint = 0;            
            double answerPoint = (double) 10 / result.length;

            for (int i = 0; i < result.length; i++) {
                ans[i] = req.getParameter("diffPQ-"+(i));
                if (result[i].equals(ans[i])) {
                    totalPoint += answerPoint;
                }
            }

            req.setAttribute("score", ((double) Math.round(totalPoint * 10) / 10));
            req.setAttribute("ans", ans);
            req.setAttribute("isSolved", true);
            req.setAttribute("questionForRbs", questionForRbs);
            req.setAttribute("time", req.getParameter("time"));
            ServletUtil.forward("/WEB-INF/pages/rbs.jsp", req, resp);
        } catch (NumberFormatException | NullPointerException e) {
            ServletUtil.sendRedirect("/algorithm/rbs", req, resp);
        } 
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("questionForRbses", QuestionForRbs.getQuestionForRbses());
        req.setAttribute("isSolved", false);
        req.setAttribute("timeForTest", 30);
        ServletUtil.forward("/WEB-INF/pages/rbs.jsp", req, resp);
    }
}