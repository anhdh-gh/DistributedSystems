package algorithms.cristian_ntp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.ServletUtil;

@WebServlet(name = "CristianNtpServlet", urlPatterns = {"/algorithm/cristian-ntp"})
public class CristianNtpServlet extends HttpServlet {

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
            QuestionCristianNtp questionCristianNtp = QuestionCristianNtp.getQuestionCristianNtpByQuestionId(Integer.parseInt(req.getParameter("questionId")));

            String originateSendTimestamp = req.getParameter("originateSendTimestamp");
            String receiveTimestamp = req.getParameter("receiveTimestamp");
            String transmitTimestamp = req.getParameter("transmitTimestamp");
            String dateTimeAfterSynchronize = req.getParameter("dateTimeAfterSynchronize");
            String differentTicks = req.getParameter("differentTicks");

            double totalPoint = 0;
            double answerPoint = (double) 10/5;
            
            if(originateSendTimestamp.equals(questionCristianNtp.getOriginateSendTimestamp()))
                totalPoint += answerPoint;

            if(receiveTimestamp.equals(questionCristianNtp.getReceiveTimestamp()))
                totalPoint += answerPoint;
            
            if(transmitTimestamp.equals(questionCristianNtp.getTransmitTimestamp()))
                totalPoint += answerPoint;
            
            if(dateTimeAfterSynchronize.equals(questionCristianNtp.getDateTimeAfterSynchronize()))
                totalPoint += answerPoint;       
            
            if(differentTicks.equals(questionCristianNtp.getDifferentTicks() + ""))
                totalPoint += answerPoint;     

            req.setAttribute("score", ((double) Math.round(totalPoint * 10) / 10));
            
            req.setAttribute("originateSendTimestamp", originateSendTimestamp);
            req.setAttribute("receiveTimestamp", receiveTimestamp);
            req.setAttribute("transmitTimestamp", transmitTimestamp);
            req.setAttribute("dateTimeAfterSynchronize", dateTimeAfterSynchronize);
            req.setAttribute("differentTicks", differentTicks);

            req.setAttribute("isSolved", true);
            req.setAttribute("questionCristianNtp", questionCristianNtp);
            ServletUtil.forward("/WEB-INF/pages/cristian_ntp.jsp", req, resp);
        } catch (NumberFormatException | NullPointerException e) {
            ServletUtil.sendRedirect("/cristian-ntp", req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("questionCristianNtps", QuestionCristianNtp.getQuestionCristianNtps());
        req.setAttribute("isSolved", false);
        req.setAttribute("timeForTest", 30);
        ServletUtil.forward("/WEB-INF/pages/cristian_ntp.jsp", req, resp);
    }
}
