package com.depth.management.controller;

import com.depth.management.common.vo.AttendanceVo;
import com.depth.management.common.vo.Result;
import com.depth.management.model.*;
import com.depth.management.service.AttendanceService;
import com.depth.management.service.SalaryHistoryService;
import com.depth.management.service.SalaryService;
import com.depth.management.session.LoginInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/salary")
public class SalaryController {

    @Autowired
    private SalaryService salaryService;

    @Autowired
    private SalaryHistoryService salaryHistoryService;

    @Autowired
    private AttendanceService attendanceService;

    private String view(String str) {
        return "/salary/" + str;
    }

    @GetMapping("/base")
    public String base(LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();
        List<Salary> list = salaryService.findListByDepartmentId(loginEmp.getDepartmentId());
        modelMap.put("list", list);
        return view("base_list");
    }

    @GetMapping("/view")
    public String view(Long id, ModelMap modelMap, LoginInfo loginInfo) {
        final Emp logEmp = loginInfo.getEmp();
        if (id == null) {
            id = logEmp.getId();
        }
        Salary sa = salaryService.findByEmpId(id);
        modelMap.put("salary", sa);

        List<SalaryHistory> sh = salaryHistoryService.findByEmpId(id);
        modelMap.put("sh", sh);

        return view("view");
    }

    @PostMapping("/adjustBase")
    @ResponseBody
    public Result adjustBase(Salary salary, Integer oldBase, LoginInfo loginInfo) {
        Result result = new Result();
        final Emp loginEmp = loginInfo.getEmp();
        salaryService.update(salary, loginEmp.getName());
        SalaryHistory sh = new SalaryHistory();
        sh.setEmpId(salary.getEmpId());
        sh.setSalary(oldBase);
        sh.setComment(salary.getComment());
        salaryHistoryService.save(sh, loginEmp.getName());
        return result;
    }

    @GetMapping("/bonus")
    public String bonus(LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();
        List<Salary> list = salaryService.findListByDepartmentId(loginEmp.getDepartmentId());
        modelMap.put("list", list);
        return view("bonus_list");
    }

    @PostMapping("/adjustBonusAnSubsidy")
    @ResponseBody
    public Result adjustBonusAnSubsidy(Salary salary, LoginInfo loginInfo) {
        Result result = new Result();
        salaryService.update(salary, loginInfo.getEmp().getName());
        return result;
    }

    @GetMapping("/attendance")
    public String attendanceUI(String timeRange, LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();
        AttendanceTime times = attendanceService.findAttendanceTime(loginEmp.getDepartmentId());
        modelMap.put("time", times);

        //默认为前一个月
        timeRange = genTimeRange(timeRange);

        List<AttendanceVo> attendances = attendanceService.findByDepartmentId(loginEmp.getDepartmentId(), timeRange);
        modelMap.put("attendances", attendances);

        String weekDay = attendanceService.findWeekDay();
        List<String> weeks = Arrays.asList(weekDay.split(","));
        modelMap.put("weekdays", weeks);

        modelMap.put("timeRange", timeRange);

        List<Holiday> holidayAll = attendanceService.findHolidayAll();
        modelMap.put("holidays", holidayAll);

        return view("attendance");
    }

    @PostMapping("/updateAttendanceTime")
    @ResponseBody
    public Result updateAttendanceTime(AttendanceTime time, LoginInfo loginInfo) {
        final Emp loginEmp = loginInfo.getEmp();
        Result result = new Result();
        time.setDepartmentId(loginEmp.getDepartmentId());
        attendanceService.updateAttendanceTime(time);
        return result;
    }

    @GetMapping("/attendance/view")
    public String showAttendanceDetailUI(Long empId,String timeRange, LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();
        if (empId == null) {
            empId = loginEmp.getId();
        }
        modelMap.put("empId", empId);

        AttendanceTime times = attendanceService.findAttendanceTime(loginEmp.getDepartmentId());
        modelMap.put("time", times);

        //默认为前一个月
        timeRange = genTimeRange(timeRange);

        modelMap.put("timeRange", timeRange);

        String weekDay = attendanceService.findWeekDay();
        List<String> weeks = Arrays.asList(weekDay.split(","));
        modelMap.put("weekdays", weeks);

        List<Holiday> holidayAll = attendanceService.findHolidayAll();
        modelMap.put("holidays", holidayAll);

        List<Attendance> byEmpId = attendanceService.findByEmpId(empId, timeRange);
        modelMap.put("attendanceList", byEmpId);
        return view("attendance_detail");
    }

    private String genTimeRange(String timeRange) {
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

    @PostMapping("/updateWeekDay")
    @ResponseBody
    public Result updateWeekDay(String weekday) {
        Result result = new Result();
        attendanceService.updateWeekDay(weekday);
        return result;
    }

    @PostMapping("/addHoliday")
    @ResponseBody
    public Result addHoliday(Holiday holiday) {
        Result result = new Result();
        System.out.println(holiday);
        attendanceService.addHoliday(holiday);
        return result;
    }

}
