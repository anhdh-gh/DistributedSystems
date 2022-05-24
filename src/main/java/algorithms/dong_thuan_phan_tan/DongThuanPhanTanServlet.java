package algorithms.dong_thuan_phan_tan;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.ServletUtil;

@WebServlet(name = "DongThuanPhanTanServlet", urlPatterns = {"/algorithm/dong-thuan-phan-tan"})
public class DongThuanPhanTanServlet extends HttpServlet {
    
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
            QuestionDongThuanPhanTan questionDongThuanPhanTan = QuestionDongThuanPhanTan.getQuestionDongThuanPhanTanByID(Integer.parseInt(req.getParameter("id")));

            int total_answers = questionDongThuanPhanTan.getResult_1().length
                            + questionDongThuanPhanTan.getResult_2().length * questionDongThuanPhanTan.getResult_2()[0].length
                            + questionDongThuanPhanTan.getResult_final().length;
            
            double answerPoint = (double) 10 / total_answers;
            double score = 0;
            
            // So sánh kết quả lần 1
            String result_1[] = questionDongThuanPhanTan.getResult_1();
            String ans_result_1[] = new String[result_1.length];
            for(int i = 0 ; i < result_1.length ; i++) {
                ans_result_1[i] = req.getParameter("result_1-" + i);
                if(result_1[i].equals(ans_result_1[i]))
                    score += answerPoint;                
            }

             // So sánh kết quả lần 2
            String result_2[][] = questionDongThuanPhanTan.getResult_2();
            String ans_result_2[][] = new String[result_2.length][result_2[0].length];
            for(int i = 0 ; i < result_2.length ; i++)
                for(int j = 0 ; j < result_2[i].length ; j++) {
                    ans_result_2[i][j] = req.getParameter("result_2-" + i + "-" + j);
                    if(result_2[i][j].equals(ans_result_2[i][j]))
                        score += answerPoint;                    
                }
            
            // So sánh kết quả cuối cùng
            String result_final[] = questionDongThuanPhanTan.getResult_final();
            String ans_result_final[] = new String[result_final.length];
            for(int i = 0 ; i < result_final.length ; i++) {
                ans_result_final[i] = req.getParameter("result_final-" + i);
                if(result_final[i].equals(ans_result_final[i]))
                    score += answerPoint;
            }

            req.setAttribute("score", (double) ((double) Math.round(score * 10) / 10));
            req.setAttribute("ans_result_1", ans_result_1);
            req.setAttribute("ans_result_2", ans_result_2);
            req.setAttribute("ans_result_final", ans_result_final);
            req.setAttribute("isSolved", true);
            req.setAttribute("questionDongThuanPhanTan", questionDongThuanPhanTan);
            req.setAttribute("time", req.getParameter("time"));
            ServletUtil.forward("/WEB-INF/pages/dong_thuan_phan_tan.jsp", req, resp);
        } catch (NumberFormatException | NullPointerException e) {
            ServletUtil.sendRedirect("/algorithm/dong-thuan-phan-tan", req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("questionDongThuanPhanTans", QuestionDongThuanPhanTan.getQuestionDongThuanPhanTans());
        req.setAttribute("isSolved", false);
        ServletUtil.forward("/WEB-INF/pages/dong_thuan_phan_tan.jsp", req, resp);
    }
}
