package algorithms.trungbinh;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.ServletUtil;

@WebServlet(name = "TrungBinhServlet", urlPatterns = {"/trung-binh"})
public class TrungBinhServlet extends HttpServlet {
    
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
            QuestionTrungBinh questionTrungBinh = QuestionTrungBinh.getQuestionTrungBinhByQuestionId(Integer.parseInt(req.getParameter("questionId")));
            
            String[] correctedMsÁns = new String[questionTrungBinh.getCorrectedMs().size()];

            double totalPoint = 0;            
            double answerPoint = (double) 10 / questionTrungBinh.getMemberTimes().length;
            List<String> correctedMs = questionTrungBinh.getCorrectedMs();

            for (int i = 0; i < correctedMs.size(); i++) {
                correctedMsÁns[i] = req.getParameter("correctedMs-"+(i+1));
                if (correctedMs.get(i).equals(correctedMsÁns[i])) {
                    totalPoint += answerPoint;
                }
            }

            req.setAttribute("score", ((double) Math.round(totalPoint * 10) / 10));
            req.setAttribute("correctedMsÁns", correctedMsÁns);
            req.setAttribute("isSolved", true);
            req.setAttribute("questionTrungBinh", questionTrungBinh);
            ServletUtil.forward("/WEB-INF/pages/trung_binh.jsp", req, resp);
        } catch (NumberFormatException | NullPointerException e) {
            ServletUtil.sendRedirect("/trung-binh", req, resp);
        } 
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("questionTrungBinhs", QuestionTrungBinh.getQuestionTrungBinhs());
        req.setAttribute("isSolved", false);
        req.setAttribute("timeForTest", 30);
        ServletUtil.forward("/WEB-INF/pages/trung_binh.jsp", req, resp);
    }
}