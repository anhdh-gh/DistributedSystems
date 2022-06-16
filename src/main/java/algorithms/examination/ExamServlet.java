package algorithms.examination;

import algorithms.bau_chon_khong_day.QuestionBauChonKhongDay;
import algorithms.berkeley.QuestionBerkeley;
import algorithms.cristian.QuestionCristian;
import algorithms.cristian_ntp.QuestionCristianNtp;
import algorithms.dong_thuan_phan_tan.QuestionDongThuanPhanTan;
import algorithms.lamport.QuestionLamport;
import algorithms.rbs.QuestionForRbs;
import algorithms.schlosser.QuestionSchlosser;
import algorithms.trungbinh.QuestionTrungBinh;
import algorithms.vector_timestamp.QuestionVectorTimestamp;
import java.io.IOException;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.ArrayUtil;
import util.ServletUtil;

@WebServlet(name = "ExamServlet", urlPatterns = {"/examination"})
public class ExamServlet extends HttpServlet {
    
    private final Random random = new Random();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xét có thể nhận dc tiếng việt
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        request.setAttribute("timeForTest", 40);

        // Phải gọi cả hàm này của lớp cha
        super.service(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Fomat điểm
            DecimalFormat df = new DecimalFormat("#.##");
            df.setRoundingMode(RoundingMode.DOWN);
            
            // Lấy ra id của các đề
            String[] ids_str = req.getParameterValues("id");
            int[] ids = new int[ids_str.length];
            for (int i = 0; i < ids_str.length; i++) {
                ids[i] = Integer.parseInt(ids_str[i]);
            }

            // Tính điểm các bài
            List<QuestionExam> questionExams = new ArrayList<>();
            double totalScore = 0;

            for (int id : ids) {
                QuestionExam questionExam = QuestionExam.getQuestionExamByID(id);
                questionExams.add(questionExam);
                Enumeration nameAlgorithm = Enumeration.valueOf(questionExam.getNameAlgorithm());

                switch (nameAlgorithm) {
                    case VectorTimestamp: {
                        switch (questionExam.getType()) {
                            case 1: {
                                QuestionVectorTimestamp questionVectorTimestamp = (QuestionVectorTimestamp) questionExam.getQuestion();
                                String[][] res = questionVectorTimestamp.getRes();

                                double answerPoint = (double) questionExam.getScore() / (res.length * res[0].length - res.length);
                                double score = 0;

                                String[][] ans = new String[res.length][res[0].length];
                                for (int i = 0; i < ans.length; i++) {
                                    for (int j = 1; j < ans[i].length; j++) { // 3 ô đầu tiên mỗi hàng ko tính điểm
                                        ans[i][j] = req.getParameter("questionVectorTimestamp_" + questionExam.getId() + "_" + i + "_" + j);
                                        req.setAttribute("questionVectorTimestamp_" + questionExam.getId() + "_" + i + "_" + j, ans[i][j]);
                                        if (res[i][j].equals(ans[i][j])) {
                                            score += answerPoint;
                                        }
                                    }
                                }
                                totalScore += score;

                                req.setAttribute("questionVectorTimestamp_" + questionExam.getId() + "_isIcr", req.getParameter("questionVectorTimestamp_" + questionExam.getId() + "_isIcr"));
                                req.setAttribute("questionVectorTimestamp_" + questionExam.getId() + "_score", df.format(score));
                                break;
                            }
                        }

                        break;
                    }

                    case TrungBinh: {
                        switch (questionExam.getType()) {
                            case 1: {
                                QuestionTrungBinh questionTrungBinh = (QuestionTrungBinh) questionExam.getQuestion();

                                String[] correctedMsÁns = new String[questionTrungBinh.getCorrectedMs().size()];

                                double score = 0;
                                double answerPoint = (double) questionExam.getScore() / questionTrungBinh.getMemberTimes().length;
                                List<String> correctedMs = questionTrungBinh.getCorrectedMs();

                                for (int i = 0; i < correctedMs.size(); i++) {
                                    correctedMsÁns[i] = req.getParameter("questionTrungBinh_" + questionExam.getId() + "_correctedMs_" + (i + 1));
                                    req.setAttribute("questionTrungBinh_" + questionExam.getId() + "_correctedMs_" + (i + 1), correctedMsÁns[i]);
                                    if (correctedMs.get(i).equals(correctedMsÁns[i])) {
                                        score += answerPoint;
                                    }
                                }

                                totalScore += score;
                                req.setAttribute("questionTrungBinh_" + questionExam.getId() + "_score", df.format(score));
                                break;
                            }
                        }

                        break;
                    }

                    case Schlosser: {
                        switch (questionExam.getType()) {
                            case 1: {
                                QuestionSchlosser questionSchlosser = (QuestionSchlosser) questionExam.getQuestion();
                                int countValue = 0;
                                int countCorrectValue = 0;

                                String[][] ans = new String[questionSchlosser.getSoNut()][questionSchlosser.getSoNut()];
                                int[][] res = questionSchlosser.getResult();
                                for (int i = 0; i < ans.length; i++) {
                                    for (int j = 0; j < ans[i].length; j++) {
                                        ans[i][j] = req.getParameter("questionSchlosser_" + questionExam.getId() + "_" + i + "_" + j);
                                        req.setAttribute("questionSchlosser_" + questionExam.getId() + "_" + i + "_" + j, ans[i][j]);
                                        if (res[i][j] != 0) {
                                            countValue++;
                                            if (ans[i][j].equals(res[i][j] + "")) {
                                                countCorrectValue++;
                                            }
                                        }
                                    }
                                }

                                double score = questionExam.getScore()*countCorrectValue/countValue;
                                totalScore += score;
                                req.setAttribute("questionSchlosser_" + questionExam.getId() + "_score", df.format(score));
                                break;
                            }
                        }

                        break;
                    }

                    case Rbs: {
                        switch (questionExam.getType()) {
                            case 1: {
                                QuestionForRbs questionForRbs = (QuestionForRbs) questionExam.getQuestion();
                                String[] result = questionForRbs.getDiffPQ();
                                String[] ans = new String[result.length];

                                double score = 0;
                                double answerPoint = (double) questionExam.getScore() / result.length;

                                for (int i = 0; i < result.length; i++) {
                                    ans[i] = req.getParameter("questionForRbs_" + questionExam.getId() + "_diffPQ_" + (i));
                                    req.setAttribute("questionForRbs_" + questionExam.getId() + "_diffPQ_" + (i), ans[i]);
                                    if (result[i].equals(ans[i])) {
                                        score += answerPoint;
                                    }
                                }

                                totalScore += score;
                                req.setAttribute("questionForRbs_" + questionExam.getId() + "_score", df.format(score));
                                break;
                            }
                        }

                        break;
                    }

                    case Lamport: {
                        switch (questionExam.getType()) {
                            case 1: {
                                QuestionLamport questionLamport = (QuestionLamport) questionExam.getQuestion();
                                int[][] result = questionLamport.getResult();

                                double answerPoint = (double) questionExam.getScore() / (result.length * result[0].length);
                                double score = 0;

                                String[][] ans = new String[result.length][result[0].length];
                                for (int i = 0; i < ans.length; i++) {
                                    for (int j = 0; j < ans[i].length; j++) {
                                        ans[i][j] = req.getParameter("questionLamport_" + questionExam.getId() + "_" + i + "_" + j);
                                        req.setAttribute("questionLamport_" + questionExam.getId() + "_" + i + "_" + j, ans[i][j]);
                                        if ((result[i][j] + "").equals(ans[i][j])) {
                                            score += answerPoint;
                                        }
                                    }
                                }

                                totalScore += score;
                                req.setAttribute("questionLamport_" + questionExam.getId() + "_score", df.format(score));
                                req.setAttribute("questionLamport_" + questionExam.getId() + "_debai_isIcr", req.getParameter("questionLamport_" + questionExam.getId() + "_debai_isIcr"));
                                req.setAttribute("questionLamport_" + questionExam.getId() + "_bailam_isIcr", req.getParameter("questionLamport_" + questionExam.getId() + "_bailam_isIcr"));

                                break;
                            }
                        }

                        break;
                    }

                    case DongThuanPhanTan: {
                        switch (questionExam.getType()) {
                            case 1: {
                                QuestionDongThuanPhanTan questionDongThuanPhanTan = (QuestionDongThuanPhanTan) questionExam.getQuestion();

                                int total_answers = questionDongThuanPhanTan.getResult_1().length
                                        + questionDongThuanPhanTan.getResult_2().length * questionDongThuanPhanTan.getResult_2()[0].length
                                        + questionDongThuanPhanTan.getResult_final().length;

                                double answerPoint = (double) questionExam.getScore() / total_answers;
                                double score = 0;

                                // So sánh kết quả lần 1
                                String result_1[] = questionDongThuanPhanTan.getResult_1();
                                String ans_result_1[] = new String[result_1.length];
                                for (int i = 0; i < result_1.length; i++) {
                                    ans_result_1[i] = req.getParameter("questionDongThuanPhanTan_" + questionExam.getId() + "_result_1_" + i);
                                    req.setAttribute("questionDongThuanPhanTan_" + questionExam.getId() + "_result_1_" + i, ans_result_1[i]);
                                    if (result_1[i].equals(ans_result_1[i])) {
                                        score += answerPoint;
                                    }
                                }

                                // So sánh kết quả lần 2
                                String result_2[][] = questionDongThuanPhanTan.getResult_2();
                                String ans_result_2[][] = new String[result_2.length][result_2[0].length];
                                for (int i = 0; i < result_2.length; i++) {
                                    for (int j = 0; j < result_2[i].length; j++) {
                                        ans_result_2[i][j] = req.getParameter("questionDongThuanPhanTan_" + questionExam.getId() + "_result_2_" + i + "_" + j);
                                        req.setAttribute("questionDongThuanPhanTan_" + questionExam.getId() + "_result_2_" + i + "_" + j, ans_result_2[i][j]);
                                        if (result_2[i][j].equals(ans_result_2[i][j])) {
                                            score += answerPoint;
                                        }
                                    }
                                }

                                // So sánh kết quả cuối cùng
                                String result_final[] = questionDongThuanPhanTan.getResult_final();
                                String ans_result_final[] = new String[result_final.length];
                                for (int i = 0; i < result_final.length; i++) {
                                    ans_result_final[i] = req.getParameter("questionDongThuanPhanTan_" + questionExam.getId() + "_result_final_" + i);
                                    req.setAttribute("questionDongThuanPhanTan_" + questionExam.getId() + "_result_final_" + i, ans_result_final[i]);
                                    if (result_final[i].equals(ans_result_final[i])) {
                                        score += answerPoint;
                                    }
                                }

                                totalScore += score;
                                req.setAttribute("questionDongThuanPhanTan_" + questionExam.getId() + "_score", df.format(score));
                                break;
                            }
                        }

                        break;
                    }

                    case Cristian: {
                        switch (questionExam.getType()) {
                            case 1: {
                                QuestionCristian questionCristian = (QuestionCristian) questionExam.getQuestion();

                                String dateTimeAfterSynchronize = req.getParameter("questionCristian_" + questionExam.getId() + "_dateTimeAfterSynchronize");
                                req.setAttribute("questionCristian_" + questionExam.getId() + "_dateTimeAfterSynchronize", dateTimeAfterSynchronize);

                                double score = 0;
                                double answerPoint = (double) questionExam.getScore() / 1;

                                if (dateTimeAfterSynchronize.equals(questionCristian.getDateTimeAfterSynchronize())) {
                                    score += answerPoint;
                                }

                                totalScore += score;
                                req.setAttribute("questionCristian_" + questionExam.getId() + "_score", df.format(score));

                                break;
                            }

                            case 2: {
                                QuestionCristianNtp questionCristianNtp = (QuestionCristianNtp) questionExam.getQuestion();

                                String originateSendTimestamp = req.getParameter("questionCristianNtp_" + questionExam.getId() + "_originateSendTimestamp");
                                req.setAttribute("questionCristianNtp_" + questionExam.getId() + "_originateSendTimestamp", originateSendTimestamp);

                                String receiveTimestamp = req.getParameter("questionCristianNtp_" + questionExam.getId() + "_receiveTimestamp");
                                req.setAttribute("questionCristianNtp_" + questionExam.getId() + "_receiveTimestamp", receiveTimestamp);

                                String transmitTimestamp = req.getParameter("questionCristianNtp_" + questionExam.getId() + "_transmitTimestamp");
                                req.setAttribute("questionCristianNtp_" + questionExam.getId() + "_transmitTimestamp", transmitTimestamp);

                                String dateTimeAfterSynchronize = req.getParameter("questionCristianNtp_" + questionExam.getId() + "_dateTimeAfterSynchronize");
                                req.setAttribute("questionCristianNtp_" + questionExam.getId() + "_dateTimeAfterSynchronize", dateTimeAfterSynchronize);

                                String differentTicks = req.getParameter("questionCristianNtp_" + questionExam.getId() + "_differentTicks");
                                req.setAttribute("questionCristianNtp_" + questionExam.getId() + "_differentTicks", differentTicks);

                                double score = 0;
                                double answerPoint = (double) questionExam.getScore() / 5;

                                if (originateSendTimestamp.equals(questionCristianNtp.getOriginateSendTimestamp())) {
                                    score += answerPoint;
                                }

                                if (receiveTimestamp.equals(questionCristianNtp.getReceiveTimestamp())) {
                                    score += answerPoint;
                                }

                                if (transmitTimestamp.equals(questionCristianNtp.getTransmitTimestamp())) {
                                    score += answerPoint;
                                }

                                if (dateTimeAfterSynchronize.equals(questionCristianNtp.getDateTimeAfterSynchronize())) {
                                    score += answerPoint;
                                }

                                if (differentTicks.equals(questionCristianNtp.getDifferentTicks() + "")) {
                                    score += answerPoint;
                                }

                                totalScore += score;
                                req.setAttribute("questionCristianNtp_" + questionExam.getId() + "_score", df.format(score));

                                break;
                            }
                        }

                        break;
                    }

                    case Berkeley: {
                        switch (questionExam.getType()) {
                            case 1: {
                                QuestionBerkeley questionBerkeley = (QuestionBerkeley) questionExam.getQuestion();

                                String[] calibratedAns = new String[questionBerkeley.getCorrectedDateTime().length()];
                                String correctedDateTimeAns = req.getParameter("questionBerkeley_" + questionExam.getId() + "_correctedDateTime");
                                req.setAttribute("questionBerkeley_" + questionExam.getId() + "_correctedDateTime", correctedDateTimeAns);

                                int[] calibratedRes = questionBerkeley.getCalibratedRes();
                                String correctedDateTime = questionBerkeley.getCorrectedDateTime();

                                for (int i = 0; i < calibratedRes.length; i++) {
                                    calibratedAns[i] = req.getParameter("questionBerkeley_" + questionExam.getId() + "_calibratedRes_" + (i + 1));
                                    req.setAttribute("questionBerkeley_" + questionExam.getId() + "_calibratedRes_" + (i + 1), calibratedAns[i]);
                                }

                                double score = 0;
                                double answerPoint = (double) questionExam.getScore() / (calibratedRes.length + 1);

                                for (int i = 0; i < calibratedRes.length; i++) {
                                    if (calibratedAns[i].equals(calibratedRes[i] + "")) {
                                        score += answerPoint;
                                    }
                                }
                                if (correctedDateTime.equals(correctedDateTimeAns)) {
                                    score += answerPoint;
                                }

                                totalScore += score;
                                req.setAttribute("questionBerkeley_" + questionExam.getId() + "_score", df.format(score));
                                break;
                            }
                        }

                        break;
                    }

                    case BauChonKhongDay: {
                        switch (questionExam.getType()) {
                            case 1: {
                                QuestionBauChonKhongDay questionBauChonKhongDay = (QuestionBauChonKhongDay) questionExam.getQuestion();

                                int countValue = 0;
                                int countCorrectValue = 0;

                                String[][] danAnAns = new String[questionBauChonKhongDay.getSo_tien_trinh()][questionBauChonKhongDay.getSo_tien_trinh()];
                                String[][] dapAn = questionBauChonKhongDay.getDapAn();

                                for (int i = 0; i < dapAn.length; i++) {
                                    for (int j = 0; j < dapAn[i].length; j++) {
                                        danAnAns[i][j] = req.getParameter("questionBauChonKhongDay_" + questionExam.getId() + "_dapAn_" + i + "_" + j);
                                        req.setAttribute("questionBauChonKhongDay_" + questionExam.getId() + "_dapAn_" + i + "_" + j, danAnAns[i][j]);

                                        if (!dapAn[i][j].isEmpty()) {
                                            countValue++;
                                            if (dapAn[i][j].replace(" (được chọn)", "").equals(danAnAns[i][j])) {
                                                countCorrectValue++;
                                            }
                                        }
                                    }
                                }

                                double score = questionExam.getScore() * countCorrectValue / countValue;
                                totalScore += score;
                                req.setAttribute("questionBauChonKhongDay_" + questionExam.getId() + "_score", df.format(score));

                                break;
                            }

                            case 2: {
                                QuestionBauChonKhongDay questionBauChonKhongDay = (QuestionBauChonKhongDay) questionExam.getQuestion();

                                int countValue = 0;
                                int countCorrectValue = 0;

                                String[][] danAnAns = new String[questionBauChonKhongDay.getSo_tien_trinh()][questionBauChonKhongDay.getSo_tien_trinh()];
                                String[][] dapAn = questionBauChonKhongDay.getDapAn();

                                for (int i = 0; i < dapAn.length; i++) {
                                    for (int j = 0; j < dapAn[i].length; j++) {
                                        danAnAns[i][j] = req.getParameter("questionBauChonKhongDay_" + questionExam.getId() + "_dapAn_" + i + "_" + j);
                                        req.setAttribute("questionBauChonKhongDay_" + questionExam.getId() + "_dapAn_" + i + "_" + j, danAnAns[i][j]);

                                        if (!dapAn[i][j].isEmpty()) {
                                            countValue++;
                                            if (dapAn[i][j].replace(" (được chọn)", "").equals(danAnAns[i][j])) {
                                                countCorrectValue++;
                                            }
                                        }
                                    }
                                }

                                double score = questionExam.getScore() * countCorrectValue / countValue;
                                totalScore += score;
                                req.setAttribute("questionBauChonKhongDay_" + questionExam.getId() + "_score", df.format(score));
                                break;
                            }
                        }

                        break;
                    }
                }
            }

            req.setAttribute("totalScore", (double) ((double) Math.round(totalScore * 100) / 100));
            req.setAttribute("questionExams", questionExams);
            req.setAttribute("isSolved", true);
            req.setAttribute("time", req.getParameter("time"));
            ServletUtil.forward("/WEB-INF/pages/examination.jsp", req, resp);
        } catch (NumberFormatException | NullPointerException e) {
            ServletUtil.sendRedirect("/examination", req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {        
        req.setAttribute("questionExams", createExam());
        req.setAttribute("isSolved", false);
        ServletUtil.forward("/WEB-INF/pages/examination.jsp", req, resp);
    }
    
    // Tạo bài kiểm tra
    private List<QuestionExam> createExam() {
        // Nhóm các question có cùng điểm vào một nhóm
        Map<Float, List<QuestionExam>> map = new HashMap<>();
        for (QuestionExam questionExam : QuestionExam.getQuestionExams()) {
            float key = questionExam.getScore();
            if(map.containsKey(key))
                map.get(key).add(questionExam);
            else
                map.put(key, new ArrayList<>(Arrays.asList(questionExam)));
        }
        
        // Tổng hợp số lượng question và khác nameAlgorithm của các điểm
        // Ví dụ [1, 2, 2, 3, 3, 3]: Hệ thống có tất cả 1 bài 1 điểm, 2 bài 2 điểm, 3 bài 3 điểm
        List<Float> list = new ArrayList<>();
        for (Map.Entry<Float, List<QuestionExam>> entry : map.entrySet()) {
            List<String> nameAlgorithms = new ArrayList<>();
            float score = entry.getKey();
            List<QuestionExam> questions = entry.getValue();
            for (QuestionExam question : questions)
                if(!nameAlgorithms.contains(question.getNameAlgorithm())) {
                    nameAlgorithms.add(question.getNameAlgorithm());
                    list.add(score);
                }
        }
        
        // Tìm các cấu trúc đề
        // Ví dụ [1, 2, 2, 2, 3]: Là 1 dạng đề có 1 câu 1 điểm, 3 câu 2 điểm, 1 câu 3 điểm
        List<List<Float>> structs = ArrayUtil.findSubsetsWhoseSumIsS(list, 10);
        
        // Xáo trộn cấu trúc đề
        Collections.shuffle(structs);
        
        // Thực hiện random tạo đề
        for (List<Float> struct : structs) {
            // Xáo trộn đề hiện tại
            Collections.shuffle(struct);
            
            // Random mỗi cấu trúc đề 5 lần
            for(int i = 0 ; i < 5 ; i++) {
                List<QuestionExam> exams = new ArrayList<>();
                // Lấy ngẫu nhiên quesion
                for (Float score : struct) {
                    List<QuestionExam> qes = map.get(score);
                    exams.add(qes.get(random.nextInt(qes.size())));
                }       
                // Kiểm tra xem exam có hợp lệ hay không
                if(checkExam(exams) == true) 
                    return exams;
            }
        }
        
        return null;
    }
    
    private boolean checkExam(List<QuestionExam> exams) {
        for(int i = 0 ; i < exams.size() ; i++) {
            if(exams.get(i) == null)
                return false;
            for(int j = i+1 ; j < exams.size() ; j++)
                if(exams.get(i).getNameAlgorithm().equals(exams.get(j).getNameAlgorithm()))
                    return false;
        }
        
        return true;
    }
}
