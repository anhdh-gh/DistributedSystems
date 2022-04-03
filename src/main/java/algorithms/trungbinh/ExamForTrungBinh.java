package algorithms.trungbinh;

import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.ws.Holder;
import model.Account;

@WebService(serviceName = "ExamForTrungBinh")
public class ExamForTrungBinh {

    @WebMethod(operationName = "getInputData")
    public String getInputData(@WebParam(name = "username") String username,
            @WebParam(name = "password") String password,
            @WebParam(name = "examId") int examId,
            @WebParam(name = "questionId") long questionId,
            @WebParam(name = "memberTimes", mode = WebParam.Mode.IN) Holder<String[]> memberTimes) {
        if (!username.equals("") && !password.equals("") && examId != 0
                && questionId != 0 && memberTimes != null) {

            if (Account.authentication(username, password) == null) {
                return "Username hoac password khong dung";
            }

            QuestionTrungBinh questionTrungBinh = QuestionTrungBinh.getQuestionTrungBinhByQuestionId(questionId);
            if (questionTrungBinh == null) {
                return "QuestionId khong ton tai";
            }

            String[] memberTimesSend = questionTrungBinh.getMemberTimes();
            if(memberTimes.value.length < memberTimesSend.length)
                return "Mang memberTimes qua nho";
            System.arraycopy(memberTimesSend, 0, memberTimes.value, 0, memberTimesSend.length);
            
            return "Lay de bai thanh cong";
        }
        return "Chua du tham so";
    }

    @WebMethod(operationName = "submit")
    public String submit(@WebParam(name = "username") String username,
            @WebParam(name = "password") String password,
            @WebParam(name = "examId") int examId,
            @WebParam(name = "questionId") long questionId,
            @WebParam(name = "calibrateMs") @XmlElement(required = true, nillable = false) List<String> calibrateMs) {

        double totalPoint = 0;
        if (!username.equals("") && !password.equals("") && examId != 0
                && questionId != 0 && calibrateMs != null) {

            if (Account.authentication(username, password) == null) {
                return "Username hoac password khong dung";
            }

            QuestionTrungBinh questionTrungBinh = QuestionTrungBinh.getQuestionTrungBinhByQuestionId(questionId);
            if (questionTrungBinh == null) {
                return "QuestionId khong ton tai";
            }

            double answerPoint = (double) 10 / questionTrungBinh.getMemberTimes().length;
            List<String> correctedMs = questionTrungBinh.getCorrectedMs();

            for (int i = 0; i < correctedMs.size(); i++) {
                if (correctedMs.get(i).equals(calibrateMs.get(i))) {
                    totalPoint += answerPoint;
                }
            }
        }
        String ketQua = "Diem so cua ban la: " + ((double) Math.round(totalPoint * 10) / 10) + " diem";
        return ketQua;
    }
}
