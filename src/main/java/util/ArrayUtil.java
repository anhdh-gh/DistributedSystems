package util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;
import org.apache.commons.math3.util.CombinatoricsUtils;
import static util.CommonUtil.contains;

public class ArrayUtil {

    private ArrayUtil() {}

    public static List<List<Float>> findASubsetWithKElementsWhoseSumIsS(List<Float> array, int k, float s) {
        // Tìm ra các tập con có k phần tử
        List<List<Float>> list = new ArrayList<>();
        Iterator<int[]> iterator = CombinatoricsUtils.combinationsIterator(array.size(), k);
        while (iterator.hasNext()) {
            final int[] combination = iterator.next();
            list.add(Arrays.stream(combination).boxed().collect(Collectors.toList()).stream().map(i -> array.get(i)).collect(Collectors.toList()));
        }

        // Loại bỏ các tập trùng nhau và tổng != s
        List<List<Float>> result = new ArrayList<>();
        for (List<Float> li : list) {
            float sum = 0;
            for (Float f : li) 
                sum += f;
            if (sum == s && !contains(result, li))
                result.add(li);
        }   
        
        return result;
    }
    
    public static List<List<Float>> findSubsetsWhoseSumIsS(List<Float> array, float s) {
        List<List<Float>> result = new ArrayList<>();
        for(int i = 1 ; i <= array.size() ; i++) {
            List<List<Float>> res = findASubsetWithKElementsWhoseSumIsS(array, i, s);
            for (List<Float> re : res)
                result.add(re);
        }
        
        return result;
    }
}