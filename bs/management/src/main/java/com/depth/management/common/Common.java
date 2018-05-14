package com.depth.management.common;

import org.springframework.util.StringUtils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Common {


    public static String genTimeRange(String timeRange) {
        if (StringUtils.isEmpty(timeRange)) {
            Date date = new Date();
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            calendar.add(Calendar.MONTH, -1);
            calendar.set(Calendar.DAY_OF_MONTH, 1);
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
            String format = sdf.format(calendar.getTime());
            calendar.add(Calendar.MONTH, 1);
            calendar.add(Calendar.DAY_OF_MONTH, -1);
            String c = sdf.format(calendar.getTime());
            return format +"-" + c;
        }
        return timeRange;
    }
}
