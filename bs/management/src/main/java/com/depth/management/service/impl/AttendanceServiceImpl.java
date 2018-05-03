package com.depth.management.service.impl;

import com.depth.management.api.AttendanceApi;
import com.depth.management.common.exception.ServiceException;
import com.depth.management.mapper.AttendanceMapper;
import com.depth.management.model.Attendance;
import com.depth.management.service.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.Date;
import java.util.List;

@Service
public class AttendanceServiceImpl implements AttendanceService {

    @Autowired
    private AttendanceMapper attendanceMapper;

    @Override
    public void doAttendance(String key, Long empId) {
        if (empId == null)
            throw new ServiceException("ID为空");
        if (key == null || "".equals(key))
            throw new ServiceException("key为空");

        try {
            key = DigestUtils.md5DigestAsHex(key.getBytes("UTF-8"));
            Integer integer = attendanceMapper.checkKey(key);
            if (integer <= 0)
                throw new ServiceException("key错误");

            Attendance attendance = new Attendance();
            attendance.setEmpId(empId);
            String uuid = AttendanceApi.getDateUuid();

            boolean flag = true;
            List<Attendance> attendances = attendanceMapper.findByDateUuid(uuid);
            if (!attendances.isEmpty()) {
                for (Attendance v : attendances) {
                    if (attendance.getEmpId().equals(v.getEmpId())) {
                        flag = false;
                    }
                }
            }
            Date date = new Date();
            if (flag) {
                attendance.setDateUuid(uuid);
                attendance.setStartTime(date);

                attendance.setCreateTime(date);
                attendance.setCreateUser("api");
                attendance.setUpdateTime(date);
                attendance.setUpdateUser("api");

                attendanceMapper.insert(attendance);
            } else {
                attendanceMapper.updateByDateUuidAndEmpId(attendance.getEmpId(), uuid, date);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
    }
}
