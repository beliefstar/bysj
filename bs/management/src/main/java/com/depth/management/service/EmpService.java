package com.depth.management.service;

import com.depth.management.model.Emp;
import com.depth.management.session.LoginInfo;

import java.util.List;

public interface EmpService {

    Emp findById(Long id);

    List<Emp> findAll();

    Emp save(Emp emp, String opeUser);

    void login(String email, String password);

    void register(Emp emp, LoginInfo loginInfo);

    void modifyPwd(String oldPwd, String newPwd, LoginInfo loginInfo);

    void checkEmail(String email);

    void access(Long id, String opa);

    List<Emp> findByDepartmentId(Long id);

}
