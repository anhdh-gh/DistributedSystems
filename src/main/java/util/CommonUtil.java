package util;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class CommonUtil {

    private CommonUtil() {
    }

    public static boolean contains(List<List<Float>> list, List<Float> lj) {
        List<Float> ljTempt = new ArrayList<>(lj);
        ljTempt.sort((i, j) -> Float.compare(i, j));

        for (List<Float> li : list) {

            List<Float> liTempt = new ArrayList<>(li);
            liTempt.sort((i, j) -> Float.compare(i, j));

            if (li.size() != lj.size()) {
                continue;
            }

            boolean equal = true;
            for (int i = 0; i < liTempt.size(); i++) {
                if (!Objects.equals(liTempt.get(i), ljTempt.get(i))) {
                    equal = false;
                    break;
                }
            }
            if (equal == true) {
                return true;
            }
        }

        return false;
    }
}
