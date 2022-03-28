package util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class DateTimeUtil {

    private static final long TICKS_AT_EPOCH = 621355968000000000L;
    private static final long TICKS_PER_MILLISECOND = 10000;

    private DateTimeUtil() {
    }

    public static long getUTCTicks(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return (calendar.getTimeInMillis() * TICKS_PER_MILLISECOND) + TICKS_AT_EPOCH;
    }

    public static Date getDate(long UTCTicks) {
        return new Date((UTCTicks - TICKS_AT_EPOCH) / TICKS_PER_MILLISECOND);
    }

    public static String getDateTimeStringUTCFormat(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
        return sdf.format(date);
    }
}
