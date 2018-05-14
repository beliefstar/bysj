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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/emp")
public class EmpController {
    private String tpl = "emp";

    private final EmpService empService;
    private final DepartmentService departmentService;
    private final VacateService vacateService;
    private final AdjustmentApplyService adjustmentApplyService;
    private final TrainService trainService;
    private final PostService postService;
    private final SalaryService salaryService;
    private final SysObjectService sysObjectService;

    @Autowired
    public EmpController(EmpService empService, DepartmentService departmentService, VacateService vacateService, AdjustmentApplyService adjustmentApplyService, TrainService trainService, PostService postService, SalaryService salaryService, SysObjectService sysObjectService) {
        this.empService = empService;
        this.departmentService = departmentService;
        this.vacateService = vacateService;
        this.adjustmentApplyService = adjustmentApplyService;
        this.trainService = trainService;
        this.postService = postService;
        this.salaryService = salaryService;
        this.sysObjectService = sysObjectService;
    }

    @PostMapping("/findListByDepartment")
    @ResponseBody
    public Result getListByDepartment(Long departmentId) {
        Result result = new Result();
        List<Emp> list = empService.findByDepartmentId(departmentId);
        result.setData(list);
        return result;
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
    public String showDetail(Long departmentId, ModelMap modelMap, LoginInfo loginInfo) {
        final Emp loginInfoEmp = loginInfo.getEmp();

        boolean flag = loginInfoEmp.getId().equals(23L);

        List<Emp> all;
        if (flag) {
            if (departmentId == null || departmentId.equals(0L)) {
                all = empService.findAll();
                modelMap.put("departmentId", 0);
            } else {
                all = empService.findByDepartmentId(departmentId);
                modelMap.put("departmentId", departmentId);
            }
        } else {
            all = empService.findByDepartmentId(loginInfoEmp.getDepartmentId());
        }
        modelMap.put("empList", all);

        List<Department> departments = departmentService.findAll();
        modelMap.put("departmentList", departments);

        modelMap.put("isMaster", flag);
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
        if (emp.getId().equals(loginEmp.getId())) {
            if (!StringUtils.isEmpty(emp.getImg())) {
                loginEmp.setImg(emp.getImg());
            }
        }
        empService.update(emp, loginEmp.getName());
        return result;
    }

    public String view(String view) {
        return tpl + "/" + view;
    }

    @GetMapping("/holiday")
    public String getList(Long departmentId, LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();

        boolean flag = loginEmp.getId().equals(23L);
        boolean dealBtn = false;
        List<Vacate> vacateList;
        if (flag) {
            if (departmentId == null || departmentId.equals(0L)) {
                vacateList = vacateService.findAll();
                modelMap.put("departmentId", 0);
            } else {
                vacateList = vacateService.getListByDepartment(departmentId);
                modelMap.put("departmentId", departmentId);
            }
            List<Department> departments = departmentService.findAll();
            modelMap.put("departmentList", departments);
        } else {
            dealBtn = true;
            vacateList = vacateService.getListByDepartment(loginEmp.getDepartmentId());

        }

        modelMap.put("loginId", loginEmp.getId());
        modelMap.put("applyBtn", true);
        modelMap.put("list", vacateList);
        modelMap.put("dealBtn", dealBtn);
        modelMap.put("flag", flag);

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
        modelMap.put("applyBtn", true);
        modelMap.put("dealBtn", false);
        modelMap.put("flag", false);
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
    public String adjustment(String type, Long departmentId, LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();

        boolean admin = loginEmp.getId().equals(40L);
        modelMap.put("admin", admin);
        boolean flag = loginEmp.getId().equals(23L) || admin;
        List<AdjustmentApply> list = null;
        if (flag) {
            if (departmentId == null || departmentId.equals(0L)) {
                list = adjustmentApplyService.findAll();
                modelMap.put("departmentId", 0);
            } else {
                list = adjustmentApplyService.findDepartmentId(departmentId);
                modelMap.put("departmentId", departmentId);
            }
            List<Department> departments = departmentService.findAll();
            modelMap.put("departmentList", departments);
        } else {
            departmentId = loginEmp.getDepartmentId();
            type = StringUtils.isEmpty(type) ? "arrive" : type;

            if ("arrive".equals(type)) {
                list = adjustmentApplyService.findArriveByDepartmentId(departmentId);
            } else if ("origin".equals(type)) {
                list = adjustmentApplyService.findOriginByDepartmentId(departmentId);
            }
        }
        modelMap.put("flag", flag);
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
            emp.setPost(apply.getPost());

            Post po = postService.findByName(apply.getPost());

            Salary salary = salaryService.findByEmpId(emp.getId());
            salary.setBase(po.getSalary());
            salary.setComment("职位变化更改");
            salaryService.update(salary, loginEmp.getName());

            Emp byId = empService.findById(emp.getId());
            Integer roleId = 0;
            if (!byId.getPost().equals(emp.getPost())) {
                if (emp.getPost().equals("经理")) {
                    roleId = 3;
                } else if (emp.getPost().equals("普通职员") || emp.getPost().equals("助理")) {
                    roleId = 2;
                }
            }
            if (!apply.getArrive().equals(byId.getDepartmentId())) {
                if (apply.getArrive().equals(23L)) {
                    roleId = 4;
                }
            }
            if (roleId != 0) {
                sysObjectService.updateEmpRoleByEmpId(emp.getId(), roleId);
            }

            empService.update(emp, loginEmp.getName());
        }
        return result;
    }

    @GetMapping("/newAdjustApply")
    public String newAdjustApply(LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();
        try {
            List<Department> departments = departmentService.findAll();
            modelMap.put("departmentList", departments);

            List<Post> posts = postService.findAll();
            modelMap.put("postList", posts);
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
    public String TrainList(Long departmentId, LoginInfo loginInfo, ModelMap modelMap) {
        final Emp loginEmp = loginInfo.getEmp();

        boolean flag = loginEmp.getId().equals(23L);

        List<Train> list;

        if (flag) {
            if (departmentId == null || departmentId.equals(0L)) {
                list = trainService.findAll();
            } else {
                Department d = departmentService.findById(departmentId);
                list = trainService.getListByPublisher(d.getMaster());
            }

            modelMap.put("departmentId", departmentId);

            List<Department> departments = departmentService.findAll();
            modelMap.put("departmentList", departments);
        } else {
            list = trainService.getListByPublisher(loginEmp.getId());
        }
        if (departmentId == null) {
            departmentId = 0L;
        }
        modelMap.put("departmentId", departmentId);

        List<Long> ids = list.stream().map(item -> item.getPublisherEmp().getDepartmentId()).collect(Collectors.toList());
        List<Department> allByIds = departmentService.findAllByIds(ids);

        for (Train train : list) {
            Long id = train.getPublisherEmp().getDepartmentId();
            allByIds.forEach(item -> {
                if (item.getDepartmentId().equals(id)) {
                    train.setDepartmentName(item.getName());
                }
            });
        }

        modelMap.put("flag", flag);
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

            Long id = train.getPublisherEmp().getDepartmentId();
            List<Emp> list = empService.findByDepartmentId(id);

            modelMap.put("empList", list);

            modelMap.put("isCreate", false);
        } else {
            modelMap.put("isCreate", true);

            List<Department> all = departmentService.findAll();
            modelMap.put("departmentList", all);
        }


        return view("newTrain");
    }

    @PostMapping("/newTrain")
    @ResponseBody
    public Result newTrain(String type,Long departmentId, String[] empIds, Train train, LoginInfo loginInfo) {
        Result result = new Result();
        final Emp loginEmp = loginInfo.getEmp();

        if ("create".equals(type)) {
            Department d = departmentService.findById(departmentId);
            train.setPublisher(d.getMaster());
            trainService.save(train, loginEmp);

            trainService.newTrainEmp(empIds, train.getId(), loginEmp);
        } else if ("update".equals(type)) {
            trainService.update(train, loginEmp);
            trainService.changeTrainEmp(empIds, train.getId(), loginEmp);
        }
        return result;
    }

    @PostMapping("/delete")
    @ResponseBody
    public Result signDel(Long id) {
        empService.signDelete(id);
        return new Result();
    }
}
