package algorithms.schlosser;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.ServletUtil;


@WebServlet(name = "SchlosserServlet", urlPatterns = {"/algorithm/schlosser"})
public class SchlosserServlet extends HttpServlet {
    
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
            QuestionSchlosser questionSchlosser = QuestionSchlosser.getQuestionSchlosserById(Integer.parseInt(req.getParameter("id")));
            int countValue = 0;
            int countCorrectValue = 0;
            
            String[][] ans = new String[questionSchlosser.getSoNut()][questionSchlosser.getSoNut()];
            int[][] res = questionSchlosser.getResult();
            for (int i = 0; i < ans.length; i++) {
                for (int j = 0; j < ans[i].length; j++) {
                    ans[i][j] = req.getParameter(i + "-" + j);
                    if(res[i][j] != 0) {
                        countValue++;
                        if(ans[i][j].equals(res[i][j] + ""))
                            countCorrectValue++;
                    }
                }
            }

            req.setAttribute("score", (double) ((double) Math.round(((double) 10/countValue)*countCorrectValue * 10) / 10));
            req.setAttribute("ans", ans);
            req.setAttribute("isSolved", true);
            req.setAttribute("questionSchlosser", questionSchlosser);
            ServletUtil.forward("/WEB-INF/pages/schlosser.jsp", req, resp);
        } catch (NumberFormatException | NullPointerException e) {
            ServletUtil.sendRedirect("/schlosser", req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("questionSchlossers", QuestionSchlosser.getQuestionSchlossers());
        req.setAttribute("isSolved", false);
        req.setAttribute("timeForTest", 30);
        ServletUtil.forward("/WEB-INF/pages/schlosser.jsp", req, resp);
    }
}
