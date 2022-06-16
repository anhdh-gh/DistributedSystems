package algorithms.dong_thuan_phan_tan;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import lombok.Getter;

@Getter
public class QuestionDongThuanPhanTan {
    
    private final int id;
    private final int soTienTrinh;
    private final String[][] deBai;
    private final String[] result_1;
    private final String[][] result_2;
    private final String[] result_final;

    private QuestionDongThuanPhanTan(int id, int soTienTrinh, String[][] deBai, String[] result_1, String[][] result_2, String[] result_final) {
        this.id = id;
        this.soTienTrinh = soTienTrinh;
        this.deBai = deBai;
        this.result_1 = result_1;
        this.result_2 = result_2;
        this.result_final = result_final;
    }

    private static final List<QuestionDongThuanPhanTan> questionDongThuanPhanTans = new ArrayList<>(Arrays.asList(
        new QuestionDongThuanPhanTan(
            1,
            4,
            new String[][]{
                {"180", "281", "382", "483"},
                {"Không lỗi", "Lỗi", "Không lỗi", "Không lỗi"}
            },
            new String[]{"180,Nil,382,483", "180,281,382,483", "180,Nil,382,483", "180,Nil,382,483"},
            new String[][]{
                {"Nil,Nil,Nil,Nil", "180,Nil,382,483", "180,Nil,382,483", "180,Nil,382,483"},
                {"180,Nil,382,483", "180,Nil,382,483", "Nil,Nil,Nil,Nil", "Nil,Nil,Nil,Nil"},
                {"180,Nil,382,483", "180,Nil,382,483", "180,Nil,382,483", "180,Nil,382,483"}
            },
            new String[]{"180,Unknown,382,483", "180,Unknown,382,483", "180,Unknown,382,483", "180,Unknown,382,483"}
        )
    ));

    public static List<QuestionDongThuanPhanTan> getQuestionDongThuanPhanTans() {
        return questionDongThuanPhanTans;
    }
    
    public static QuestionDongThuanPhanTan getQuestionDongThuanPhanTanByID(int id) {
        for (QuestionDongThuanPhanTan questionDongThuanPhanTan : questionDongThuanPhanTans) {
            if(questionDongThuanPhanTan.getId() == id)
                return questionDongThuanPhanTan;
        }
        
        return null;
    }
}
