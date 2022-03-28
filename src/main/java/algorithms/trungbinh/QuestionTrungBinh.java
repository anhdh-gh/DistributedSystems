package algorithms.trungbinh;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import lombok.Getter;

@Getter
public class QuestionTrungBinh {

    private final long questionId;
    private final String[] memberTimes;
    private final List<String> correctedMs;

    private QuestionTrungBinh(long questionId, String[] memberTimes, List<String> correctedMs) {
        this.questionId = questionId;
        this.memberTimes = memberTimes;
        this.correctedMs = correctedMs;
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
            ),
            new QuestionTrungBinh(
                    2,
                    new String[]{
                        "2021-06-30 01:03:53.520",
                        "2021-06-30 01:02:50.750",
                        "2021-06-30 01:05:53.540",
                        "2021-06-30 01:01:50.770",
                        "2021-06-30 01:03:53.550",
                        "2021-06-30 01:02:50.720",
                        "2021-06-30 01:04:53.500",
                        "2021-06-30 01:01:50.710",
                        "2021-06-30 01:03:53.580",
                        "2021-06-30 01:02:50.690",
                        "2021-06-30 01:03:53.490",
                        "2021-06-30 01:01:50.680",
                        "2021-06-30 01:03:53.610"
                    },
                    Arrays.asList(
                            "2021-06-30 01:03:16.137",
                            "2021-06-30 01:03:22.414",
                            "2021-06-30 01:03:10.139",
                            "2021-06-30 01:03:28.412",
                            "2021-06-30 01:03:16.134",
                            "2021-06-30 01:03:22.417",
                            "2021-06-30 01:03:10.139",
                            "2021-06-30 01:03:28.418",
                            "2021-06-30 01:03:16.131",
                            "2021-06-30 01:03:22.420",
                            "2021-06-30 01:03:16.140",
                            "2021-06-30 01:03:28.418",
                            "2021-06-30 01:03:16.128"
                    )
            ),
            new QuestionTrungBinh(
                    3,
                    new String[]{
                        "2021-11-02 00:54:23.020",
                        "2021-11-02 00:52:20.030",
                        "2021-11-02 00:55:23.030",
                        "2021-11-02 00:53:20.040",
                        "2021-11-02 00:54:22.990",
                        "2021-11-02 00:52:20.060",
                        "2021-11-02 00:55:22.970",
                        "2021-11-02 00:52:20.000",
                        "2021-11-02 00:54:22.960",
                        "2021-11-02 00:52:20.090",
                        "2021-11-02 00:55:22.940",
                        "2021-11-02 00:54:19.990",
                        "2021-11-02 00:54:22.930"
                    },
                    Arrays.asList(
                            "2021-11-02 00:53:51.500",
                            "2021-11-02 00:54:03.799",
                            "2021-11-02 00:53:45.505",
                            "2021-11-02 00:53:57.798",
                            "2021-11-02 00:53:51.503",
                            "2021-11-02 00:54:03.796",
                            "2021-11-02 00:53:45.505",
                            "2021-11-02 00:54:03.799",
                            "2021-11-02 00:53:51.506",
                            "2021-11-02 00:54:03.793",
                            "2021-11-02 00:53:45.508",
                            "2021-11-02 00:53:51.803",
                            "2021-11-02 00:53:51.509"
                    )
            ),
            new QuestionTrungBinh(
                    4,
                    new String[]{
                        "2021-07-12 07:23:32.770",
                        "2021-07-12 07:22:30.060",
                        "2021-07-12 07:25:32.790",
                        "2021-07-12 07:23:30.040",
                        "2021-07-12 07:24:32.810",
                        "2021-07-12 07:21:30.080",
                        "2021-07-12 07:25:32.820",
                        "2021-07-12 07:23:30.010",
                        "2021-07-12 07:24:32.840",
                        "2021-07-12 07:21:29.990",
                        "2021-07-12 07:24:32.750",
                        "2021-07-12 07:23:29.980",
                        "2021-07-12 07:24:32.870"
                    },
                    Arrays.asList(
                            "2021-07-12 07:23:49.423",
                            "2021-07-12 07:23:55.694",
                            "2021-07-12 07:23:37.421",
                            "2021-07-12 07:23:49.696",
                            "2021-07-12 07:23:43.419",
                            "2021-07-12 07:24:01.692",
                            "2021-07-12 07:23:37.421",
                            "2021-07-12 07:23:49.699",
                            "2021-07-12 07:23:43.416",
                            "2021-07-12 07:24:01.692",
                            "2021-07-12 07:23:43.425",
                            "2021-07-12 07:23:49.702",
                            "2021-07-12 07:23:43.413"
                    )
            ),
            new QuestionTrungBinh(
                    5,
                    new String[]{
                        "2021-11-02 00:56:22.020",
                        "2021-11-02 00:53:19.110",
                        "2021-11-02 00:54:22.000",
                        "2021-11-02 00:54:19.090",
                        "2021-11-02 00:56:21.990",
                        "2021-11-02 00:53:19.080",
                        "2021-11-02 00:55:21.980",
                        "2021-11-02 00:54:19.150",
                        "2021-11-02 00:56:22.050",
                        "2021-11-02 00:52:19.160",
                        "2021-11-02 00:54:22.060",
                        "2021-11-02 00:53:19.170",
                        "2021-11-02 00:54:21.940"
                    },
                    Arrays.asList(
                            "2021-11-02 00:54:20.557",
                            "2021-11-02 00:54:38.848",
                            "2021-11-02 00:54:32.559",
                            "2021-11-02 00:54:32.850",
                            "2021-11-02 00:54:20.560",
                            "2021-11-02 00:54:38.851",
                            "2021-11-02 00:54:26.561",
                            "2021-11-02 00:54:32.844",
                            "2021-11-02 00:54:20.557",
                            "2021-11-02 00:54:38.851",
                            "2021-11-02 00:54:32.553",
                            "2021-11-02 00:54:38.842",
                            "2021-11-02 00:54:32.565"
                    )
            ),
            new QuestionTrungBinh(
                    6,
                    new String[]{
                        "2021-06-30 01:00:14.770",
                        "2021-06-30 00:58:11.720",
                        "2021-06-30 01:01:14.750",
                        "2021-06-30 01:00:11.740",
                        "2021-06-30 01:02:14.730",
                        "2021-06-30 00:59:11.760",
                        "2021-06-30 01:00:14.710",
                        "2021-06-30 00:59:11.700",
                        "2021-06-30 01:02:14.700",
                        "2021-06-30 00:59:11.790",
                        "2021-06-30 01:00:14.680",
                        "2021-06-30 00:58:11.810",
                        "2021-06-30 01:01:14.660"
                    },
                    Arrays.asList(
                            "2021-06-30 01:00:07.230",
                            "2021-06-30 01:00:19.526",
                            "2021-06-30 01:00:01.232",
                            "2021-06-30 01:00:07.533",
                            "2021-06-30 00:59:55.237",
                            "2021-06-30 01:00:13.531",
                            "2021-06-30 01:00:07.236",
                            "2021-06-30 01:00:13.537",
                            "2021-06-30 00:59:55.237",
                            "2021-06-30 01:00:13.528",
                            "2021-06-30 01:00:07.239",
                            "2021-06-30 01:00:19.526",
                            "2021-06-30 01:00:01.241"
                    )
            ),
            new QuestionTrungBinh(
                    7,
                    new String[]{
                        "2021-07-12 07:24:27.550",
                        "2021-07-12 07:23:24.600",
                        "2021-07-12 07:25:27.530",
                        "2021-07-12 07:21:24.580",
                        "2021-07-12 07:24:27.520",
                        "2021-07-12 07:23:24.630",
                        "2021-07-12 07:23:27.570",
                        "2021-07-12 07:21:24.640",
                        "2021-07-12 07:24:27.490",
                        "2021-07-12 07:22:24.560",
                        "2021-07-12 07:23:27.480",
                        "2021-07-12 07:21:24.670",
                        "2021-07-12 07:25:27.590"
                    },
                    Arrays.asList(
                            "2021-07-12 07:23:20.069",
                            "2021-07-12 07:23:26.364",
                            "2021-07-12 07:23:14.071",
                            "2021-07-12 07:23:38.360",
                            "2021-07-12 07:23:20.072",
                            "2021-07-12 07:23:26.361",
                            "2021-07-12 07:23:26.067",
                            "2021-07-12 07:23:38.360",
                            "2021-07-12 07:23:20.075",
                            "2021-07-12 07:23:32.368",
                            "2021-07-12 07:23:26.076",
                            "2021-07-12 07:23:38.357",
                            "2021-07-12 07:23:14.071"
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
