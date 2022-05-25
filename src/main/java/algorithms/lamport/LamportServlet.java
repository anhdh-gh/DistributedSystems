package algorithms.lamport;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.ServletUtil;

@WebServlet(name = "LamportServlet", urlPatterns = {"/algorithm/lamport"})
public class LamportServlet extends HttpServlet {
    
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
            QuestionLamport questionLamport = QuestionLamport.getQuestionLamportByID(Integer.parseInt(req.getParameter("id")));

            int[][] result = questionLamport.getResult();
            
            double answerPoint = (double) 10 / (result.length * result[0].length);
            double score = 0;
            
            String[][] ans = new String[result.length][result[0].length];
            for (int i = 0; i < ans.length; i++) {
                for (int j = 0; j < ans[i].length; j++) { 
                    ans[i][j] = req.getParameter(i + "-" + j);
                    if((result[i][j] + "").equals(ans[i][j])) { 
                        score += answerPoint;
                    }
                }
            }

            req.setAttribute("score", (double) ((double) Math.round(score * 10) / 10));
            req.setAttribute("ans", ans);
            req.setAttribute("isSolved", true);
            req.setAttribute("questionLamport", questionLamport);
            req.setAttribute("time", req.getParameter("time"));
            req.setAttribute("debai_isIcr", req.getParameter("debai_isIcr"));
            req.setAttribute("bailam_isIcr", req.getParameter("bailam_isIcr"));
            ServletUtil.forward("/WEB-INF/pages/lamport.jsp", req, resp);
        } catch (NumberFormatException | NullPointerException e) {
            ServletUtil.sendRedirect("/algorithm/lamport", req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("questionLamports", QuestionLamport.getQuestionLamports());
        req.setAttribute("isSolved", false);
        ServletUtil.forward("/WEB-INF/pages/lamport.jsp", req, resp);
    }
}
