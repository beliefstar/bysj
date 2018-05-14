package com.depth.management.controller;

import com.depth.management.common.exception.TurnErrorException;
import com.depth.management.common.vo.Result;
import com.depth.management.model.*;
import com.depth.management.service.*;
import com.depth.management.session.LoginInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/invitePost")
public class InvitePostController {

    private String tpl = "invitePost";

    private final EmpService empService;
    private final InvitePostService invitePostService;
    private final DepartmentService departmentService;
    private final PostService postService;
    private final SalaryService salaryService;

    @Autowired
    public InvitePostController(EmpService empService, InvitePostService invitePostService, DepartmentService departmentService, PostService postService, SalaryService salaryService) {
        this.empService = empService;
        this.invitePostService = invitePostService;
        this.departmentService = departmentService;
        this.postService = postService;
        this.salaryService = salaryService;
    }

    @GetMapping("/newApply")
    public String newApply() {
        return tpl + "/newApply";
    }


    @GetMapping("/detail")
    public String detail(Long id, ModelMap modelMap) {
        try {
            Emp emp = empService.findById(id);
            modelMap.put("emp", emp);
            Department department = departmentService.findById(emp.getDepartmentId());
            modelMap.put("department", department);
        } catch (Exception e) {
            e.printStackTrace();
            throw new TurnErrorException("500");
        }
        return tpl + "/detail";
    }



    @GetMapping("/interview")
    public String interview(ModelMap modelMap, LoginInfo loginInfo) {
        final Emp loginEmp = loginInfo.getEmp();

        String[] btn = {"all", "new", "denied"};
        modelMap.put("btnList", btn);

        modelMap.put("isMaster", loginEmp.getId().equals(23L));
        return tpl + "/newApply_list";
    }

    @GetMapping("/allot")
    public String allot(ModelMap modelMap) {
        String[] btn = {"access"};
        modelMap.put("btnList", btn);
        modelMap.put("status", 1);
        return tpl + "/newApply_list";
    }

    @PostMapping("/newApply")
    @ResponseBody
    public Result saveEmp(Emp emp, LoginInfo loginInfo) {
        Result result = new Result();
        final Emp loginEmp = loginInfo.getEmp();

        emp.setReady("0");
        emp.setPost("普通职员");

        empService.save(emp, loginEmp.getName());

        InvitePost invitePost = new InvitePost();
        invitePost.setEmpName(emp.getName());
        invitePost.setDepartmentId(emp.getDepartmentId());
        Department department = departmentService.findById(emp.getDepartmentId());
        invitePost.setDepartmentName(department.getName());
        invitePost.setApprover(loginEmp.getId());
        invitePost.setEmpId(emp.getId());
        invitePost.setEntryTime(new Date());
        invitePost.setStatus("0");

        invitePostService.save(invitePost, loginEmp.getName());

        return result;
    }

    @PostMapping("/getList")
    @ResponseBody
    public Result getList(InvitePost invitePost, LoginInfo loginInfo) {
        Result result = new Result();
        final Emp loginEmp = loginInfo.getEmp();

        boolean flag = loginEmp.getId().equals(23L);

        List<InvitePost> invitePostList = invitePostService.findList(invitePost);

        List<Long> ids = invitePostList.stream().map(InvitePost::getDepartmentId).collect(Collectors.toList());
        List<Department> departmentList = departmentService.findAllByIds(ids);

        if (!flag) {
            Iterator<InvitePost> iterator = invitePostList.iterator();
            while (iterator.hasNext()) {
                departmentList.forEach(item -> {
                    if (!item.getMaster().equals(loginEmp.getId())) {
                        iterator.remove();
                    }
                });
            }
        }

        result.setData(invitePostList);
        return result;
    }

    @PostMapping("/access")
    @ResponseBody
    public Result access(Long empId, LoginInfo loginInfo) {
        final Emp loginEmp = loginInfo.getEmp();
        Result result = new Result();
        empService.access(empId, loginEmp.getName());
        invitePostService.access(empId, loginEmp);

        Emp emp = empService.findById(empId);
        Post post = postService.findByName(emp.getPost());
        Salary salary = new Salary();
        salary.setBase(post.getSalary());
        salary.setEmpId(emp.getId());
        salary.setBonus(0);
        salary.setSubsidy(0);
        salary.setComment("初始工资");
        //设置工资
        salaryService.save(salary, loginEmp.getName());
        return result;
    }

    @PostMapping("/denied")
    @ResponseBody
    public Result denied(Long empId, LoginInfo loginInfo) {
        final Emp loginEmp = loginInfo.getEmp();
        Result result = new Result();
        invitePostService.denied(empId, loginEmp);
        return result;
    }
}
