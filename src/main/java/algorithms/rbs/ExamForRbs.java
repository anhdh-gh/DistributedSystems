package algorithms.rbs;

import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.ws.Holder;
import model.Account;

@WebService(serviceName = "ExamForRbs")
public class ExamForRbs {

    @WebMethod(operationName = "GetInputData")
    public String GetInputData(@WebParam(name = "UserName") String UserName,
            @WebParam(name = "UserPass") String UserPass,
            @WebParam(name = "ExamId") int ExamId,
            @WebParam(name = "QuestionId") long QuestionId,
            @WebParam(name = "PTimes", mode = WebParam.Mode.OUT) Holder<String[]> PTimes,
            @WebParam(name = "QTimes", mode = WebParam.Mode.OUT) Holder<String[]> QTimes) {
        if (!UserName.equals("") && !UserPass.equals("") && ExamId != 0
                && QuestionId != 0 && PTimes != null && QTimes != null) {

            if (Account.authentication(UserName, UserPass) == null) {
                return "UserName hoac UserPass khong dung";
            }

            QuestionForRbs questionForRbs = QuestionForRbs.getQuestionForRbsByQuestionId(QuestionId);
            if (questionForRbs == null) {
                return "QuestionId khong ton tai";
            }

            PTimes.value = questionForRbs.getpTimes();
            QTimes.value = questionForRbs.getqTimes();
            
            return "Lay de bai thanh cong";
        }
        return "Chua du tham so";
    }
    
    @WebMethod(operationName = "Submit")
    public String Submit(@WebParam(name = "UserName") String UserName,
            @WebParam(name = "UserPass") String UserPass,
            @WebParam(name = "ExamId") int ExamId,
            @WebParam(name = "QuestionId") long QuestionId,
            @WebParam(name = "DiffPQ") @XmlElement(required = true, nillable = false) List<String> DiffPQ) {

        double totalPoint = 0;
        if (!UserName.equals("") && !UserPass.equals("") && ExamId != 0
                && QuestionId != 0 && DiffPQ != null) {

            if (Account.authentication(UserName, UserPass) == null) {
                return "Username hoac UserPass khong dung";
            }

            QuestionForRbs questionForRbs = QuestionForRbs.getQuestionForRbsByQuestionId(QuestionId);
            if (questionForRbs == null) {
                return "QuestionId khong ton tai";
            }

            double answerPoint = (double) 10 / questionForRbs.getDiffPQ().length;
            
            String[] diffPQ = questionForRbs.getDiffPQ();

            for (int i = 0; i < diffPQ.length; i++) {
                if (diffPQ[i].equals(DiffPQ.get(i))) {
                    totalPoint += answerPoint;
                }
            }
        }
        String ketQua = "Diem so cua ban la: " + ((double) Math.round(totalPoint * 10) / 10) + " diem";
        return ketQua;
    }
}
