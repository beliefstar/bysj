package com.depth.management.controller;

import com.depth.management.common.vo.Result;
import com.depth.management.model.Department;
import com.depth.management.model.Emp;
import com.depth.management.service.DepartmentService;
import com.depth.management.service.EmpService;
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

    private final EmpService empService;

    @Autowired
    public DepartmentController(DepartmentService departmentService, EmpService empService) {
        this.departmentService = departmentService;
        this.empService = empService;
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
    public String detail(Long departmentId, LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();

        if (departmentId == null || departmentId.equals(0L)) {
            departmentId = loginEmp.getDepartmentId();
        }
        boolean flag = loginEmp.getId().equals(23L);
        modelMap.put("flag", flag);

        Department de = departmentService.findById(departmentId);
        modelMap.put("department", de);

        List<Department> all = departmentService.findAll();
        modelMap.put("departmentList", all);

        Emp master = empService.findById(de.getMaster());
        modelMap.put("master", master);

        List<Emp> byDepartmentId = empService.findByDepartmentId(departmentId);
        modelMap.put("empNumber", byDepartmentId.size());

        return view("detail");
    }

    @GetMapping("/adjustment")
    public String adjustment(Long departmentId, LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();

        if (departmentId == null || departmentId.equals(0L)) {
            departmentId = loginEmp.getDepartmentId();
        }

        modelMap.put("departmentId", departmentId);

        Department de = departmentService.findById(departmentId);
        modelMap.put("department", de);

        List<Department> all = departmentService.findAll();
        modelMap.put("departmentList", all);

        return view("adjustment");
    }

    @PostMapping("/adjustmentSubmit")
    @ResponseBody
    public Result adjustmentSubmit(Department department, LoginInfo loginInfo) {
        Result result = new Result();
        final Emp loginEmp = loginInfo.getEmp();

        departmentService.update(department, loginEmp.getName());

        return result;
    }
}
