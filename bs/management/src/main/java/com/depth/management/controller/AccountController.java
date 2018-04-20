package com.depth.management.controller;

import com.depth.management.common.vo.Result;
import com.depth.management.model.Emp;
import com.depth.management.service.EmpService;
import com.depth.management.session.LoginInfo;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/account")
public class AccountController {
    private final EmpService empService;

    @Autowired
    public AccountController(EmpService empService) {
        this.empService = empService;
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @PostMapping("/login")
    @ResponseBody
    public Result login(String email, String password) {
        Result result = new Result();
        empService.login(email, password);
        return result;
    }

    @PostMapping("/register")
    @ResponseBody
    public Result register(Emp emp, LoginInfo loginInfo) {
        Result result = new Result();
        System.out.println("come in");
        System.out.println(emp);
        empService.register(emp, loginInfo);
        return result;
    }

    @PostMapping("/modifyPwd")
    @ResponseBody
    public Result modifyPwd(String oldPwd, String newPwd, LoginInfo loginInfo, HttpSession session) {
        Result result = new Result();
        empService.modifyPwd(oldPwd, newPwd, loginInfo);
        session.invalidate();
        SecurityUtils.getSubject().logout();
        return result;
    }

    @PostMapping("/checkEmail")
    @ResponseBody
    public Result checkEmail(String email) {
        Result result = new Result();
        empService.checkEmail(email);
        return result;
    }
}
