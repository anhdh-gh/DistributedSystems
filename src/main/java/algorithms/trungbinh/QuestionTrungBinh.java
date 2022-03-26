package algorithms.trungbinh;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class QuestionTrungBinh {

    private final long questionId;
    private final String[] memberTimes;
    private final List<String> correctedMs;

    private QuestionTrungBinh(long questionId, String[] memberTimes, List<String> correctedMs) {
        this.questionId = questionId;
        this.memberTimes = memberTimes;
        this.correctedMs = correctedMs;
    }

    public long getQuestionId() {
        return questionId;
    }

    public String[] getMemberTimes() {
        return memberTimes;
    }

    public List<String> getCorrectedMs() {
        return correctedMs;
    }

    private static final List<QuestionTrungBinh> questionTrungBinhs = new ArrayList<>(Arrays.asList(
            new QuestionTrungBinh(
                    1,
                    new String[]{
                        "2021-06-30 01:01:42.010",
                        "2021-06-30 01:00:39.360",
                        "2021-06-30 01:03:42.030",
                        "2021-06-30 01:01:39.340",
                        "2021-06-30 01:02:42.050",
                        "2021-06-30 00:59:39.320",
                        "2021-06-30 01:01:42.070",
                        "2021-06-30 01:00:39.300",
                        "2021-06-30 01:03:42.090",
                        "2021-06-30 01:01:39.280",
                        "2021-06-30 01:02:42.110",
                        "2021-06-30 00:59:39.260",
                        "2021-06-30 01:03:42.000"
                    },
                    Arrays.asList(
                            "2021-06-30 01:01:52.686",
                            "2021-06-30 01:01:58.951",
                            "2021-06-30 01:01:40.684",
                            "2021-06-30 01:01:52.953",
                            "2021-06-30 01:01:46.682",
                            "2021-06-30 01:02:04.955",
                            "2021-06-30 01:01:52.680",
                            "2021-06-30 01:01:58.957",
                            "2021-06-30 01:01:40.684",
                            "2021-06-30 01:01:52.959",
                            "2021-06-30 01:01:46.676",
                            "2021-06-30 01:02:04.955",
                            "2021-06-30 01:01:40.687"
                    )
            )
    ));

    public static List<QuestionTrungBinh> getQuestionTrungBinhs() {
        return questionTrungBinhs;
    }
    
    public static QuestionTrungBinh getQuestionTrungBinhByQuestionId(long questionId) {
        for (QuestionTrungBinh questionTrungBinh : questionTrungBinhs) {
            if (questionTrungBinh.questionId == questionId) {
                return questionTrungBinh;
            }
        }
        return null;
    }    
}
