package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {

    private static final long TICKS_AT_EPOCH = 621356220000000000L;
    private static final long TICKS_PER_MILLISECOND = 10000;
    private static final SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");

    private DateUtil() {
    }

    // Get tick theo utc
    public static long getUTCTicks(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return (calendar.getTimeInMillis() * TICKS_PER_MILLISECOND) + TICKS_AT_EPOCH;
    }

    public static Date getDate(long UTCTicks) {
        return new Date((UTCTicks - TICKS_AT_EPOCH) / TICKS_PER_MILLISECOND);
    }

    public static Date parse(String str) {
        try {
            return formater.parse(str);
        } catch (ParseException ex) {
            return null;
        }
    }

    public static String getDateTimeStringFormat(Date date) {
        return formater.format(date);
    }
}
