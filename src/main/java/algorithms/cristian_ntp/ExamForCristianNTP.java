package algorithms.cristian_ntp;

import java.io.Serializable;
import java.util.Date;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.ws.Holder;
import model.Account;

@WebService(serviceName = "ExamForCristianNTP")
public class ExamForCristianNTP {

    @WebMethod(operationName = "getInputData")
    public String getInputData(@WebParam(name = "username") String username,
            @WebParam(name = "password") String password,
            @WebParam(name = "examId") int examId,
            @WebParam(name = "questionId") long questionId,
            @WebParam(name = "originateTimeUtcTick", mode = WebParam.Mode.IN) @XmlElement(required = true, nillable = false, type = Number.class) Holder<Long> originateTimeUtcTick,
            @WebParam(name = "ntpMesage", mode = WebParam.Mode.IN) @XmlElement(required = true, nillable = false) Holder<byte[]> ntpMesage) {

        if (!username.equals("") && !password.equals("") && examId != 0
                && questionId != 0 && originateTimeUtcTick != null && ntpMesage != null) {
            
            if(Account.authentication(username, password) == null)
                return "Username hoac password khong dung";

            QuestionCristianNtp questionCristianNtp = QuestionCristianNtp.getQuestionCristianNtpByQuestionId(questionId);
            if (questionCristianNtp == null) {
                return "QuestionId khong ton tai";
            }

            originateTimeUtcTick.value = questionCristianNtp.getOriginateTimeUtcTick();
            
            byte[] ntpMessageSend = questionCristianNtp.getNtpMesageByte();
            System.arraycopy(ntpMessageSend, 0, ntpMesage.value, 0, ntpMessageSend.length);
            return "Lay de bai thanh cong";
        }
        return "Chua du tham so";
    }

    @WebMethod(operationName = "submit")
    public String submit(@WebParam(name = "username") String username,
            @WebParam(name = "password") String password,
            @WebParam(name = "examId") int examId,
            @WebParam(name = "questionId") long questionId,
            @WebParam(name = "originateSendTimestamp") @XmlElement(required = true, nillable = false, type = Serializable.class) Date originateSendTimestamp,
            @WebParam(name = "receiveTimestamp") @XmlElement(required = true, nillable = false, type = Serializable.class) Date receiveTimestamp,
            @WebParam(name = "transmitTimestamp") @XmlElement(required = true, nillable = false, type = Serializable.class) Date transmitTimestamp,
            @WebParam(name = "originateReceiveTime") @XmlElement(required = true, nillable = false, type = Serializable.class) Date originateReceiveTime,
            @WebParam(name = "differentTicks") long differentTicks,
            @WebParam(name = "dateTimeAfterSynchronize") @XmlElement(required = true, nillable = false, type = Serializable.class) Date dateTimeAfterSynchronize) {

        double totalPoint = 0;
        if (!username.equals("") && 
            !password.equals("") && 
            examId != 0 && 
            questionId != 0 && 
            originateSendTimestamp != null && 
            receiveTimestamp != null && 
            transmitTimestamp != null && 
            originateReceiveTime != null && 
            dateTimeAfterSynchronize != null) {
            
            if(Account.authentication(username, password) == null)
                return "Username hoac password khong dung";

            QuestionCristianNtp questionCristianNtp = QuestionCristianNtp.getQuestionCristianNtpByQuestionId(questionId);
            if(questionCristianNtp == null)
                return "QuestionId khong ton tai";
            
            double answerPoint = (double) 10/6;
            
            if(originateSendTimestamp.equals(questionCristianNtp.getOriginateSendTimestampDate()))
                totalPoint += answerPoint;

            if(receiveTimestamp.equals(questionCristianNtp.getReceiveTimestampDate()))
                totalPoint += answerPoint;
            
            if(transmitTimestamp.equals(questionCristianNtp.getTransmitTimestampDate()))
                totalPoint += answerPoint;
            
            if(originateReceiveTime.equals(questionCristianNtp.getOriginateReceiveTimeDate()))
                totalPoint += answerPoint;
            
            if(differentTicks == questionCristianNtp.getDifferentTicks())
                totalPoint += answerPoint;  
            
            if(dateTimeAfterSynchronize.equals(questionCristianNtp.getDateTimeAfterSynchronizeDate()))
                totalPoint += answerPoint;                     
            
        }
        String ketQua = "Diem so cua ban la: " + ((double) Math.round(totalPoint * 10) / 10) + " diem";
        return ketQua;
    }
}
