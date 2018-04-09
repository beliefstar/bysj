package com.depth.management.controller;

import com.depth.management.common.vo.Result;
import com.depth.management.model.Account;
import com.depth.management.service.AccountService;
import com.depth.management.service.EmpService;
import com.depth.management.session.LoginInfo;
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
    private final AccountService accountService;
    private final EmpService empService;

    @Autowired
    public AccountController(AccountService accountService, EmpService empService) {
        this.accountService = accountService;
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
    public Result login(String username, String password) {
        Result result = new Result();
        accountService.login(username, password);
        return result;
    }

    @PostMapping("/register")
    @ResponseBody
    public Result register(Account account, LoginInfo loginInfo) {
        Result result = new Result();
        accountService.register(account, loginInfo.getEmp().getName());
        return result;
    }

    @PostMapping("/modifyPwd")
    @ResponseBody
    public Result modifyPwd(Account account, String newPwd, LoginInfo loginInfo, HttpSession session) {
        Result result = new Result();
        accountService.modifyPwd(account, newPwd, loginInfo.getEmp().getName());
        session.invalidate();
        return result;
    }
}
