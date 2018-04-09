package com.depth.management.service;

import com.depth.management.model.Account;

public interface AccountService {

    void login(String username, String password);

    void register(Account account, String operInfo);

    void modifyPwd(Account account, String newPwd, String operInfo);

    void checkUsername(String username);
}
