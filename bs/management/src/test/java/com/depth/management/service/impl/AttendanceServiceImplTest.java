package com.depth.management.service.impl;


import com.depth.management.mapper.AttendanceMapper;
import com.depth.management.model.AttendanceTime;
import com.depth.management.model.Department;
import com.depth.management.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


public class AttendanceServiceImplTest {

    private DepartmentService service;

    private AttendanceMapper attendanceMapper;


    public void doAttendance() {
        List<Department> all = service.findAll();
        AttendanceTime time = attendanceMapper.findAttendanceTime(12L);
        for (Department department : all) {
            time.setDepartmentId(department.getDepartmentId());
            attendanceMapper.saveTime(time);
        }
    }
}
