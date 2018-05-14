package com.depth.management.controller;

import com.depth.management.common.Common;
import com.depth.management.common.vo.AttendanceVo;
import com.depth.management.common.vo.Result;
import com.depth.management.model.*;
import com.depth.management.service.AttendanceService;
import com.depth.management.service.DepartmentService;
import com.depth.management.service.SalaryHistoryService;
import com.depth.management.service.SalaryService;
import com.depth.management.session.LoginInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
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

    @Autowired
    private DepartmentService departmentService;

    private String view(String str) {
        return "/salary/" + str;
    }

    @GetMapping("/base")
    public String base(Long departmentId, LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();

        boolean flag = loginEmp.getId().equals(23L);
        List<Salary> list;
        if (flag) {
            if (departmentId == null || departmentId.equals(0L)) {
                list = salaryService.findAll();
            } else {
                list = salaryService.findListByDepartmentId(departmentId);
                modelMap.put("departmentId", departmentId);
            }
            List<Department> de = departmentService.findAll();
            modelMap.put("departmentList", de);
        } else {
            list = salaryService.findListByDepartmentId(loginEmp.getDepartmentId());
        }

        modelMap.put("flag", flag);
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
    public Result adjustBase(Salary salary, LoginInfo loginInfo) {
        Result result = new Result();
        final Emp loginEmp = loginInfo.getEmp();
        salaryService.update(salary, loginEmp.getName());
        return result;
    }

    @GetMapping("/bonus")
    public String bonus(Long departmentId, LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();

        boolean flag = loginEmp.getId().equals(23L);
        List<Salary> list;
        if (flag) {
            if (departmentId == null || departmentId.equals(0L)) {
                list = salaryService.findAll();
            } else {
                list = salaryService.findListByDepartmentId(departmentId);
                modelMap.put("departmentId", departmentId);
            }
            List<Department> all = departmentService.findAll();
            modelMap.put("departmentList", all);
        } else {
            list = salaryService.findListByDepartmentId(loginEmp.getDepartmentId());
        }

        modelMap.put("flag", flag);
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
    public String attendanceUI(Long departmentId, String timeRange, LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();

        boolean flag = loginEmp.getId().equals(23L);

        if (flag) {
            if (departmentId == null || departmentId.equals(0L)) {
                departmentId = loginEmp.getDepartmentId();
            } else {
                modelMap.put("departmentId", departmentId);
            }
            List<Department> all = departmentService.findAll();
            modelMap.put("departmentList", all);
        }

        modelMap.put("flag", flag);

        AttendanceTime times = attendanceService.findAttendanceTime(departmentId);
        modelMap.put("time", times);

        //默认为前一个月
        timeRange = Common.genTimeRange(timeRange);

        List<AttendanceVo> attendances = attendanceService.findByDepartmentId(departmentId, timeRange);
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
    public Result updateAttendanceTime(Long departmentId, AttendanceTime time, LoginInfo loginInfo) {
        final Emp loginEmp = loginInfo.getEmp();
        Result result = new Result();
        if (departmentId == null) {
            time.setDepartmentId(loginEmp.getDepartmentId());
        } else {
            time.setDepartmentId(departmentId);
        }
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
        timeRange = Common.genTimeRange(timeRange);

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
