package algorithms.cristian_ntp;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import util.DateUtil;

public class QuestionCristianNtp {

    private final long questionId;
    private final short[] ntpMesage; // Bản tin Ntp
    private final Date originateSendTimestamp; // T1
    private final Date receiveTimestamp; // T2
    private final Date transmitTimestamp; // T3
    private final Date originateReceiveTime; // T4
    private final long differentTicks; // Theta
    private final Date dateTimeAfterSynchronize; // FinalDateTime

    private QuestionCristianNtp(long questionId, short[] ntpMesage, Date originateSendTimestamp, Date receiveTimestamp, Date transmitTimestamp, Date originateReceiveTime, long differentTicks, Date dateTimeAfterSynchronize) {
        this.questionId = questionId;
        this.ntpMesage = ntpMesage;
        this.originateSendTimestamp = originateSendTimestamp;
        this.receiveTimestamp = receiveTimestamp;
        this.transmitTimestamp = transmitTimestamp;
        this.originateReceiveTime = originateReceiveTime;
        this.differentTicks = differentTicks;
        this.dateTimeAfterSynchronize = dateTimeAfterSynchronize;
    }

    private static final List<QuestionCristianNtp> questionCristianNtps = new ArrayList<>(Arrays.asList(
            new QuestionCristianNtp(
                    1,
                    new short[]{28, 03, 00, 233, 00, 00, 00, 114,
                        00, 00, 12, 160, 25, 66, 230, 04,
                        225, 72, 40, 195, 105, 242, 38, 249,
                        00, 00, 00, 00, 00, 00, 00, 00,
                        225, 72, 40, 208, 41, 242, 12, 33,
                        225, 72, 40, 208, 41, 242, 52, 101},
                    DateUtil.parse("2019-10-09 16:37:07.413"),
                    DateUtil.parse("2019-10-09 16:37:20.163"),
                    DateUtil.parse("2019-10-09 16:37:20.163"),
                    DateUtil.parse("2019-10-09 16:37:29.229"),
                    18420000,
                    DateUtil.parse("2019-10-09 16:37:31.071")
            )
    ));

    public static List<QuestionCristianNtp> getQuestionCristianNtps() {
        return questionCristianNtps;
    }
    
    public static QuestionCristianNtp getQuestionCristianNtpByQuestionId(long questionId) {
        for (QuestionCristianNtp questionCristianNtp : questionCristianNtps) {
            if(questionCristianNtp.getQuestionId() == questionId)
                return questionCristianNtp;
        }
        
        return null;
    }

    public long getQuestionId() {
        return questionId;
    }

    public short[] getNtpMesage() {
        return ntpMesage;
    }

    public long getDifferentTicks() {
        return differentTicks;
    }

    public String getOriginateSendTimestamp() {
        return DateUtil.getDateTimeStringUTCFormat(originateSendTimestamp);
    }

    public String getReceiveTimestamp() {
        return DateUtil.getDateTimeStringUTCFormat(receiveTimestamp);
    }

    public String getTransmitTimestamp() {
        return DateUtil.getDateTimeStringUTCFormat(transmitTimestamp);
    }

    public String getOriginateReceiveTime() {
        return DateUtil.getDateTimeStringUTCFormat(originateReceiveTime);
    }

    public String getDateTimeAfterSynchronize() {
        return DateUtil.getDateTimeStringUTCFormat(dateTimeAfterSynchronize);
    }

    public Date getOriginateSendTimestampDate() {
        return originateSendTimestamp;
    }

    public Date getReceiveTimestampDate() {
        return receiveTimestamp;
    }

    public Date getTransmitTimestampDate() {
        return transmitTimestamp;
    }

    public Date getOriginateReceiveTimeDate() {
        return originateReceiveTime;
    }

    public Date getDateTimeAfterSynchronizeDate() {
        return dateTimeAfterSynchronize;
    }
}
