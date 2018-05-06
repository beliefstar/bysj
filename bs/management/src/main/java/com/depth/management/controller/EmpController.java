package com.depth.management.controller;

import com.depth.management.common.exception.TurnErrorException;
import com.depth.management.common.vo.Result;
import com.depth.management.model.*;
import com.depth.management.service.*;
import com.depth.management.session.LoginInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping("/emp")
public class EmpController {
    private String tpl = "emp";

    private final EmpService empService;
    private final DepartmentService departmentService;
    private final VacateService vacateService;
    private final AdjustmentApplyService adjustmentApplyService;
    private final TrainService trainService;

    @Autowired
    public EmpController(EmpService empService, DepartmentService departmentService, VacateService vacateService, AdjustmentApplyService adjustmentApplyService, TrainService trainService) {
        this.empService = empService;
        this.departmentService = departmentService;
        this.vacateService = vacateService;
        this.adjustmentApplyService = adjustmentApplyService;
        this.trainService = trainService;
    }

    @GetMapping("/view")
    public String showDetail(Long id, LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();
        if (id == null) {
            id = loginEmp.getId();
        }
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

    @PostMapping("/upImg")
    @ResponseBody
    public Result upImg(@RequestParam("file") MultipartFile file) {
        Result result = new Result();
        String s = empService.upImg(file);
        result.setData(s);
        return result;
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
        Department department = departmentService.findById(loginEmp.getDepartmentId());

        type = StringUtils.isEmpty(type) ? "arrive" : type;
        List<AdjustmentApply> list = null;
        if ("arrive".equals(type)) {
            list = adjustmentApplyService.findByArrive(loginEmp.getDepartmentId());
            list.forEach(item -> item.setArriveName(department.getName()));
        } else if ("origin".equals(type)) {
            list = adjustmentApplyService.findByOrigin(loginEmp.getDepartmentId());
            list.forEach(item -> item.setOriginName(department.getName()));
        }
        if (list == null) throw new TurnErrorException("空指针");

        modelMap.put("list", list);
        modelMap.put("type", type);
        return "/department/adjustmentApply_list";
    }

    @PostMapping("/dealAdjustApply")
    @ResponseBody
    public Result dealAdjustApply(AdjustmentApply apply, LoginInfo loginInfo) {
        final Emp loginEmp = loginInfo.getEmp();
        Result result = new Result();

        adjustmentApplyService.update(apply, loginEmp);

        if ("3".equals(apply.getStatus())) {
            Emp emp = new Emp();
            emp.setId(apply.getEmpId());
            emp.setDepartmentId(apply.getArrive());

            empService.update(emp, loginEmp.getName());
        }
        return result;
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
            throw new TurnErrorException();
        }
        return "/department/newAdjustApply";
    }

    @PostMapping("/newAdjustment")
    @ResponseBody
    public Result newAdjustment(AdjustmentApply apply, LoginInfo loginInfo) {
        final Emp loginEmp = loginInfo.getEmp();
        Result result = new Result();
        adjustmentApplyService.newAdjustmentApply(apply, loginEmp);
        return result;
    }

    @GetMapping("/train")
    public String TrainList(LoginInfo loginInfo, ModelMap modelMap) {
        final Emp logEmp = loginInfo.getEmp();

        List<Train> list = trainService.getListByPublisher(logEmp.getId());

        modelMap.put("list", list);
        return view("train_list");
    }

    @GetMapping("/newTrainUI")
    public String newTrain(Long trainId, LoginInfo loginInfo, ModelMap modelMap) {
        final Emp logEmp = loginInfo.getEmp();
        if (trainId != null) {
            Train train = trainService.findById(trainId);
            modelMap.put("train", train);
            List<Long> ids = trainService.findIdsByTrainId(train.getId());
            modelMap.put("empIds", ids);
        }
        List<Emp> list = empService.findByDepartmentId(logEmp.getDepartmentId());

        modelMap.put("empList", list);
        return view("newTrain");
    }

    @PostMapping("/newTrain")
    @ResponseBody
    public Result newTrain(String type, String[] empIds, Train train, LoginInfo loginInfo) {
        Result result = new Result();
        final Emp loginEmp = loginInfo.getEmp();

        if ("create".equals(type)) {
            train.setPublisher(loginEmp.getId());
            trainService.save(train, loginEmp);

            trainService.newTrainEmp(empIds, train.getId(), loginEmp);
        } else if ("update".equals(type)) {
            trainService.update(train, loginEmp);
            trainService.changeTrainEmp(empIds, train.getId(), loginEmp);
        }
        return result;
    }
}
