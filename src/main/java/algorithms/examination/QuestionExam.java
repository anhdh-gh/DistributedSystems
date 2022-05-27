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
import java.util.ArrayList;
import java.util.List;
import lombok.Getter;

@Getter
public class QuestionExam {
    
    private final int id;
    private final Object question;
    private final float score;
    private final String nameAlgorithm;
    private final int type;

    public QuestionExam(int id, Object question, float score, String nameAlgorithm, int type) {
        this.id = id;
        this.question = question;
        this.score = score;
        this.nameAlgorithm = nameAlgorithm;
        this.type = type;
    }
    
    private static final List<QuestionExam> questionExams = getAllQuestion();

    public static List<QuestionExam> getQuestionExams() {
        return questionExams;
    }

    @Override
    public String toString() {
        return "QuestionExam{" + "id=" + id + ", nameAlgorithm=" + nameAlgorithm + ", type=" + type + '}';
    }
    
    // Lấy tất cả các Question có trong hệ thống
    private static List<QuestionExam> getAllQuestion() {
        List<QuestionExam> questionExamList = new ArrayList<>();
        int id = 0;
        
        // QuestionVectorTimestamp
        for (QuestionVectorTimestamp questionVectorTimestamp : QuestionVectorTimestamp.getQuestionVectorTimestamps())
            questionExamList.add(new QuestionExam(++id, questionVectorTimestamp, 3, Enumeration.VectorTimestamp.name(), 1));
        
        // QuestionTrungBinh
        for (QuestionTrungBinh questionTrungBinh : QuestionTrungBinh.getQuestionTrungBinhs())
            questionExamList.add(new QuestionExam(++id, questionTrungBinh, 2, Enumeration.TrungBinh.name(), 1));  
        
        // QuestionSchlosser
        for (QuestionSchlosser questionSchlosser : QuestionSchlosser.getQuestionSchlossers())
            questionExamList.add(new QuestionExam(++id, questionSchlosser, questionSchlosser.getSoNut() >= 16 ? 2 : 1, Enumeration.Schlosser.name(), 1)); 
        
        // QuestionForRbs
        for (QuestionForRbs questionForRbs : QuestionForRbs.getQuestionForRbses())
            questionExamList.add(new QuestionExam(++id, questionForRbs, 2, Enumeration.Rbs.name(), 1));     
        
        // QuestionLamport
        for (QuestionLamport questionLamport : QuestionLamport.getQuestionLamports())
            questionExamList.add(new QuestionExam(++id, questionLamport, 2, Enumeration.Lamport.name(), 1));   
        
        // QuestionDongThuanPhanTan
        for (QuestionDongThuanPhanTan questionDongThuanPhanTan : QuestionDongThuanPhanTan.getQuestionDongThuanPhanTans())
            questionExamList.add(new QuestionExam(++id, questionDongThuanPhanTan, 2, Enumeration.DongThuanPhanTan.name(), 1)); 
        
        // QuestionCristian
        for (QuestionCristian questionCristian : QuestionCristian.getQuestionCristians())
            questionExamList.add(new QuestionExam(++id, questionCristian, 1, Enumeration.Cristian.name(), 1)); 
        
        // QuestionCristianNtp
        for (QuestionCristianNtp questionCristianNtp : QuestionCristianNtp.getQuestionCristianNtps())
            questionExamList.add(new QuestionExam(++id, questionCristianNtp, 2, Enumeration.Cristian.name(), 2)); 
        
        // QuestionBerkeley
        for (QuestionBerkeley questionBerkeley : QuestionBerkeley.getQuestionBerkeleys())
            questionExamList.add(new QuestionExam(++id, questionBerkeley, questionBerkeley.getMemberTimes().length < 4 ? 1 : 2, Enumeration.Berkeley.name(), 1)); 
        
        // QuestionBauChonKhongDay (Dạng 1 và Dạng 2)
        for (QuestionBauChonKhongDay questionBauChonKhongDay : QuestionBauChonKhongDay.getQuestionBauChonKhongDays()) {
            questionExamList.add(new QuestionExam(++id, questionBauChonKhongDay, 3, Enumeration.BauChonKhongDay.name(), 1)); 
            questionExamList.add(new QuestionExam(++id, questionBauChonKhongDay, 2, Enumeration.BauChonKhongDay.name(), 2));
        }
        
        return questionExamList;
    }
    
    public static QuestionExam getQuestionExamByID(int id) {
        for (QuestionExam questionExam : questionExams) {
            if (questionExam.getId() == id)
                return questionExam;
        }
        return null;
    }
}