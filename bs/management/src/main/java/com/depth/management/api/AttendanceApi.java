package com.depth.management.api;


import com.depth.management.common.vo.Result;
import com.depth.management.service.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
public class AttendanceApi {

    public static String getDateUuid() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String format = sdf.format(new Date());
        return DigestUtils.md5DigestAsHex(format.getBytes());
    }

    @Autowired
    private AttendanceService attendanceService;

    @GetMapping("/attendance/{key}/{empId}")
    public Result api(@PathVariable("key") String key, @PathVariable("empId") Long empId) {
        Result result = new Result();
        attendanceService.doAttendance(key, empId);
        return result;
    }

}
