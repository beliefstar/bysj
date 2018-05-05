package com.depth.management.api;


import com.depth.management.common.vo.Result;
import com.depth.management.mapper.AttendanceMapper;
import com.depth.management.model.Attendance;
import com.depth.management.model.Emp;
import com.depth.management.model.Holiday;
import com.depth.management.service.AttendanceService;
import com.depth.management.service.EmpService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.PostConstruct;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
public class AttendanceApi {

    public static String getDateUuid() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String format = sdf.format(new Date());
        return DigestUtils.md5DigestAsHex(format.getBytes());
    }

    private Logger logger = LoggerFactory.getLogger(AttendanceApi.class);

    @Autowired
    private AttendanceService attendanceService;

    @Autowired
    private AttendanceMapper attendanceMapper;

    @Autowired
    private EmpService empService;

    @GetMapping("/attendance/{key}/{empId}")
    public Result api(@PathVariable("key") String key, @PathVariable("empId") Long empId) {
        Result result = new Result();
        attendanceService.doAttendance(key, empId);
        return result;
    }

    @PostConstruct
    public void cycleDate() {
        Timer timer = new Timer();

        //间隔24小时插入一次考勤数据
        timer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                writeData();
            }
        }, 10000, 86400000);
    }

    private void writeData() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd-HH:mm:ss");
        String format = sdf.format(date);
        String[] split = format.split("-");
        format = split[0] + "-00:00:00";
        Date parse = null;
        try {
            parse = sdf.parse(format);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if (parse == null) {
            logger.error("日期解析错误");
            return;
        }

        boolean flag = attendanceService.checkHasDayData(parse);
        if (flag) {
            logger.info("已经有" + date + "的考勤数据");
            return;
        }

        boolean flag2 = checkDay(parse);

        if (!flag2) {
            logger.info("节假日,不考勤");
            return;
        }

        logger.info("开始写入" + date + "的考勤数据");

        List<Emp> emps = empService.findAll();
        for (Emp emp : emps) {
            Attendance attendance = new Attendance();
            attendance.setEmpId(emp.getId());

            attendance.setCreateTime(parse);
            attendance.setCreateUser("api");
            attendance.setUpdateTime(date);
            attendance.setUpdateUser("api");
            attendanceMapper.insert(attendance);
        }
    }

    private boolean checkDay(Date date){
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        int dayForWeek = 0 ;
        if (c.get(Calendar.DAY_OF_WEEK) == 1 ){
            dayForWeek = 7 ;
        }else {
            dayForWeek = c.get(Calendar.DAY_OF_WEEK) - 1 ;
        }

        String weekDay = attendanceService.findWeekDay();
        String res = Integer.toString(dayForWeek);
        if (weekDay.contains(res)) {
            return false;
        }
        List<Holiday> holidayAll = attendanceService.findHolidayAll();
        for (Holiday holiday : holidayAll) {
            if (holiday.getWeekDate().equals(date)) {
                return false;
            }
        }
        return true;
    }
}
