package com.depth.management.service.impl;

import com.depth.management.api.AttendanceApi;
import com.depth.management.common.exception.ServiceException;
import com.depth.management.common.vo.AttendanceVo;
import com.depth.management.mapper.AttendanceMapper;
import com.depth.management.model.Attendance;
import com.depth.management.model.AttendanceTime;
import com.depth.management.model.Emp;
import com.depth.management.model.Holiday;
import com.depth.management.service.AttendanceService;
import com.depth.management.service.EmpService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import tk.mybatis.mapper.entity.Example;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class AttendanceServiceImpl implements AttendanceService {

    private Logger logger = LoggerFactory.getLogger(AttendanceApi.class);

    @Autowired
    private AttendanceMapper attendanceMapper;

    @Autowired
    private EmpService empService;

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

            Example example = new Example(Attendance.class);
            Example.Criteria criteria = example.createCriteria();

            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd-HH:mm:ss");
            String format = sdf.format(date);
            String[] split = format.split("-");
            format = split[0] + "-00:00:00";
            Date parse;
            try {
                parse = sdf.parse(format);
            } catch (ParseException e) {
                e.printStackTrace();
                return;
            }

            criteria.andEqualTo("empId", empId);
            criteria.andEqualTo("createTime", parse);

            List<Attendance> count = attendanceMapper.selectByExample(example);
            if (count.size() <= 0) {
                logger.error(parse +"没有此" + empId + "的考勤记录");
                return;
            }

            Emp emp = empService.findById(empId);
            AttendanceTime time = attendanceMapper.findAttendanceTime(emp.getDepartmentId());

            Attendance attendance = count.get(0);
            SimpleDateFormat sdf2 = new SimpleDateFormat("HHmm");
            if (attendance.getStartTime() == null) {
                //上班
                attendance.setStartTime(date);

                String stime = sdf2.format(time.getStartTime());
                double s = Double.parseDouble(stime);
                String current = sdf2.format(date);
                double e = Double.parseDouble(current);

                if (e > s) {
                    attendance.setLast("1");
                } else {
                    attendance.setLast("0");
                }

                attendanceMapper.updateByPrimaryKeySelective(attendance);
                logger.info(emp.getName() + "打卡上班");
            } else {
                //下班
                attendance.setEndTime(date);

                String stime = sdf2.format(attendance.getStartTime());
                double s = Double.parseDouble(stime);
                String etime = sdf2.format(attendance.getEndTime());
                double e = Double.parseDouble(etime);

                double hour = (e - s) / 100;
                attendance.setHour(hour);
                attendanceMapper.updateByPrimaryKeySelective(attendance);
                logger.info(emp.getName() + "打卡下班");
            }


        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
    }

    @Override
    public List<AttendanceVo> findByDepartmentId(Long departmentId, String timeRange) {
        List<AttendanceVo> attendances;
        try {
            Date d1 = null;
            Date d2 = null;
            if (!StringUtils.isEmpty(timeRange)) {
                SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
                String[] split = timeRange.split("-");
                d1 = sdf.parse(split[0].trim());
                d2 = sdf.parse(split[1].trim());
            }

            List<Emp> emps = empService.findByDepartmentId(departmentId);
            List<Long> ids = emps.stream().map(Emp::getId).collect(Collectors.toList());
            AttendanceTime time = attendanceMapper.findAttendanceTime(departmentId);
            attendances = attendanceMapper.findVoByEmpIds(ids, time.getHour(), d1, d2);
            List<AttendanceVo> voOutNumber = attendanceMapper.findVoOutNumberByEmpIds(ids, d1, d2);
            for (AttendanceVo attendance : attendances) {
                for (Emp emp : emps) {
                    if (attendance.getEmpId().equals(emp.getId())) {
                        attendance.setEmp(emp);
                    }
                }
                for (AttendanceVo vo : voOutNumber) {
                    if (attendance.getEmpId().equals(vo.getEmpId())) {
                        attendance.setOutNumber(vo.getOutNumber());
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
        return attendances;
    }

    @Override
    public List<Attendance> findByEmpId(Long empId, String timeRange) {
        List<Attendance> attendances;
        try {
            Example example = new Example(Attendance.class);
            Example.Criteria criteria = example.createCriteria();

            if (!StringUtils.isEmpty(timeRange)) {
                SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
                String[] split = timeRange.split("-");
                Date d1 = sdf.parse(split[0].trim());
                Date d2 = sdf.parse(split[1].trim());
                criteria.andBetween("createTime", d1, d2);
            }

            Emp emp = empService.findById(empId);

            criteria.andEqualTo("empId", empId);

            attendances = attendanceMapper.selectByExample(example);
            for (Attendance attendance : attendances) {
                attendance.setEmp(emp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
        return attendances;
    }

    @Override
    public AttendanceTime findAttendanceTime(Long departmentId) {
        AttendanceTime time;
        try {
            time = attendanceMapper.findAttendanceTime(departmentId);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
        return time;
    }

    @Override
    public void updateAttendanceTime(AttendanceTime time) {
        try {
            attendanceMapper.updateAttendanceTime(time);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
    }

    @Override
    public boolean checkHasDayData(Date date) {
        Attendance a = new Attendance();
        a.setCreateTime(date);
        int count = 0;
        try {
            count = attendanceMapper.selectCount(a);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count > 0;
    }

    @Override
    public String findWeekDay() {
        return attendanceMapper.findWeekDay();
    }

    @Override
    public void updateWeekDay(String weekday) {
        attendanceMapper.updateWeekDay(weekday);
    }

    @Override
    public void addHoliday(Holiday holiday) {
        attendanceMapper.addHoliday(holiday);
    }

    @Override
    public List<Holiday> findHolidayAll() {
        return attendanceMapper.findHolidayAll();
    }

}
