package com.depth.management.service.impl;

import com.depth.management.common.vo.AttendanceVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class AttendanceServiceImplTest {


    @Autowired
    private AttendanceServiceImpl service;

    @Test
    public void findByDepartmentId() {
        List<AttendanceVo> byDepartmentId = null;
        try {
            byDepartmentId = service.findByDepartmentId(12L, null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(byDepartmentId);
    }
}