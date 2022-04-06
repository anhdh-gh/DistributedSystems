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

    @WebMethod(operationName = "GetNtpMessage")
    public String GetNtpMessage(@WebParam(name = "UserName") String UserName,
            @WebParam(name = "UserPass") String UserPass,
            @WebParam(name = "ExamId") int ExamId,
            @WebParam(name = "QuestionId") long QuestionId,
            @WebParam(name = "OriginateTimeUtcTick", mode = WebParam.Mode.IN) @XmlElement(required = true, nillable = false, type = Number.class) Holder<Long> OriginateTimeUtcTick,
            @WebParam(name = "ntpMesage", mode = WebParam.Mode.IN) @XmlElement(required = true, nillable = false) Holder<byte[]> ntpMesage) {

        if (!UserName.equals("") && !UserPass.equals("") && ExamId != 0
                && QuestionId != 0 && OriginateTimeUtcTick != null && ntpMesage != null) {
            
            if(Account.authentication(UserName, UserPass) == null)
                return "Username hoac UserPass khong dung";

            QuestionCristianNtp questionCristianNtp = QuestionCristianNtp.getQuestionCristianNtpByQuestionId(QuestionId);
            if (questionCristianNtp == null) {
                return "QuestionId khong ton tai";
            }

            OriginateTimeUtcTick.value = questionCristianNtp.getOriginateTimeUtcTick();
            
            byte[] ntpMessageSend = questionCristianNtp.getNtpMesageByte();
            if(ntpMesage.value.length < ntpMessageSend.length)
                return "Mang ntpMesage qua nho";
            
            System.arraycopy(ntpMessageSend, 0, ntpMesage.value, 0, ntpMessageSend.length);
            return "Lay de bai thanh cong";
        }
        return "Chua du tham so";
    }
    
    @WebMethod(operationName = "Submit")
    public String Submit(@WebParam(name = "UserName") String UserName,
            @WebParam(name = "UserPass") String UserPass,
            @WebParam(name = "ExamId") int ExamId,
            @WebParam(name = "QuestionId") long QuestionId,
            @WebParam(name = "OriginateSendTimestamp") @XmlElement(required = true, nillable = false, type = Serializable.class) Date OriginateSendTimestamp,
            @WebParam(name = "ReceiveTimestamp") @XmlElement(required = true, nillable = false, type = Serializable.class) Date ReceiveTimestamp,
            @WebParam(name = "TransmitTimestamp") @XmlElement(required = true, nillable = false, type = Serializable.class) Date TransmitTimestamp,
            @WebParam(name = "OriginateReceiveTime") @XmlElement(required = true, nillable = false, type = Serializable.class) Date OriginateReceiveTime,
            @WebParam(name = "DifferentTicks") long DifferentTicks,
            @WebParam(name = "DateTimeAfterSynchronize") @XmlElement(required = true, nillable = false, type = Serializable.class) Date DateTimeAfterSynchronize) {

        double totalPoint = 0;
        if (!UserName.equals("") && 
            !UserPass.equals("") && 
            ExamId != 0 && 
            QuestionId != 0 && 
            OriginateSendTimestamp != null && 
            ReceiveTimestamp != null && 
            TransmitTimestamp != null && 
            OriginateReceiveTime != null && 
            DateTimeAfterSynchronize != null) {
            
            if(Account.authentication(UserName, UserPass) == null)
                return "Username hoac UserPass khong dung";

            QuestionCristianNtp questionCristianNtp = QuestionCristianNtp.getQuestionCristianNtpByQuestionId(QuestionId);
            if(questionCristianNtp == null)
                return "QuestionId khong ton tai";
            
            double answerPoint = (double) 10/6;
            
            if(OriginateSendTimestamp.equals(questionCristianNtp.getOriginateSendTimestampDate()))
                totalPoint += answerPoint;

            if(ReceiveTimestamp.equals(questionCristianNtp.getReceiveTimestampDate()))
                totalPoint += answerPoint;
            
            if(TransmitTimestamp.equals(questionCristianNtp.getTransmitTimestampDate()))
                totalPoint += answerPoint;
            
            if(OriginateReceiveTime.equals(questionCristianNtp.getOriginateReceiveTimeDate()))
                totalPoint += answerPoint;
            
            if(DifferentTicks == questionCristianNtp.getDifferentTicks())
                totalPoint += answerPoint;  
            
            if(DateTimeAfterSynchronize.equals(questionCristianNtp.getDateTimeAfterSynchronizeDate()))
                totalPoint += answerPoint;                     
            
        }
        String ketQua = "Diem so cua ban la: " + ((double) Math.round(totalPoint * 10) / 10) + " diem";
        return ketQua;
    }
}
