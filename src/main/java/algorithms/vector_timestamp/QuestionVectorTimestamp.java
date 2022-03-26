package algorithms.vector_timestamp;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class QuestionVectorTimestamp {

    private final int vector_id;
    private final String[][] deBai;
    private final List<String> listMes;
    private final String[][] res;

    private QuestionVectorTimestamp(int vector_id, String deBai00, String deBai10, String deBai20, List<String> listMes, String[][] res) {
        this.vector_id = vector_id;

        deBai = new String[3][9];
        for (int i = 0; i < 3; i++) {
            for (int j = 1; j < 9; j++) {
                deBai[i][j] = "e" + (i + 1) + "," + j;
            }
        }

        deBai[0][0] = deBai00;
        deBai[1][0] = deBai10;
        deBai[2][0] = deBai20;

        this.res = res;
        this.listMes = listMes;
    }

    private static final List<QuestionVectorTimestamp> questionVectorTimestamps = new ArrayList<>(Arrays.asList(
            new QuestionVectorTimestamp(
                    1,
                    "6,9,12",
                    "6,9,12",
                    "3,6,9",
                    Arrays.asList(
                            "e2,1 gửi và e3,2 nhận",
                            "e1,1 gửi và e2,2 nhận",
                            "e3,3 gửi và e2,4 nhận",
                            "e1,2 gửi và e3,4 nhận",
                            "e2,3 gửi và e1,4 nhận",
                            "e3,5 gửi và e1,6 nhận",
                            "e2,6 gửi và e3,7 nhận"
                    ),
                    new String[][]{
                        {"6,9,12", "7,9,12", "8,9,12", "9,9,12", "10,12,12", "11,12,12", "12,12,15", "13,12,15", "14,12,15"}, // P1
                        {"6,9,12", "6,10,12", "7,11,12", "7,12,12", "7,13,13", "7,14,13", "7,15,13", "7,16,13", "7,17,13"}, // P2
                        {"3,6,9", "3,6,10", "6,10,12", "6,10,13", "8,10,14", "8,10,15", "8,10,16", "8,15,17", "8,15,18"} // P3
                    }
            ),
            new QuestionVectorTimestamp(
                    2,
                    "8,11,14",
                    "10,13,16",
                    "10,13,16",
                    Arrays.asList(
                            "e2,1 gửi và e3,2 nhận",
                            "e1,1 gửi và e2,2 nhận",
                            "e3,3 gửi và e2,4 nhận",
                            "e1,2 gửi và e3,4 nhận",
                            "e2,3 gửi và e1,4 nhận",
                            "e3,5 gửi và e1,6 nhận",
                            "e2,6 gửi và e3,7 nhận"
                    ),
                    new String[][]{
                        {"8,11,14", "9,11,14", "10,11,14", "11,11,14", "12,16,16", "13,16,16", "14,16,21", "15,16,21", "16,16,21"}, // P1
                        {"10,13,16", "10,14,16", "10,15,16", "10,16,16", "10,17,19", "10,18,19", "10,19,19", "10,20,19", "10,21,19"}, // P2
                        {"10,13,16", "10,13,17", "10,14,18", "10,14,19", "10,14,20", "10,14,21", "10,14,22", "10,19,23", "10,19,24"} // P3
                    }
            ),
            new QuestionVectorTimestamp(
                    3,
                    "7,19,10",
                    "7,12,9",
                    "9,19,9",
                    Arrays.asList(
                            "e1,1 gửi và e3,4 nhận",
                            "e1,2 gửi và e3,3 nhận",
                            "e3,2 gửi và e2,3 nhận",
                            "e1,4 gửi và e3,5 nhận",
                            "e3,4 gửi và e2,5 nhận",
                            "e2,4 gửi và e1,6 nhận",
                            "e3,5 gửi và e2,6 nhận",
                            "e3,6 gửi và e2,7 nhận",
                            "e2,6 gửi và e3,8 nhận",
                            "e1,7 gửi và e2,8 nhận"
                    ),
                    new String[][]{
                        {"7,19,10", "8,19,10", "9,19,10", "10,19,10", "11,19,10", "12,19,10", "13,20,11", "14,20,11", "15,20,11"}, // P1
                        {"7,12,9", "7,13,9", "7,14,9", "9,19,11", "9,20,11", "9,21,13", "11,22,14", "11,23,15", "14,24,15"}, // P2
                        {"9,19,9", "9,19,10", "9,19,11", "9,19,12", "9,19,13", "11,19,14", "11,19,15", "11,19,16", "11,22,17"} // P3
                    }
            ),
            new QuestionVectorTimestamp(
                    4,
                    "9,12,15",
                    "9,12,15",
                    "3,6,9",
                    Arrays.asList(
                            "e1,1 gửi và e2,2 nhận",
                            "e3,1 gửi và e1,2 nhận",
                            "e3,2 gửi và e2,4 nhận",
                            "e1,3 gửi và e3,4 nhận",
                            "e2,3 gửi và e1,4 nhận",
                            "e2,5 gửi và e3,6 nhận",
                            "e1,6 gửi và e2,7 nhận"
                    ),
                    new String[][]{
                        {"9,12,15", "10,12,15", "11,12,15", "12,12,15", "13,15,15", "14,15,15", "15,15,15", "16,15,15", "17,15,15"}, // P1
                        {"9,12,15", "9,13,15", "10,14,15", "10,15,15", "10,16,15", "10,17,15", "10,18,15", "15,19,15", "15,20,15"}, // P2
                        {"3,6,9", "3,6,10", "3,6,11", "3,6,12", "12,12,15", "12,12,16", "12,17,17", "12,17,18", "12,17,19"} // P3
                    }
            )
    ));

    public int getVector_id() {
        return vector_id;
    }

    public String[][] getDeBai() {
        return deBai;
    }

    public List<String> getListMes() {
        return listMes;
    }

    public String[][] getRes() {
        return res;
    }

    public static List<QuestionVectorTimestamp> getQuestionVectorTimestamps() {
        return questionVectorTimestamps;
    }
    
    public static QuestionVectorTimestamp getQuestionVectorTimestampByVector_id(int vector_id) {
        for (QuestionVectorTimestamp questionVectorTimestamp : questionVectorTimestamps) {
            if(questionVectorTimestamp.getVector_id() == vector_id)
                return questionVectorTimestamp;
        }
        
        return null;
    }
}
