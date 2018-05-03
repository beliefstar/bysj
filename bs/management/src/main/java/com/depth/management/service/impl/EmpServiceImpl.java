package com.depth.management.service.impl;

import com.depth.management.common.exception.AccountException;
import com.depth.management.common.exception.ServiceException;
import com.depth.management.mapper.EmpMapper;
import com.depth.management.mapper.SysObjectMapper;
import com.depth.management.model.Emp;
import com.depth.management.service.EmpService;
import com.depth.management.session.LoginInfo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;
import tk.mybatis.mapper.entity.Example;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

@Service
public class EmpServiceImpl implements EmpService {

    private final EmpMapper empMapper;
    private final SysObjectMapper sysObjectMapper;

    @Autowired
    public EmpServiceImpl(EmpMapper empMapper, SysObjectMapper sysObjectMapper) {
        this.empMapper = empMapper;
        this.sysObjectMapper = sysObjectMapper;
    }


    @Override
    public Emp findById(Long id) {
        if (id == 0) {
            throw new ServiceException("ID不可为空!");
        }
        return empMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Emp> findAll() {
        Example example = new Example(Emp.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("ready", "1");
        criteria.andEqualTo("delFlg", "0");
        example.orderBy("joinTime").desc();

        return empMapper.selectByExample(example);
    }

    @Transactional
    @Override
    public Emp save(Emp emp, String opeUser) {
        Date date = new Date();
        emp.setCreateTime(date);
        emp.setCreateUser(opeUser);
        emp.setUpdateTime(date);
        emp.setUpdateUser(opeUser);

        try {
            empMapper.insertSelective(emp);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException("参数错误");
        }
        return emp;
    }

    @Override
    public void update(Emp emp, String opeUser) {
        Date date = new Date();
        emp.setUpdateTime(date);
        emp.setUpdateUser(opeUser);
        try {
            empMapper.updateByPrimaryKeySelective(emp);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
    }

    @Override
    public void login(String email, String password) {
        Subject subject = SecurityUtils.getSubject();
        if (subject.isAuthenticated()) return;
        UsernamePasswordToken token = new UsernamePasswordToken(email, password);

        try {
            subject.login(token);
        } catch (AuthenticationException e) {
            throw new AccountException("邮箱或密码错误！");
        }
    }

    @Override
    public void register(Emp emp, LoginInfo loginInfo) {
        final Emp loginEmp = loginInfo.getEmp();
        try {
            String pwd = generatePwd(emp.getPhone(), emp.getPassword());
            emp.setPassword(pwd);
            System.out.println(emp.getPassword());

            Date date = new Date();
            emp.setCreateTime(date);
            emp.setCreateUser(loginEmp.getName());
            emp.setUpdateTime(date);
            emp.setUpdateUser(loginEmp.getName());

            empMapper.insert(emp);
        } catch (NullPointerException e) {
            throw new AccountException("参数错误");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            throw new ServiceException("服务器繁忙！");
        } catch (Exception ignored) {
            ignored.printStackTrace();
            throw new AccountException("服务器繁忙");
        }
    }

    @Override
    public void checkEmail(String email) {
        int count = empMapper.checkEmail(email);
        if (count > 0)
            throw new AccountException("该邮箱已存在");
    }

    @Override
    public void modifyPwd(String oldPwd, String newPwd, LoginInfo loginInfo) {
        final Emp emp = loginInfo.getEmp();
        String currentPwd;
        try {
            currentPwd = generatePwd(emp.getPhone(), oldPwd);
        } catch (UnsupportedEncodingException ignored) {
            throw new ServiceException("服务器错误");
        }
        if (!emp.getPassword().equals(currentPwd)) {
            throw new AccountException("旧密码错误");
        }
        try {
            currentPwd = generatePwd(emp.getPhone(), newPwd);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            throw new ServiceException("服务器错误");
        }
        Date date = new Date();
        emp.setPassword(currentPwd);
        emp.setUpdateTime(date);
        emp.setUpdateUser(emp.getName());

        empMapper.updateByPrimaryKeySelective(emp);
    }

    private String generatePwd(String salt, String pwd) throws UnsupportedEncodingException {
        String rel = salt + pwd;
        return DigestUtils.md5DigestAsHex(rel.getBytes("UTF-8"));
    }

    @Override
    public void access(Long id, String opa) {
        Emp emp = empMapper.selectByPrimaryKey(id);
        Date date = new Date();
        emp.setUpdateTime(date);
        emp.setUpdateUser(opa);
        emp.setReady("1");
        emp.setJoinTime(date);

        //设置初始密码
        String phone = emp.getPhone();
        String pwd;
        try {
            pwd = generatePwd(phone, "123456");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
        emp.setPassword(pwd);

        try {
            empMapper.updateByPrimaryKeySelective(emp);
            //设置权限
            sysObjectMapper.insertPermission(id, 2);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }

    }

    @Override
    public List<Emp> findByDepartmentId(Long id) {
        Emp emp = new Emp();
        emp.setReady("1");
        emp.setDelFlg("0");
        emp.setDepartmentId(id);
        List<Emp> list;
        try {
            list = empMapper.select(emp);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
        return list;
    }

    @Override
    public List<Emp> findByIds(List<Long> ids) {
        List<Emp> list;
        try {
            list = empMapper.findByIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException(e);
        }
        return list;
    }
}
