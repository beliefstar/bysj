package com.depth.management.controller;

import com.depth.management.common.vo.Result;
import com.depth.management.model.Department;
import com.depth.management.model.Emp;
import com.depth.management.service.DepartmentService;
import com.depth.management.session.LoginInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/department")
public class DepartmentController {
    private final String tpl = "department";

    private final DepartmentService departmentService;

    @Autowired
    public DepartmentController(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }

    private String view(String view) {
        return  "/" + tpl + "/" + view;
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

    @GetMapping("/detail")
    public String detail(LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();

        Department de = departmentService.findById(loginEmp.getDepartmentId());
        modelMap.put("department", de);
        return view("detail");
    }
}
