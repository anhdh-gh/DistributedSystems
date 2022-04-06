package algorithms.rbs;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class QuestionForRbs {
    
    private final long questionId;
    private final String[] pTimes;
    private final String[] qTimes;
    private final String[] diffPQ;

    private QuestionForRbs(long questionId, String[] pTimes, String[] qTimes, String[] diffPQ) {
        this.questionId = questionId;
        this.pTimes = pTimes;
        this.qTimes = qTimes;
        this.diffPQ = diffPQ;
    }
    
    private final static List<QuestionForRbs> questionForRbses = new ArrayList<>(Arrays.asList(
        new QuestionForRbs(
            1, 
            new String[] {
                "2022-04-05 08:13:06.880",
                "2022-04-05 08:14:09.110",
                "2022-04-05 08:14:11.350",
                "2022-04-05 08:16:13.580",
                "2022-04-05 08:18:15.770",
                "2022-04-05 08:19:18.000",
                "2022-04-05 08:19:20.220",
                "2022-04-05 08:19:22.450",
                "2022-04-05 08:20:24.670",
                "2022-04-05 08:22:26.800"
            }, 
            new String[] {
                "2022-04-05 08:13:05.760",
                "2022-04-05 08:14:08.000",
                "2022-04-05 08:14:10.220",
                "2022-04-05 08:16:12.480",
                "2022-04-05 08:18:14.680",
                "2022-04-05 08:19:16.860",
                "2022-04-05 08:19:19.140",
                "2022-04-05 08:19:21.300",
                "2022-04-05 08:20:23.600",
                "2022-04-05 08:22:25.740"
            },
            new String[] {
                "11200000",
                "11100000",
                "11300000",
                "11000000",
                "10900000",
                "11400000",
                "10800000",
                "11500000",
                "10700000",
                "10600000"
            }
        )
    ));

    public static List<QuestionForRbs> getQuestionForRbses() {
        return questionForRbses;
    }

    public long getQuestionId() {
        return questionId;
    }

    public String[] getpTimes() {
        return pTimes;
    }

    public String[] getqTimes() {
        return qTimes;
    }

    public String[] getDiffPQ() {
        return diffPQ;
    }

    public static QuestionForRbs getQuestionForRbsByQuestionId(long questionId) {
        for (QuestionForRbs questionForRbs : questionForRbses) {
            if(questionForRbs.getQuestionId() == questionId)
                return questionForRbs;
        }
        
        return null;
    }
}
