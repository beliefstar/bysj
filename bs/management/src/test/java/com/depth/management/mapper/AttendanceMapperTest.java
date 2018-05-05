package com.depth.management.mapper;

import com.depth.management.common.vo.AttendanceVo;
import com.depth.management.model.Attendance;
import com.depth.management.model.Emp;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.DigestUtils;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Random;

@RunWith(SpringRunner.class)
@SpringBootTest
public class AttendanceMapperTest {

    @Autowired
    private AttendanceMapper attendanceMapper;

    @Autowired
    private EmpMapper empMapper;

    @Test
    public void updateByDateUuidAndEmpId() throws ParseException, UnsupportedEncodingException {

        List<Emp> emps = empMapper.selectAll();
        Random r = new Random();
        for (Emp emp : emps) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            for (int i = 1; i < 31; i++) {
                String datestr = "2018/04/" + (i < 10 ? ("0" + i) : i);
                String start = datestr + " 0" + (8 + r.nextInt(2)) + ":00:00";
                Date parseS = sdf.parse(start);

                String end = datestr + " 1" + (6 + r.nextInt(2)) + ":00:00";
                Date parseE = sdf.parse(end);

                Attendance attendance = new Attendance();
                attendance.setEmpId(emp.getId());
                attendance.setStartTime(parseS);
                attendance.setEndTime(parseE);

                datestr += " 00:00:00";

                attendance.setCreateTime(sdf.parse(datestr));
                attendance.setCreateUser("api");
                attendance.setUpdateTime(parseS);
                attendance.setUpdateUser("api");

                attendanceMapper.insert(attendance);
            }
        }

    }

    @Test
    public void test() {
        List<Attendance> attendances = attendanceMapper.selectAll();
        SimpleDateFormat sdf = new SimpleDateFormat("HH");
        for (Attendance attendance : attendances) {
            String s = sdf.format(attendance.getStartTime());
            double stime = Double.parseDouble(s);
            String e = sdf.format(attendance.getEndTime());
            double etime = Double.parseDouble(e);

            double h = etime - stime;

            attendance.setHour(h);
            attendanceMapper.updateByPrimaryKeySelective(attendance);
        }
    }

    @Test
    public void test2() {
        List<Attendance> attendances = attendanceMapper.selectAll();
        SimpleDateFormat sdf = new SimpleDateFormat("HH");
        for (Attendance attendance : attendances) {
            String s = sdf.format(attendance.getStartTime());
            Integer stime = Integer.parseInt(s);

            if (stime > 8) {
                attendance.setLast("1");
            } else {
                attendance.setLast("0");
            }

            attendanceMapper.updateByPrimaryKeySelective(attendance);
        }
    }

    @Test
    public void attentTest() throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String s = "2018/04/15";
        Date date = sdf.parse(s);
        s = "2018/04/30";
        Date date1 = sdf.parse(s);
        List<AttendanceVo> byEmpIds = attendanceMapper.findVoByEmpIds(Arrays.asList(1L, 2L, 3L), 9, null, null);
        System.out.println(byEmpIds);
    }
}