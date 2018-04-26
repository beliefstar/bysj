package com.depth.management.controller;

import com.depth.management.common.exception.TurnErrorException;
import com.depth.management.model.Department;
import com.depth.management.model.Emp;
import com.depth.management.service.DepartmentService;
import com.depth.management.service.EmpService;
import com.depth.management.session.LoginInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/emp")
public class EmpController {
    private String tpl = "emp";

    private final EmpService empService;
    private final DepartmentService departmentService;

    @Autowired
    public EmpController(EmpService empService, DepartmentService departmentService) {
        this.empService = empService;
        this.departmentService = departmentService;
    }

    @GetMapping("/view")
    public String showDetail(Long id, ModelMap modelMap) {
        try {
            Emp emp = empService.findById(id);
            modelMap.put("emp", emp);
            Department department = departmentService.findById(emp.getDepartmentId());
            modelMap.put("department", department);
        } catch (Exception e) {
            e.printStackTrace();
            throw new TurnErrorException("500");
        }
        return view("show_detail");
    }

    @GetMapping("/detail")
    public String showDetail(ModelMap modelMap, LoginInfo loginInfo) {
        final Emp loginInfoEmp = loginInfo.getEmp();
        List<Emp> all = empService.findByDepartmentId(loginInfoEmp.getDepartmentId());
        modelMap.put("empList", all);
        return view("emp_list");
    }

    public String view(String view) {
        return tpl + "/" + view;
    }
}
