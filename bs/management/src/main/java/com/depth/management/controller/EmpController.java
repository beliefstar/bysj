package com.depth.management.controller;

import com.depth.management.service.DepartmentService;
import com.depth.management.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

//        try {
//            Emp emp = empService.findById(id);
//            modelMap.put("emp", emp);
//            Department department = departmentService.findById(emp.getDepartmentId());
//            modelMap.put("department", department);
//        } catch (Exception e) {
//            e.printStackTrace();
//            throw new TurnErrorException("500");
//        }
        return tpl + "/detail";
    }
}
