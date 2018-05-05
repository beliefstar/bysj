package com.depth.management.service;

import com.depth.management.common.vo.AttendanceVo;
import com.depth.management.model.Attendance;
import com.depth.management.model.AttendanceTime;
import com.depth.management.model.Holiday;

import java.util.Date;
import java.util.List;

public interface AttendanceService {

    void doAttendance(String key, Long empId);

    List<AttendanceVo> findByDepartmentId(Long departmentId, String timeRange);

    List<Attendance> findByEmpId(Long empId, String timeRange);

    AttendanceTime findAttendanceTime(Long departmentId);

    void updateAttendanceTime(AttendanceTime time);

    boolean checkHasDayData(Date date);

    String findWeekDay();

    void updateWeekDay(String weekday);

    void addHoliday(Holiday holiday);

    List<Holiday> findHolidayAll();
}
