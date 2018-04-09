package com.depth.management.service.impl;

import com.depth.management.common.exception.AccountException;
import com.depth.management.common.exception.ServiceException;
import com.depth.management.mapper.AccountMapper;
import com.depth.management.model.Account;
import com.depth.management.model.Emp;
import com.depth.management.service.AccountService;
import com.depth.management.session.LoginInfo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;
import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.security.SecureRandom;
import java.util.Date;
import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {

    private final AccountMapper accountMapper;

    @Autowired
    public AccountServiceImpl(AccountMapper accountMapper) {
        this.accountMapper = accountMapper;
    }

    @Override
    public void login(String username, String password) {
        Subject subject = SecurityUtils.getSubject();
        if (subject.isAuthenticated()) return;
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);

        try {
            subject.login(token);
        } catch (IncorrectCredentialsException ice) {
            throw new ServiceException("用户名或密码错误");
        } catch (AuthenticationException e) {
            e.printStackTrace();
            throw new ServiceException("认证失败");
        }
    }

    @Override
    @Transactional
    public void register(Account account, String operInfo) {
        try {
            generatePwd(account);

            Date date = new Date();
            account.setCreateTime(date);
            account.setCreateUser(operInfo);
            account.setUpdateTime(date);
            account.setUpdateUser(operInfo);

            accountMapper.insert(account);
        } catch (NullPointerException e) {
            throw new AccountException("参数错误");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            throw new ServiceException("服务器繁忙！");
        }
    }

    @Override
    public void checkUsername(String username) {
        Account temp = new Account();
        temp.setUsername(username);
        List<Account> list = accountMapper.select(temp);
        if (list.size() != 0) {
            throw new AccountException("此用户名已存在");
        }
    }

    @Override
    @Transactional
    public void modifyPwd(Account account, String newPwd, String operInfo) {
        try {
            Account temp = new Account();
            temp.setUsername(account.getUsername());

            temp = accountMapper.selectOne(temp);

            String currentPwd = account.getSalt() + account.getPassword();
            currentPwd = DigestUtils.md5DigestAsHex(currentPwd.getBytes("UTF-8"));
            if (!temp.getPassword().equals(currentPwd)) {
                throw new AccountException("旧密码错误!");
            }

            generatePwd(account);

            Date date = new Date();
            account.setUpdateTime(date);
            account.setUpdateUser(operInfo);

            accountMapper.updateByPrimaryKeySelective(account);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            throw new ServiceException("服务器繁忙！");
        }
    }

    private void generatePwd(Account account) throws UnsupportedEncodingException {
        SecureRandom random = new SecureRandom();
        byte[] bytes = random.generateSeed(4);
        String salt = new BASE64Encoder().encode(bytes);
        String pwd = salt + account.getPassword();
        pwd = DigestUtils.md5DigestAsHex(pwd.getBytes("UTF-8"));
        account.setSalt(salt);
        account.setPassword(pwd);
    }
}
