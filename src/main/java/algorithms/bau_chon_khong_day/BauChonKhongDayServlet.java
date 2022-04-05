package algorithms.bau_chon_khong_day;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.ServletUtil;

@WebServlet(name = "BauChonKhongDayServlet", urlPatterns = {"/algorithm/bau-chon-khong-day"})
public class BauChonKhongDayServlet extends HttpServlet {
    
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
            QuestionBauChonKhongDay questionBauChonKhongDay = QuestionBauChonKhongDay.getQuestionBauChonById(Integer.parseInt(req.getParameter("id")));

            int countValue = 0;
            int countCorrectValue = 0;
            
            String[][] danAnAns = new String[questionBauChonKhongDay.getSo_tien_trinh()][questionBauChonKhongDay.getSo_tien_trinh()];
            String[][] dapAn = questionBauChonKhongDay.getDapAn();
            
            for (int i = 0; i < dapAn.length; i++) {
                for (int j = 0; j < dapAn[i].length; j++) { 
                    danAnAns[i][j] = req.getParameter("dapAn-" + i + "-" + j);
                    
                    if(!dapAn[i][j].isEmpty()) {
                        countValue++;
                        if (dapAn[i][j].replace(" (được chọn)", "").equals(danAnAns[i][j])) { 
                            countCorrectValue++;
                        }                        
                    }
                }
            }

            req.setAttribute("score", (double) ((double) Math.round(((double) 10/countValue)*countCorrectValue * 10) / 10));
            req.setAttribute("danAnAns", danAnAns);
            req.setAttribute("isSolved", true);
            req.setAttribute("questionBauChonKhongDay", questionBauChonKhongDay);
            ServletUtil.forward("/WEB-INF/pages/bau_chon_khong_day.jsp", req, resp);
        } catch (NumberFormatException | NullPointerException e) {
            ServletUtil.sendRedirect("/algorithm/bau-chon-khong-day", req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("questionBauChonKhongDays", QuestionBauChonKhongDay.getQuestionBauChonKhongDays());
        req.setAttribute("isSolved", false);
        req.setAttribute("timeForTest", 30);
        ServletUtil.forward("/WEB-INF/pages/bau_chon_khong_day.jsp", req, resp);
    }
}
