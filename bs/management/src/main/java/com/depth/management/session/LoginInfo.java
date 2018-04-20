package com.depth.management.session;

import com.depth.management.model.Emp;

import java.io.Serializable;

public class LoginInfo implements Serializable {
    private static final long serialVersionUID = -4119169257136318044L;

    public static final String SESSION_NAME = "_loginInfo";

    private Emp emp;

    public LoginInfo() {
    }

    public LoginInfo(Emp emp) {
        this.emp = emp;
    }

    public Emp getEmp() {
        return emp;
    }
}
