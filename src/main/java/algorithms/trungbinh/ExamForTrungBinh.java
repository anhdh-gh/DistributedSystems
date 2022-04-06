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

    @WebMethod(operationName = "GetInputData")
    public String GetInputData(@WebParam(name = "UserName") String UserName,
            @WebParam(name = "UserPass") String UserPass,
            @WebParam(name = "ExamId") int ExamId,
            @WebParam(name = "QuestionId") long QuestionId,
            @WebParam(name = "MemberTimes", mode = WebParam.Mode.OUT) Holder<String[]> MemberTimes) {
        if (!UserName.equals("") && !UserPass.equals("") && ExamId != 0
                && QuestionId != 0 && MemberTimes != null) {

            if (Account.authentication(UserName, UserPass) == null) {
                return "UserName hoac UserPass khong dung";
            }

            QuestionTrungBinh questionTrungBinh = QuestionTrungBinh.getQuestionTrungBinhByQuestionId(QuestionId);
            if (questionTrungBinh == null) {
                return "QuestionId khong ton tai";
            }

            String[] memberTimesSend = questionTrungBinh.getMemberTimes();
            if(MemberTimes.value.length < memberTimesSend.length)
                return "Mang memberTimes qua nho";
            System.arraycopy(memberTimesSend, 0, MemberTimes.value, 0, memberTimesSend.length);
            
            return "Lay de bai thanh cong";
        }
        return "Chua du tham so";
    }
    
    @WebMethod(operationName = "Submit")
    public String Submit(@WebParam(name = "UserName") String UserName,
            @WebParam(name = "UserPass") String UserPass,
            @WebParam(name = "ExamId") int ExamId,
            @WebParam(name = "QuestionId") long QuestionId,
            @WebParam(name = "MemberTimes") @XmlElement(required = true, nillable = false) List<String> MemberTimes) {

        double totalPoint = 0;
        if (!UserName.equals("") && !UserPass.equals("") && ExamId != 0
                && QuestionId != 0 && MemberTimes != null) {

            if (Account.authentication(UserName, UserPass) == null) {
                return "Username hoac password khong dung";
            }

            QuestionTrungBinh questionTrungBinh = QuestionTrungBinh.getQuestionTrungBinhByQuestionId(QuestionId);
            if (questionTrungBinh == null) {
                return "QuestionId khong ton tai";
            }

            double answerPoint = (double) 10 / questionTrungBinh.getMemberTimes().length;
            List<String> correctedMs = questionTrungBinh.getCorrectedMs();

            for (int i = 0; i < correctedMs.size(); i++) {
                if (correctedMs.get(i).equals(MemberTimes.get(i))) {
                    totalPoint += answerPoint;
                }
            }
        }
        String ketQua = "Diem so cua ban la: " + ((double) Math.round(totalPoint * 10) / 10) + " diem";
        return ketQua;
    }
}
