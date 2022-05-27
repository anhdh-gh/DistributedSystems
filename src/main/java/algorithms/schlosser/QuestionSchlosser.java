package algorithms.schlosser;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import lombok.Getter;

@Getter
public class QuestionSchlosser {
    
    private final int id;
    private final int soNut;
    private final int so_lang_gieng;
    private final int[][] result;

    private QuestionSchlosser(int id, int soNut, int so_lang_gieng, int[][] result) {
        this.id = id;
        this.soNut = soNut;
        this.so_lang_gieng = so_lang_gieng;
        this.result = result;
    }
    
    private static int getLengthBinary(int n) {
        int length = 0;
        while(Math.pow(2, length) < n) length++;        
        return length;
    }
    
    // Sinh xâu nhị phân từ 0 đến n
    private static String[] binary(int n) {
        String res[] = new String[n+1];
        
        // Độ dài của xâu nhị phân
        int doDai = getLengthBinary(n);

        
        // Khởi tạo xâu nhị phân cho số 0
        res[0] = "";
        for(int i = 0 ; i < doDai; i++)
            res[0] += "0";
        
        // Sinh các xâu nhị phân tiếp theo từ số 1 đến n
        for(int i = 1; i <= n ; i++) {
            int j;
            res[i] = "";
            for(j = res[i-1].length()-1; j >= 0; j--) {
                if(res[i-1].charAt(j) == '1')
                    res[i] = "0" + res[i];
                else
                    break;
            }
            if(j >= 0) {
                res[i] = "1" + res[i];
                while(j-- > 0) {
                    res[i] = res[i-1].charAt(j) + res[i];
                }
            }
        }
        
        return res;
    }
    
    // a và b là hai xâu nhị phân chỉ khác nhau duy nhất 1 bit
    // Trả về số thứ tự của bit khác nhau tính từ phải sang trái (bắt đầu từ 1)
    // Các trường hợp ngoại lệ khác trả về 0
    private static int compare(String a, String b) {
        if(a.equals(b) || a.length() != b.length())
            return 0;
        
        List<Integer> resCmp = new ArrayList<>();
        for(int i = a.length()-1 ; i >= 0 ; i--)
            if(a.charAt(i) != b.charAt(i))
                resCmp.add(a.length()-i);
        
        if(resCmp.size() == 1) 
            return resCmp.get(0);
        
        return 0;
    }
    
    private static int[][] getResult(int soNut) {
        String binary[] = QuestionSchlosser.binary(soNut-1);
        int[][] res = new int[soNut][soNut];
        
        for(int i = 0 ; i < binary.length ; i++) {
            for(int j = i; j < binary.length; j++) {
                int resCmp = compare(binary[i], binary[j]);
                if (resCmp > 0) {
                    res[i][j] = resCmp;
                    res[j][i] = resCmp;
                }
            }
        }
        
        return res;
    }
    
    private static final List<QuestionSchlosser> questionSchlossers = new ArrayList<>(Arrays.asList(
        new QuestionSchlosser(1, 4, getLengthBinary(4),getResult(4)),
        new QuestionSchlosser(2, 8, getLengthBinary(8),getResult(8)),
        new QuestionSchlosser(3, 16, getLengthBinary(16),getResult(16))
    ));

    public static List<QuestionSchlosser> getQuestionSchlossers() {
        return questionSchlossers;
    }
    
    public static QuestionSchlosser getQuestionSchlosserById(int id) {
        for (QuestionSchlosser questionSchlosser : questionSchlossers) 
            if(questionSchlosser.id == id)
                return questionSchlosser;
        return null;
    }
}
