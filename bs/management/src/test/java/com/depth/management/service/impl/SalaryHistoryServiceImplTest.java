package com.depth.management.service.impl;

import com.depth.management.mapper.EmpMapper;
import com.depth.management.mapper.SalaryHistoryMapper;
import com.depth.management.model.Emp;
import com.depth.management.model.SalaryHistory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SalaryHistoryServiceImplTest {

    @Autowired
    private SalaryHistoryMapper salaryHistoryMapper;

    @Autowired
    private EmpMapper empMapper;

    @Test
    public void save() throws ParseException {
        Random r = new Random();
        List<Emp> emps = empMapper.selectAll();
        for (Emp emp : emps) {
            for (int i = 1; i < 13; i++) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
                String str = "2017/" + (i < 10 ? ("0" + i) : i) + "/01";
                Date parse = sdf.parse(str);

                SalaryHistory sh = new SalaryHistory();
                sh.setEmpId(emp.getId());
                int s = 5000 + (i * 500);
                if (r.nextInt(3) > 1) {
                    s = s + (r.nextInt(5) * 1000);
                } else {
                    s = s - (r.nextInt(5) * 1000);
                }
                sh.setSalary(s);
                sh.setCreateTime(parse);
                sh.setCreateUser("111");
                sh.setUpdateTime(parse);
                sh.setUpdateUser("111");

                salaryHistoryMapper.insert(sh);
            }
        }

    }
}