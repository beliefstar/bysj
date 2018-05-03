package com.depth.management.mapper;

import com.depth.management.model.Attendance;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.Date;
import java.util.List;

public interface AttendanceMapper extends Mapper<Attendance> {

    List<Attendance> findByDateUuid(@Param("uuid") String uuid);

    Integer checkKey(@Param("key") String key);

    void updateByDateUuidAndEmpId(@Param("empId") Long empId, @Param("uuid") String uuid, @Param("endTime") Date endTime);
}
