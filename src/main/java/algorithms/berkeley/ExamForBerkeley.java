package algorithms.berkeley;

import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.ws.Holder;
import model.Account;

@WebService(serviceName = "ExamForBerkeley")
public class ExamForBerkeley {

    @WebMethod(operationName = "GetInputData")
    public String GetInputData(@WebParam(name = "UserName") String UserName,
            @WebParam(name = "UserPass") String UserPass,
            @WebParam(name = "ExamId") int ExamId,
            @WebParam(name = "QuestionId") long QuestionId,
            @WebParam(name = "MemberTimes", mode = WebParam.Mode.OUT) Holder<String[]> MemberTimes) {
        if (!UserName.equals("") && !UserPass.equals("") && ExamId != 0
                && QuestionId != 0 && MemberTimes != null) {
            
            if(Account.authentication(UserName, UserPass) == null)
                return "UserName hoac UserPass khong dung";

            QuestionBerkeley questionBerkeley = QuestionBerkeley.getQuestionBerkeleyByQuestionId(QuestionId);
            if (questionBerkeley == null) {
                return "QuestionId khong ton tai";
            }

            MemberTimes.value = questionBerkeley.getMemberTimes();
            return "Lay de bai thanh cong";
        }
        return "Chua du tham so";
    }
    
    @WebMethod(operationName = "Submit")
    public String Submit(@WebParam(name = "UserName") String UserName,
            @WebParam(name = "UserPass") String UserPass,
            @WebParam(name = "ExamId") int ExamId,
            @WebParam(name = "QuestionId") long QuestionId,
            @WebParam(name = "CalibrateMs") @XmlElement(required = true, nillable = false) List<Integer> CalibrateMs,
            @WebParam(name = "CorrectedDateTime") String CorrectedDateTime) {

        double totalPoint = 0;
        if (!UserName.equals("") && !UserPass.equals("") && ExamId != 0
                && QuestionId != 0 && CalibrateMs != null && !CorrectedDateTime.equals("")) {
            
            if(Account.authentication(UserName, UserPass) == null)
                return "Username hoac password khong dung";

            QuestionBerkeley questionBerkeley = QuestionBerkeley.getQuestionBerkeleyByQuestionId(QuestionId);
            if (questionBerkeley == null) {
                return "QuestionId khong ton tai";
            }
            int[] calibratedRes = questionBerkeley.getCalibratedRes();
            double answerPoint = (double) 10 / (calibratedRes.length + 1);

            for (int i = 0; i < calibratedRes.length; i++) {
                if (CalibrateMs.get(i) == calibratedRes[i]) {
                    totalPoint += answerPoint;
                }
            }
            if (CorrectedDateTime.equals(questionBerkeley.getCorrectedDateTime())) {
                totalPoint += answerPoint;
            }
        }
        String ketQua = "Diem so cua ban la: " + ((double) Math.round(totalPoint * 10) / 10) + " diem";
        return ketQua;
    }
}
