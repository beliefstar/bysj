package com.depth.management.session;

import com.depth.management.model.Account;
import com.depth.management.model.Emp;

import java.io.Serializable;

public class LoginInfo implements Serializable {
    private static final long serialVersionUID = 7926755357822046059L;
    public final static String SESSION_NAME = "_loginInfo";

    private Emp emp;

    private Account account;

    public LoginInfo() {
    }

    public LoginInfo(Emp emp, Account account) {
        this.emp = emp;
        this.account = account;
    }

    public Emp getEmp() {
        return emp;
    }

    public void setEmp(Emp emp) {
        this.emp = emp;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

}
