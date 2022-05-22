package algorithms.cristian;

import util.DateUtil;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class QuestionCristian {

    private final long questionId;
    private final Date originateSendTimestamp; // T1
    private final Date receiveTimestamp; // T2
    private final Date transmitTimestamp; // T3
    private final Date originateReceiveTime; // T4
    private final Date dateTimeAfterSynchronize; // FinalDateTime

    private QuestionCristian(long questionId, Date originateSendTimestamp, Date receiveTimestamp, Date transmitTimestamp, Date originateReceiveTime, Date dateTimeAfterSynchronize) {
        this.questionId = questionId;
        this.originateSendTimestamp = originateSendTimestamp;
        this.receiveTimestamp = receiveTimestamp;
        this.transmitTimestamp = transmitTimestamp;
        this.originateReceiveTime = originateReceiveTime;
        this.dateTimeAfterSynchronize = dateTimeAfterSynchronize;
    }

    private static final List<QuestionCristian> questionCristians = new ArrayList<>(Arrays.asList(
        new QuestionCristian(
            1,
            DateUtil.parse("2019-10-09 16:37:07.413"),
            DateUtil.parse("2019-10-09 16:37:20.163"),
            DateUtil.parse("2019-10-09 16:37:20.163"),
            DateUtil.parse("2019-10-09 16:37:29.229"),
            DateUtil.parse("2019-10-09 16:37:31.071")
        ),
        new QuestionCristian(
            2,
            DateUtil.parse("2017-12-21 07:11:08.592"),
            DateUtil.parse("2017-12-21 07:11:09.095"),
            DateUtil.parse("2017-12-21 07:11:09.692"),
            DateUtil.parse("2017-12-21 07:11:10.098"),
            DateUtil.parse("2017-12-21 07:11:10.146")
        ),
        new QuestionCristian(
            3,
            DateUtil.parse("2021-06-30 07:59:53.726"),
            DateUtil.parse("2021-06-30 08:01:41.254"),
            DateUtil.parse("2021-06-30 08:01:41.826"),
            DateUtil.parse("2021-06-30 07:59:56.304"),
            DateUtil.parse("2021-06-30 08:01:42.829")
        ),
        new QuestionCristian(
            4,
            DateUtil.parse("2021-06-30 08:02:41.170"),
            DateUtil.parse("2021-06-30 08:03:52.720"),
            DateUtil.parse("2021-06-30 08:03:53.268"),
            DateUtil.parse("2021-06-30 08:02:44.826"),
            DateUtil.parse("2021-06-30 08:03:54.822")
        )
    ));

    public static List<QuestionCristian> getQuestionCristians() {
        return questionCristians;
    }

    public long getQuestionId() {
        return questionId;
    }

    public static QuestionCristian getQuestionCristianByQuestionId(long questionId) {
        for (QuestionCristian questionCristian : questionCristians) {
            if (questionCristian.getQuestionId() == questionId) {
                return questionCristian;
            }
        }

        return null;
    }

    public String getOriginateSendTimestamp() {
        return DateUtil.getDateTimeStringFormat(originateSendTimestamp);
    }

    public String getReceiveTimestamp() {
        return DateUtil.getDateTimeStringFormat(receiveTimestamp);
    }

    public String getTransmitTimestamp() {
        return DateUtil.getDateTimeStringFormat(transmitTimestamp);
    }

    public String getOriginateReceiveTime() {
        return DateUtil.getDateTimeStringFormat(originateReceiveTime);
    }

    public String getDateTimeAfterSynchronize() {
        return DateUtil.getDateTimeStringFormat(dateTimeAfterSynchronize);
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
