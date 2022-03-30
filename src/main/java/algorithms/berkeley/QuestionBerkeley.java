package algorithms.berkeley;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import lombok.Getter;

@Getter
public class QuestionBerkeley {

    private final long questionId;
    private final String[] memberTimes;
    private final int[] calibratedRes;
    private final String correctedDateTime;

    private QuestionBerkeley(int questionId, String[] memberTimes, int[] calibratedRes, String correctedDateTime) {
        this.questionId = questionId;
        this.memberTimes = memberTimes;
        this.calibratedRes = calibratedRes;
        this.correctedDateTime = correctedDateTime;
    }

    private static final List<QuestionBerkeley> questionBerkeleys = new ArrayList<>(Arrays.asList(
            new QuestionBerkeley(
                    1,
                    new String[]{
                        "2021-10-28 07:55:02.239",
                        "2021-10-28 07:54:02.114",
                        "2021-10-28 07:56:02.414",
                        "2021-10-28 07:54:02.014",
                        "2021-10-28 07:56:02.514"
                    },
                    new int[]{
                        20,
                        60145,
                        -60155,
                        60245,
                        -60255
                    },
                    "2021-10-28 07:55:02.259"
            ),
            new QuestionBerkeley(
                    2,
                    new String[]{
                        "2021-07-12 14:23:26.088",
                        "2021-07-12 14:22:25.990",
                        "2021-07-12 14:24:26.210",
                        "2021-07-12 14:22:25.942"
                    },
                    new int[]{
                        -15031,
                        45067,
                        -75153,
                        45115
                    },
                    "2021-07-12 14:23:11.057"
            ),
            new QuestionBerkeley(
                    3,
                    new String[]{
                        "2022-01-14 08:23:16.895",
                        "2022-01-14 08:22:16.080",
                        "2022-01-14 08:24:17.889",
                        "2022-01-14 08:22:15.719",
                        "2022-01-14 08:24:18.248"
                    },
                    new int[]{
                        71,
                        60886,
                        -60923,
                        61247,
                        -61282
                    },
                    "2022-01-14 08:23:16.966"
            ),
            new QuestionBerkeley(
                    4,
                    new String[]{
                        "2021-10-28 09:53:46.819",
                        "2021-10-28 09:52:45.995",
                        "2021-10-28 09:54:47.807",
                        "2021-10-28 09:52:45.664",
                        "2021-10-28 09:54:48.136"
                    },
                    new int[]{
                        65,
                        60889,
                        -60923,
                        61220,
                        -61252
                    },
                    "2021-10-28 09:53:46.884"
            ),
            new QuestionBerkeley(
                    5,
                    new String[]{
                        "2022-01-14 08:24:20.871",
                        "2022-01-14 08:23:20.449",
                        "2022-01-14 08:25:21.469",
                        "2022-01-14 08:23:20.097",
                        "2022-01-14 08:25:21.818"
                    },
                    new int[]{
                        70,
                        60492,
                        -60528,
                        60844,
                        -60877
                    },
                    "2022-01-14 08:24:20.941"
            ),
            new QuestionBerkeley(
                    6,
                    new String[]{
                        "2021-06-30 08:03:52.530",
                        "2021-06-30 08:02:52.114",
                        "2021-06-30 08:04:53.125"
                    },
                    new int[]{
                        60,
                        60476,
                        -60535
                    },
                    "2021-06-30 08:03:52.590"
            ),
            new QuestionBerkeley(
                    7,
                    new String[]{
                        "2021-07-12 14:23:31.439",
                        "2021-07-12 14:22:30.669",
                        "2021-07-12 14:24:32.319",
                        "2021-07-12 14:22:30.446"
                    },
                    new int[]{
                        -15221,
                        45549,
                        -76101,
                        45772
                    },
                    "2021-07-12 14:23:16.218"
            ),
            new QuestionBerkeley(
                    8,
                    new String[]{
                        "2021-06-30 08:01:41.053",
                        "2021-06-30 08:00:40.391",
                        "2021-06-30 08:02:41.733"
                    },
                    new int[]{
                        6,
                        60668,
                        -60674
                    },
                    "2021-06-30 08:01:41.059"
            )
    ));

    public static List<QuestionBerkeley> getQuestionBerkeleys() {
        return questionBerkeleys;
    }

    public static QuestionBerkeley getQuestionBerkeleyByQuestionId(long questionId) {
        for (QuestionBerkeley questionBerkeley : questionBerkeleys) {
            if (questionBerkeley.questionId == questionId) {
                return questionBerkeley;
            }
        }
        return null;
    }
}
