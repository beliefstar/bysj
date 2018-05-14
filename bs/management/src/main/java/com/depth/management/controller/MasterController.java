package com.depth.management.controller;

import com.depth.management.model.Department;
import com.depth.management.model.Emp;
import com.depth.management.model.Vacate;
import com.depth.management.service.DepartmentService;
import com.depth.management.service.EmpService;
import com.depth.management.service.VacateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/master")
public class MasterController {

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private VacateService vacateService;

    @Autowired
    private EmpService empService;

    @GetMapping("/holiday")
    public String holidayList(ModelMap modelMap) {
        //人事部的请假
        List<Emp> byDepartmentId = empService.findByDepartmentId(23L);
        List<Department> all = departmentService.findAll();
        //部门经理的请假
        List<Long> ids = all.stream().map(Department::getMaster).collect(Collectors.toList());
        byDepartmentId.forEach(item -> ids.add(item.getId()));
        List<Vacate> list = vacateService.findListByEmpIds(ids);
        List<Long> ids2 = list.stream().map(Vacate::getEmpId).collect(Collectors.toList());
        List<Emp> byIds = empService.findByIds(ids2);
        list.forEach(item -> byIds.forEach(v -> {
            if (item.getEmpId().equals(v.getId())) {
                item.setName(v.getName());
            }
        }));

        modelMap.put("loginId", 0);
        modelMap.put("list", list);
        modelMap.put("flag", false);
        modelMap.put("applyBtn", false);
        modelMap.put("dealBtn", true);
        return "/emp/vacate_list";
    }
}
