package com.depth.management.service.impl;

import com.depth.management.model.Emp;
import com.depth.management.model.SalaryHistory;
import com.depth.management.service.EmpService;

import java.util.List;
import java.util.Random;

public class SalaryHistoryServiceImplTest {

    private SalaryHistoryServiceImpl salaryHistoryService;

    private EmpService empService;

    public void save() {
        List<Emp> all = empService.findAll();
        Random r = new Random();
        for (Emp emp : all) {
            SalaryHistory sh = new SalaryHistory();
            sh.setEmpId(emp.getId());
            sh.setSalary(10500 + r.nextInt(500));
            salaryHistoryService.save(sh, "111");
        }

    }
}
