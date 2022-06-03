package cn.edu.zjou.jin.codeutil;

import java.text.ParseException;
import java.util.Date;

public class DateUtil {

    public static int dateCompute(Date startDate, Date endDate) {
//        DateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd");
//        Date startDate = simpleFormat.parse(date1);
//        Date endDate = simpleFormat.parse(date2);
        long startTime = startDate.getTime();
        long endTime = endDate.getTime();
        int days = (int) ((endTime - startTime) / (1000 * 60 * 60 * 24));
        return days;
    }

    public static void main(String[] args) throws ParseException {
//        int days = DateUtil.dateCompute();
//        System.out.println(days);
    }
}
