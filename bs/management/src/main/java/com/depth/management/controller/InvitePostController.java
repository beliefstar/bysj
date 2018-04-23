package com.depth.management.controller;

import com.depth.management.common.vo.Result;
import com.depth.management.model.Department;
import com.depth.management.model.Emp;
import com.depth.management.model.InvitePost;
import com.depth.management.model.example.InvitePostExample;
import com.depth.management.service.DepartmentService;
import com.depth.management.service.EmpService;
import com.depth.management.service.InvitePostService;
import com.depth.management.session.LoginInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/invitePost")
public class InvitePostController {

    private String tpl = "invitePost";

    private final EmpService empService;
    private final InvitePostService invitePostService;
    private final DepartmentService departmentService;

    @Autowired
    public InvitePostController(EmpService empService, InvitePostService invitePostService, DepartmentService departmentService) {
        this.empService = empService;
        this.invitePostService = invitePostService;
        this.departmentService = departmentService;
    }

    @GetMapping("/newApply")
    public String newApply() {
        return tpl + "/newApply";
    }

    @GetMapping("/interview")
    public String newApplyDepartment() {
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
        invitePost.setApprover(loginEmp.getId());
        invitePost.setEmpId(emp.getId());
        invitePost.setEntryTime(new Date());
        invitePost.setStatus("0");

        invitePostService.save(invitePost, loginEmp.getName());

        return result;
    }

    @PostMapping("/getList")
    @ResponseBody
    public Result getList(InvitePost invitePost) {
        Result result = new Result();

        List<InvitePost> invitePostList = invitePostService.findList(invitePost);

        List<InvitePostExample> examples = new ArrayList<>();

        for (InvitePost post : invitePostList) {
            InvitePostExample example = InvitePostExample.from(post);
            Emp emp = empService.findById(post.getEmpId());
            example.setEmp(emp);
            Department department = departmentService.findById(emp.getDepartmentId());
            example.setEmpDepartment(department);
            Emp approver = empService.findById(post.getApprover());
            example.setApprover(approver);
            examples.add(example);
        }

        result.setData(examples);

        return result;
    }
}
