package algorithms.lamport;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import lombok.Getter;

@Getter
public class QuestionLamport {

    private final int id;
    private final int[][] deBai;
    private final List<String> events;
    private final int[][] result;

    public QuestionLamport(int id, int[][] deBai, List<String> events, int[][] result) {
        this.id = id;
        this.deBai = deBai;
        this.events = events;
        this.result = result;
    }

    private static final List<QuestionLamport> questionLamports = new ArrayList<>(Arrays.asList(
            new QuestionLamport(
                    1,
                    new int[][]{
                        {0, 6, 12, 18, 24, 30, 36, 42, 48, 54, 60},
                        {0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80},
                        {0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100}
                    },
                    Arrays.asList(
                            "e1,1 gửi và e2,2 nhận",
                            "e2,3 gửi và e3,4 nhận",
                            "e3,6 gửi và e2,7 nhận",
                            "e2,8 gửi và e1,9 nhận"
                    ),
                    new int[][]{
                        {0, 6, 12, 18, 24, 30, 36, 42, 48, 70, 76},
                        {0, 8, 16, 24, 32, 40, 48, 61, 69, 77, 85},
                        {0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100}
                    }
            ),
            new QuestionLamport(
                    2,
                    new int[][]{
                        {0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165},
                        {0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110},
                        {0, 14, 28, 42, 56, 70, 84, 98, 112, 126, 140, 154}
                    },
                    Arrays.asList(
                            "e1,1 gửi và e2,2 nhận",
                            "e2,3 gửi và e3,4 nhận",
                            "e3,5 gửi và e2,6 nhận",
                            "e2,7 gửi và e1,8 nhận"
                    ),
                    new int[][]{
                        {0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165},
                        {0, 10, 20, 30, 40, 50, 71, 81, 91, 101, 111, 121},
                        {0, 14, 28, 42, 56, 70, 84, 98, 112, 126, 140, 154}
                    }
            ),
            new QuestionLamport(
                    3,
                    new int[][]{
                        {0, 6, 12, 18, 24, 30, 36, 42, 48, 54, 60, 66},
                        {0, 19, 38, 57, 76, 95, 114, 133, 152, 171, 190, 209},
                        {0, 7, 14, 21, 28, 35, 42, 49, 56, 63, 70, 77}
                    },
                    Arrays.asList(
                            "e1,1 gửi và e2,2 nhận",
                            "e2,3 gửi và e3,4 nhận",
                            "e3,5 gửi và e2,6 nhận",
                            "e2,7 gửi và e1,8 nhận"
                    ),
                    new int[][]{
                        {0, 6, 12, 18, 24, 30, 36, 42, 134, 140, 146, 152},
                        {0, 19, 38, 57, 76, 95, 114, 133, 152, 171, 190, 209},
                        {0, 7, 14, 21, 58, 65, 72, 79, 86, 93, 100, 107}
                    }
            ),
            new QuestionLamport(
                    4,
                    new int[][]{
                        {0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88},
                        {0, 17, 34, 51, 68, 85, 101, 119, 136, 153, 170, 187},
                        {0, 9, 18, 27, 36, 45, 54, 63, 72, 81, 90, 99}
                    },
                    Arrays.asList(
                            "e1,1 gửi và e2,2 nhận",
                            "e2,3 gửi và e3,4 nhận",
                            "e3,5 gửi và e2,6 nhận",
                            "e2,7 gửi và e1,8 nhận"
                    ),
                    new int[][]{
                        {0, 8, 16, 24, 32, 40, 48, 56, 120, 128, 136, 144},
                        {0, 17, 34, 51, 68, 85, 101, 119, 136, 153, 170, 187},
                        {0, 9, 18, 27, 52, 61, 70, 79, 88, 97, 106, 115}
                    }
            )
    ));

    public static List<QuestionLamport> getQuestionLamports() {
        return questionLamports;
    }

    public static QuestionLamport getQuestionLamportByID(int id) {
        for (QuestionLamport questionLamport : questionLamports) {
            if (questionLamport.getId() == id) {
                return questionLamport;
            }
        }

        return null;
    }
}
