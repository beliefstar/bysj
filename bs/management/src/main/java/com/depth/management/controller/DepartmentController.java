package com.depth.management.controller;

import com.depth.management.common.vo.Result;
import com.depth.management.model.Department;
import com.depth.management.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/department")
public class DepartmentController {

    private final DepartmentService departmentService;

    @Autowired
    public DepartmentController(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }

    @GetMapping("/getDepartment")
    public List<Department> index() {
        return departmentService.findAll();
    }

    @PostMapping("/findList")
    @ResponseBody
    public Result findListByParentId() {
        Result result = new Result();
        List<Department> list = departmentService.findAll();
        result.setData(list);
        return result;
    }
}
