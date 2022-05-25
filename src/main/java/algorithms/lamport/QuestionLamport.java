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
            new int[][] {
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
            new int[][] {
                {0, 6, 12, 18, 24, 30, 36, 42, 48, 70, 76},
                {0, 8, 16, 24, 32, 40, 48, 61, 69, 77, 85},
                {0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100}
            } 
        )
    ));

    public static List<QuestionLamport> getQuestionLamports() {
        return questionLamports;
    }
    
    public static QuestionLamport getQuestionLamportByID(int id) {
        for (QuestionLamport questionLamport : questionLamports) {
            if(questionLamport.getId() == id)
                return questionLamport;
        }
        
        return null;
    }    
}