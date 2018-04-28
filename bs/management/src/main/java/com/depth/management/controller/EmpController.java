package com.depth.management.controller;

import com.depth.management.common.exception.TurnErrorException;
import com.depth.management.common.vo.Result;
import com.depth.management.model.AdjustmentApply;
import com.depth.management.model.Department;
import com.depth.management.model.Emp;
import com.depth.management.model.Vacate;
import com.depth.management.service.AdjustmentApplyService;
import com.depth.management.service.DepartmentService;
import com.depth.management.service.EmpService;
import com.depth.management.service.VacateService;
import com.depth.management.session.LoginInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/emp")
public class EmpController {
    private String tpl = "emp";

    private final EmpService empService;
    private final DepartmentService departmentService;
    private final VacateService vacateService;
    private final AdjustmentApplyService adjustmentApplyService;

    @Autowired
    public EmpController(EmpService empService, DepartmentService departmentService, VacateService vacateService, AdjustmentApplyService adjustmentApplyService) {
        this.empService = empService;
        this.departmentService = departmentService;
        this.vacateService = vacateService;
        this.adjustmentApplyService = adjustmentApplyService;
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

    @GetMapping("/edit")
    public String editUI(Long id, ModelMap modelMap) {
        Emp emp = empService.findById(id);
        modelMap.put("emp", emp);
        return view("emp_manage_edit");
    }

    @PostMapping("/update")
    @ResponseBody
    public Result save(Emp emp, LoginInfo loginInfo) {
        final Emp loginEmp = loginInfo.getEmp();
        Result result = new Result();
        empService.update(emp, loginEmp.getName());
        return result;
    }

    public String view(String view) {
        return tpl + "/" + view;
    }

    @GetMapping("/holiday")
    public String getList(LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();
        List<Vacate> vacateList = vacateService.getListByDepartment(loginEmp.getDepartmentId());

        modelMap.put("list", vacateList);
        modelMap.put("isMaster", true);
        return view("vacate_list");
    }

    @GetMapping("/holidayNewApply")
    public String holidayApply() {
        return view("holidayApply");
    }

    @GetMapping("/holidayApply")
    public String holidayList(LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();
        List<Vacate> list = vacateService.getListByEmpId(loginEmp.getId());
        modelMap.put("list", list);
        modelMap.put("isMaster", false);
        return view("vacate_list");
    }

    @PostMapping("/submitVacate")
    @ResponseBody
    public Result holidayApply(String text, String timeRange, LoginInfo loginInfo) {
        final Emp loginEmp = loginInfo.getEmp();
        Result result = new Result();
        vacateService.newVacate(text, timeRange, loginEmp);
        return result;
    }

    @PostMapping("/accessOrDeniedVacate")
    @ResponseBody
    public Result accessOrDeniedVacate(Long id, String type, LoginInfo loginInfo) {
        final Emp loginEmp = loginInfo.getEmp();
        if ("access".equals(type)) {
            vacateService.access(id, loginEmp);
        } else if ("denied".equals(type)) {
            vacateService.denied(id, loginEmp);
        }
        return new Result();
    }

    @GetMapping("/adjustment")
    public String adjustment(String type, LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();
        List<AdjustmentApply> list = null;
        if (StringUtils.isEmpty(type) || "arrive".equals(type)) {
            list = adjustmentApplyService.findByArrive(loginEmp.getDepartmentId());
        } else if ("origin".equals(type)) {
            list = adjustmentApplyService.findByOrigin(loginEmp.getDepartmentId());
        }
        if (list == null) throw new TurnErrorException("空指针");
        for (AdjustmentApply apply : list) {
            Emp byId = empService.findById(apply.getEmpId());
            apply.setEmpName(byId.getName());
        }
        modelMap.put("list", list);
        return "/department/adjustmentApply_list";
    }

    @GetMapping("/newAdjustApply")
    public String newAdjustApply(LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();
        try {
            List<Emp> emps = empService.findByDepartmentId(loginEmp.getDepartmentId());
            modelMap.put("empList", emps);
            List<Department> departments = departmentService.findAll();
            departments.removeIf(department -> {
                if (department.getDepartmentId().equals(loginEmp.getDepartmentId())) {
                    modelMap.put("currentDepartment", department);
                    return true;
                }
                return false;
            });
            modelMap.put("departmentList", departments);

        } catch (Exception e) {
            e.printStackTrace();
            throw new TurnErrorException("出错啦");
        }
        return "/department/newAdjustApply";
    }

    @PostMapping("/newAdjustment")
    @ResponseBody
    public Result newAdjustment(AdjustmentApply apply, LoginInfo loginInfo) {
        final Emp loginEmp = loginInfo.getEmp();
        Result result = new Result();
        System.out.println(apply);
        adjustmentApplyService.newAdjustmentApply(apply, loginEmp);

        return result;
    }
}
