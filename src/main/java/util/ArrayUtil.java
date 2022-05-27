package util;

import java.util.Arrays;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

public class ArrayUtil {

    private ArrayUtil() {
    }

    // Implementing Fisher–Yates shuffle
    public static int[] shuffleArray(int[] array) {
        int[] ar = Arrays.copyOf(array, array.length);
        
        // If running on Java 6 or older, use `new Random()` on RHS here
        Random rnd = ThreadLocalRandom.current();
        for (int i = ar.length - 1; i > 0; i--) {
            int index = rnd.nextInt(i + 1);
            // Simple swap
            int a = ar[index];
            ar[index] = ar[i];
            ar[i] = a;
        }
        
        return ar;
    }
}
