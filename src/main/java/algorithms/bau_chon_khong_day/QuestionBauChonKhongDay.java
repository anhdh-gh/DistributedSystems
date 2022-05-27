package algorithms.bau_chon_khong_day;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import lombok.Getter;

@Getter
public class QuestionBauChonKhongDay {

    private final int id;
    private final int so_tien_trinh;
    private final String[][] deBai;
    private final String[][] dapAn;

    private QuestionBauChonKhongDay(int id, int so_tien_trinh, String[][] deBai, String[][] dapAn) {
        this.id = id;
        this.so_tien_trinh = so_tien_trinh;
        this.deBai = deBai;
        this.dapAn = dapAn;
    }

    public static List<QuestionBauChonKhongDay> getQuestionBauChonKhongDays() {
        return questionBauChonKhongDays;
    }

    private static final List<QuestionBauChonKhongDay> questionBauChonKhongDays = new ArrayList<>(Arrays.asList(new QuestionBauChonKhongDay(
                    1,
                    20,
                    new String[][]{
                        {"11", "15", "14", "12", "21", "25", "18", "22", "29", "32", "36", "24", "38", "41", "31", "33", "45", "48", "37", "40"},
                        {"", "P1", "P1", "P2", "P2", "P3", "P3", "P3", "P4", "P4", "P5", "P5", "P5", "P6", "P6", "P7", "P7", "P7", "P8", "P10"}
                    },
                    new String[][]{
                        {"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "P18,48 (được chọn)", "", ""},
                        {"P20,40", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"P18,48", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P20,40", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P13,38", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P14,41", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P18,48", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P19,37", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "P9,29", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "P20,40", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "P11,36", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "P12,24", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "P13,38", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "P14,41", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "P15,31", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "P16,33", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "P17,45", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "P18,48", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "P19,37", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "", "", "P20,40", "", "", "", "", "", "", "", "", "", ""}

                    }
            ),
            new QuestionBauChonKhongDay(
                    2,
                    20,
                    new String[][]{
                        {"12", "14", "19", "23", "18", "24", "29", "32", "28", "31", "38", "43", "35", "40", "48", "52", "44", "46", "57", "63"},
                        {"", "P1", "P1", "P2", "P3", "P4", "P4", "P5", "P6", "P6", "P7", "P8", "P8", "P9", "P10", "P10", "P11", "P12", "P12", "P14"}},
                    new String[][]{
                        {"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "P20,63 (được chọn)"},
                        {"P20,63", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"P19,57", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P20,63", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P19,57", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "P20,63", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "P17,44", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "P19,57", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "P20,63", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "P16,52", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "P17,44", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "P19,57", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "P13,35", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "", "P20,63", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "", "", "P15,48", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "", "", "P16,52", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "", "", "", "P17,44", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "", "", "", "", "P18,46", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "", "", "", "", "P19,57", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "", "", "", "", "", "", "P20,63", "", "", "", "", "", ""}}
            ),
            new QuestionBauChonKhongDay(
                    3,
                    20,
                    new String[][]{
                        {"15", "23", "24", "31", "32", "39", "37", "44", "47", "54", "51", "58", "61", "68", "64", "71", "75", "83", "80", "87"},
                        {"", "P1", "P1", "P2", "P2", "P2", "P2", "P2", "P2", "P2", "P3", "P3", "P3", "P3", "P3", "P3", "P3", "P3", "P4", "P6"}},
                    new String[][]{
                        {"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "P20,87 (được chọn)"},
                        {"P20,87", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"P18,83", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P19,80", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P5,32", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P20,87", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P7,37", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P8,44", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P9,47", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P10,54", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P11,51", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P12,58", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P13,61", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P14,68", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P15,64", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P16,71", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P17,75", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P18,83", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "P19,80", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "P20,87", "", "", "", "", "", "", "", "", "", "", "", "", "", ""}}
            ),
            new QuestionBauChonKhongDay(
                    4,
                    20,
                    new String[][]{
                        {"17", "25", "24", "31", "32", "39", "37", "44", "47", "54", "51", "58", "61", "68", "67", "73", "77", "84", "80", "87"},
                        {"", "P1", "P1", "P2", "P2", "P2", "P2", "P2", "P2", "P2", "P2", "P3", "P3", "P3", "P3", "P3", "P3", "P3", "P3", "P6"}},
                    new String[][]{
                        {"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "P20,87 (được chọn)"},
                        {"P20,87", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"P18,84", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P4,31", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P5,32", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P20,87", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P7,37", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P8,44", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P9,47", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P10,54", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P11,51", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P12,58", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P13,61", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P14,68", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P15,67", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P16,73", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P17,77", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P18,84", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P19,80", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "P20,87", "", "", "", "", "", "", "", "", "", "", "", "", "", ""}}
            ),
            new QuestionBauChonKhongDay(
                    5,
                    20,
                    new String[][]{
                        {"15", "21", "18", "24", "27", "32", "28", "33", "39", "45", "40", "44", "50", "56", "49", "55", "63", "68", "60", "64"},
                        {"", "P1", "P1", "P2", "P2", "P2", "P2", "P3", "P3", "P3", "P3", "P4", "P4", "P4", "P4", "P5", "P5", "P5", "P5", "P8"}},
                    new String[][]{
                        {"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "P18,68 (được chọn)", "", ""},
                        {"P18,68", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"P20,64", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P14,56", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P18,68", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P6,32", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P7,28", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P20,64", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P9,39", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P10,45", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P11,40", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "P12,44", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "P13,50", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "P14,56", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "P15,49", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "P16,55", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "P17,63", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "P18,68", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "P19,60", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "P20,64", "", "", "", "", "", "", "", "", "", "", "", ""}}
            ),
            new QuestionBauChonKhongDay(
                    6,
                    20,
                    new String[][]{
                        {"16", "26", "27", "36", "35", "44", "45", "54", "53", "62", "63", "72", "71", "78", "79", "88", "87", "96", "97", "106"},
                        {"", "P1", "P1", "P2", "P3", "P4", "P5", "P6", "P7", "P8", "P9", "P10", "P11", "P12", "P13", "P14", "P15", "P16", "P17", "P18"}},
                    new String[][]{
                        {"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "P20,106 (được chọn)"},
                        {"P20,106", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"P19,97", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P20,106", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P19,97", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "P20,106", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "P19,97", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "P20,106", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "P19,97", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "P20,106", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "", "P19,97", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "", "", "P20,106", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "", "", "", "P19,97", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "", "", "", "", "P20,106", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "", "", "", "", "", "P19,97", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "", "", "", "", "", "", "P20,106", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "", "", "", "", "", "", "", "P19,97", "", "", "", "", ""},
                        {"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "P20,106", "", "", "", ""},
                        {"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "P19,97", "", "", ""},
                        {"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "P20,106", "", ""}}
            ),
            new QuestionBauChonKhongDay(
                    7,
                    20,
                    new String[][]{
                        {"15", "21", "22", "26", "29", "36", "33", "37", "43", "48", "44", "51", "56", "61", "58", "62", "68", "75", "69", "73"},
                        {"", "P1", "P1", "P2", "P2", "P2", "P2", "P2", "P3", "P3", "P3", "P3", "P3", "P4", "P4", "P4", "P4", "P4", "P5", "P7"}},
                    new String[][]{
                        {"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "P18,75 (được chọn)", "", ""},
                        {"P18,75", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"P13,56", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P18,75", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P19,69", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P6,36", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P20,73", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P8,37", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P9,43", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P10,48", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P11,44", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P12,51", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P13,56", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "P14,61", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "P15,58", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "P16,62", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "P17,68", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "P18,75", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "P19,69", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "P20,73", "", "", "", "", "", "", "", "", "", "", "", "", ""}}
            ),
            new QuestionBauChonKhongDay(
                    8,
                    16,
                    new String[][]{
                        {"15", "21", "18", "26", "29", "34", "33", "37", "41", "48", "44", "49", "54", "61", "55", "60"},
                        {"", "P1", "P1", "P2", "P2", "P2", "P2", "P3", "P3", "P3", "P3", "P3", "P4", "P4", "P4", "P7"}},
                    new String[][]{
                        {"", "", "", "", "", "", "", "", "", "", "", "", "", "P14,61 (được chọn)", "", ""},
                        {"P14,61", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"P12,49", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P14,61", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P5,29", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P6,34", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "P16,60", "", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P8,37", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P9,41", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P10,48", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P11,44", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "P12,49", "", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "P13,54", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "P14,61", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "P15,55", "", "", "", "", "", "", "", "", "", "", "", ""},
                        {"", "", "", "", "", "", "P16,60", "", "", "", "", "", "", "", "", ""}}
            )
    ));
    
    public static QuestionBauChonKhongDay getQuestionBauChonById(int id) {
        for (QuestionBauChonKhongDay questionBauChonKhongDay : questionBauChonKhongDays) 
            if(questionBauChonKhongDay.getId() == id)
                return questionBauChonKhongDay;
        return null;
    }
}

/*
- Cột đầu đầu: =IF(Sheet1!B2<>"", CHAR(123) & CHAR(34) & Sheet1!B2 & CHAR(34) & CHAR(44),   CHAR(123) & CHAR(34) & CHAR(34) & CHAR(44))
- Các cột giữa: =IF(Sheet1!E2<>"", CHAR(34) & Sheet1!E2 & CHAR(34) & CHAR(44),  CHAR(34) & CHAR(34) & CHAR(44))
- Cột cuối: =IF(Sheet2!P1<>"",  CHAR(34) & Sheet2!P1 & CHAR(34) & CHAR(125) &  CHAR(44),  CHAR(34) & CHAR(34) & CHAR(125) & CHAR(44))
- Ô cuối cùng ở góc phải bên dưới: =IF(Sheet2!P1<>"",  CHAR(34) & Sheet2!P1 & CHAR(34) & CHAR(125) &  CHAR(44),  CHAR(34) & CHAR(34) & CHAR(125) & CHAR(44))
 */
