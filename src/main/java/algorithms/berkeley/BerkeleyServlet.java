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
        try {
            QuestionBerkeley questionBerkeley = QuestionBerkeley.getQuestionBerkeleyByQuestionId(Integer.parseInt(req.getParameter("questionId")));
            
            String[] calibratedAns = new String[questionBerkeley.getCorrectedDateTime().length()];
            String correctedDateTimeAns = req.getParameter("correctedDateTime");
            
            int[] calibratedRes = questionBerkeley.getCalibratedRes();
            String correctedDateTime = questionBerkeley.getCorrectedDateTime();
            
            for(int i = 0 ; i < calibratedRes.length ; i++) {
                calibratedAns[i] = req.getParameter("calibratedRes-"+(i+1));
            }
            
            double totalPoint = 0;
            double answerPoint = (double) 10 / (calibratedRes.length + 1);

            for (int i = 0; i < calibratedRes.length; i++) {
                if (calibratedAns[i].equals(calibratedRes[i] + "")) {
                    totalPoint += answerPoint;
                }
            }
            if (correctedDateTime.equals(correctedDateTimeAns)) {
                totalPoint += answerPoint;
            }

            req.setAttribute("score", ((double) Math.round(totalPoint * 10) / 10));
            req.setAttribute("calibratedAns", calibratedAns);
            req.setAttribute("correctedDateTimeAns", correctedDateTimeAns);
            req.setAttribute("isSolved", true);
            req.setAttribute("questionBerkeley", questionBerkeley);
            ServletUtil.forward("/WEB-INF/pages/berkeley.jsp", req, resp);
        } catch (NumberFormatException | NullPointerException e) {
            ServletUtil.sendRedirect("/berkeley", req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("questionBerkeleys", QuestionBerkeley.getQuestionBerkeleys());
        req.setAttribute("isSolved", false);
        ServletUtil.forward("/WEB-INF/pages/berkeley.jsp", req, resp);
    }
}