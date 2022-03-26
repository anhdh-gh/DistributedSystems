package algorithms.berkeley;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class QuestionBerkeley {
    
    private final long questionId;
    private final String[] memberTimes;
    private final int[] calibratedRes;
    private final String correctedDateTime;

    public long getQuestionId() {
        return questionId;
    }

    public String[] getMemberTimes() {
        return memberTimes;
    }

    public int[] getCalibratedRes() {
        return calibratedRes;
    }

    public String getCorrectedDateTime() {
        return correctedDateTime;
    }

    private QuestionBerkeley(int questionId, String[] memberTimes, int[] calibratedRes, String correctedDateTime) {
        this.questionId = questionId;
        this.memberTimes = memberTimes;
        this.calibratedRes = calibratedRes;
        this.correctedDateTime = correctedDateTime;
    }
    
    private static final List<QuestionBerkeley> questionBerkeleys = new ArrayList<>(Arrays.asList(
        new QuestionBerkeley(
            1,
            new String[] {
                "2021-10-28 07:55:02.239",
                "2021-10-28 07:54:02.114",
                "2021-10-28 07:56:02.414",
                "2021-10-28 07:54:02.014",
                "2021-10-28 07:56:02.514"
            },
            new int[] {
                20,
                60145,
                -60155,
                60245,
                -60255
            },
            "2021-10-28 07:55:02.259"
        )
    ));

    public static List<QuestionBerkeley> getQuestionBerkeleys() {
        return questionBerkeleys;
    }
    
    public static QuestionBerkeley getQuestionBerkeleyByQuestionId(long questionId) {
        for (QuestionBerkeley questionBerkeley : questionBerkeleys) 
            if(questionBerkeley.questionId == questionId)
                return questionBerkeley;
        return null;
    }
}