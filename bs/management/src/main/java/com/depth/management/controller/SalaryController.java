package com.depth.management.controller;

import com.depth.management.common.vo.Result;
import com.depth.management.model.Emp;
import com.depth.management.model.Salary;
import com.depth.management.model.SalaryHistory;
import com.depth.management.service.SalaryHistoryService;
import com.depth.management.service.SalaryService;
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
@RequestMapping("/salary")
public class SalaryController {

    @Autowired
    private SalaryService salaryService;

    @Autowired
    private SalaryHistoryService salaryHistoryService;

    private String view(String str) {
        return "/salary/" + str;
    }

    @GetMapping("/base")
    public String base(LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();
        List<Salary> list = salaryService.findListByDepartmentId(loginEmp.getDepartmentId());
        modelMap.put("list", list);
        return view("base_list");
    }

    @GetMapping("/view")
    public String view(Long id, ModelMap modelMap, LoginInfo loginInfo) {
        final Emp logEmp = loginInfo.getEmp();
        if (id == null) {
            id = logEmp.getId();
        }
        Salary sa = salaryService.findByEmpId(id);
        modelMap.put("salary", sa);

        List<SalaryHistory> sh = salaryHistoryService.findByEmpId(id);
        modelMap.put("sh", sh);

        return view("view");
    }

    @PostMapping("/adjustBase")
    @ResponseBody
    public Result adjustBase(Salary salary, Integer oldBase, LoginInfo loginInfo) {
        Result result = new Result();
        final Emp loginEmp = loginInfo.getEmp();
        salaryService.update(salary, loginEmp.getName());
        SalaryHistory sh = new SalaryHistory();
        sh.setEmpId(salary.getEmpId());
        sh.setSalary(oldBase);
        sh.setComment(salary.getComment());
        salaryHistoryService.save(sh, loginEmp.getName());
        return result;
    }

    @GetMapping("/bonus")
    public String bonus(LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();
        List<Salary> list = salaryService.findListByDepartmentId(loginEmp.getDepartmentId());
        modelMap.put("list", list);
        return view("bonus_list");
    }

    @PostMapping("/adjustBonusAnSubsidy")
    @ResponseBody
    public Result adjustBonusAnSubsidy(Salary salary, LoginInfo loginInfo) {
        Result result = new Result();
        salaryService.update(salary, loginInfo.getEmp().getName());
        return result;
    }
}
