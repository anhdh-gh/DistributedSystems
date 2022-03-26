package algorithms.berkeley;

import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.ws.Holder;

@WebService(serviceName = "ExamForBerkeley")
public class ExamForBerkeley {

    @WebMethod(operationName = "getInputData")
    public String getInputData(@WebParam(name = "username") String username,
            @WebParam(name = "password") String password,
            @WebParam(name = "examId") int examId,
            @WebParam(name = "questionId") long questionId,
            @WebParam(name = "memberTimes", mode = WebParam.Mode.OUT) Holder<String[]> memberTimes) {
        if (!username.equals("") && !password.equals("") && examId != 0
                && questionId != 0 && memberTimes != null) {

            QuestionBerkeley questionBerkeley = QuestionBerkeley.getQuestionBerkeleyByQuestionId(questionId);
            if (questionBerkeley == null) {
                return "QuestionId không tồn tại";
            }

            memberTimes.value = questionBerkeley.getMemberTimes();
            return "Lay de bai thanh cong";
        }
        return "Chua du tham so";
    }

    @WebMethod(operationName = "submit")
    public String submit(@WebParam(name = "username") String username,
            @WebParam(name = "password") String password,
            @WebParam(name = "examId") int examId,
            @WebParam(name = "questionId") long questionId,
            @WebParam(name = "calibrateMs") @XmlElement(required = true, nillable = false) List<Integer> calibrateMs,
            @WebParam(name = "correctedDateTime") String correctedDateTime) {

        double totalPoint = 0;
        if (!username.equals("") && !password.equals("") && examId != 0
                && questionId != 0 && calibrateMs != null && !correctedDateTime.equals("")) {

            QuestionBerkeley questionBerkeley = QuestionBerkeley.getQuestionBerkeleyByQuestionId(questionId);
            if (questionBerkeley == null) {
                return "uestionId không tồn tại";
            }
            int[] calibratedRes = questionBerkeley.getCalibratedRes();
            double answerPoint = (double) 10 / calibratedRes.length + 1;

            for (int i = 0; i < calibratedRes.length; i++) {
                if (calibrateMs.get(i) != calibratedRes[i]) {
                    totalPoint += answerPoint;
                }
            }
            if (correctedDateTime.equals(questionBerkeley.getCorrectedDateTime())) {
                totalPoint += answerPoint;
            }
        }
        String ketQua = "Diem so cua ban la: " + ((double) Math.round(totalPoint * 10) / 10) + " diem";
        return ketQua;
    }
}
