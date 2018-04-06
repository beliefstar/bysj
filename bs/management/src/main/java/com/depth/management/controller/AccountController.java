package com.depth.management.controller;

import com.depth.management.common.Result;
import com.depth.management.model.Account;
import com.depth.management.model.Emp;
import com.depth.management.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/Account")
public class AccountController {
    private final AccountService accountService;

    @Autowired
    public AccountController(AccountService accountService) {
        this.accountService = accountService;
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
    public Result login(Account account) {
        Result result = new Result();
        accountService.login(account);
        return result;
    }

    @PostMapping("/register")
    @ResponseBody
    public Result register(Account account, HttpSession session) {
        Result result = new Result();
        Emp emp = (Emp) session.getAttribute(Emp.SESSION_NAME);
        accountService.register(account, emp.getName());
        return result;
    }

    @PostMapping("/modifyPwd")
    @ResponseBody
    public Result modifyPwd(Account account, String newPwd, HttpSession session) {
        Result result = new Result();
        Emp emp = (Emp) session.getAttribute(Emp.SESSION_NAME);
        accountService.modifyPwd(account, newPwd, emp.getName());
        session.setAttribute(Emp.SESSION_NAME, null);
        return result;
    }
}
