package com.depth.management.controller;

import com.depth.management.common.vo.Result;
import com.depth.management.model.Emp;
import com.depth.management.service.EmpService;
import com.depth.management.session.LoginInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/invitePost")
public class InvitePostController {

    private String tpl = "invitePost";

    private final EmpService empService;

    @Autowired
    public InvitePostController(EmpService empService) {
        this.empService = empService;
    }

    @GetMapping("/newApply")
    public String newApply() {
        return tpl + "/newApply";
    }

    @PostMapping("/saveEmp")
    @ResponseBody
    public Result saveEmp(Emp emp, LoginInfo loginInfo) {
        Result result = new Result();
        final Emp loginEmp = loginInfo.getEmp();

        empService.save(emp, loginEmp.getName());

        return result;
    }
}
