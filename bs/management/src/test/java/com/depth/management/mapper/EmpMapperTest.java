package com.depth.management.mapper;

import com.depth.management.model.Department;
import com.depth.management.model.Emp;
import com.depth.management.model.Salary;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.xml.soap.SAAJMetaFactory;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
public class EmpMapperTest {

    @Autowired
    private EmpMapper mapper;

    @Test
    public void findByIds() {
        List<Long> ids = new ArrayList<>();
        ids.add(1L);
        ids.add(2L);
        ids.add(3L);
        ids.add(4L);
        ids.add(5L);
        ids.add(6L);

        List<Emp> byIds = mapper.findByIds(Arrays.asList());
        Assert.assertEquals(6, byIds.size());
    }

    @Autowired
    private EmpMapper empMapper;

    @Autowired
    private SalaryMapper salaryMapper;

    @Autowired
    private DepartmentMapper departmentMapper;

    @Test
    public void salaryTest() {
        List<Department> departments = departmentMapper.selectAll();
        List<Long> ids = departments.stream().map(Department::getMaster).collect(Collectors.toList());
        List<Emp> emps = empMapper.selectAll();
        emps.forEach(item -> {
            Date date = new Date();
            Salary salary = new Salary();
            salary.setEmpId(item.getId());
            salary.setCreateTime(date);
            salary.setCreateUser("111");
            salary.setUpdateTime(date);
            salary.setUpdateUser("111");
            if (ids.contains(item.getId())) {
                salary.setBase(6000);
            } else {
                salary.setBase(5000);
            }
            salaryMapper.insert(salary);
        });
    }
}