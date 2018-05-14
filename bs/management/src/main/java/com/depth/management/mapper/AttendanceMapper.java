package com.depth.management.mapper;

import com.depth.management.common.vo.AttendanceVo;
import com.depth.management.model.Attendance;
import com.depth.management.model.AttendanceTime;
import com.depth.management.model.Holiday;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.Date;
import java.util.List;

public interface AttendanceMapper extends Mapper<Attendance> {

    Integer checkKey(@Param("key") String key);

    List<AttendanceVo> findVoByEmpIds(@Param("ids") List<Long> ids, @Param("hour") Integer hour, @Param("lTime") Date lTime, @Param("rTime") Date rTime);

    List<AttendanceVo> findVoOutNumberByEmpIds(@Param("ids") List<Long> ids, @Param("lTime") Date lTime, @Param("rTime") Date rTime);

    AttendanceTime findAttendanceTime(@Param("departmentId") Long departmentId);

    void updateAttendanceTime(AttendanceTime time);

    String findWeekDay();

    void updateWeekDay(@Param("weekday") String weekday);

    void addHoliday(Holiday holiday);

    List<Holiday> findHolidayAll();

    void saveTime(AttendanceTime time);
}
