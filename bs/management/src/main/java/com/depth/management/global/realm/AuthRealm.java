package com.depth.management.global.realm;

import com.alibaba.druid.util.StringUtils;
import com.depth.management.mapper.EmpMapper;
import com.depth.management.mapper.SysObjectMapper;
import com.depth.management.model.Emp;
import com.depth.management.session.LoginInfo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Component
public class AuthRealm extends AuthorizingRealm {

    private final SysObjectMapper sysObjectMapper;
    private final EmpMapper empMapper;

    @Autowired
    public AuthRealm(SysObjectMapper sysObjectMapper, EmpMapper empMapper) {
        this.sysObjectMapper = sysObjectMapper;
        this.empMapper = empMapper;
        HashedCredentialsMatcher matcher = new HashedCredentialsMatcher();
        matcher.setHashAlgorithmName("MD5");
        matcher.setHashIterations(1);
        this.setCredentialsMatcher(matcher);
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        System.out.println("获取权限");
        LoginInfo loginInfo = (LoginInfo) SecurityUtils.getSubject().getSession().getAttribute(LoginInfo.SESSION_NAME);

        List<String> permissions = sysObjectMapper.findEmpPermissions(loginInfo.getEmp().getId());
        if (permissions == null) return null;

        Set<String> set = permissions.stream()
                .distinct()
                .filter(item -> !StringUtils.isEmpty(item))
                .collect(Collectors.toSet());

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setStringPermissions(set);

        return info;
    }

    /**
     * 登陆
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("身份认证");

        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;

        String email = token.getUsername();
        Emp emp = new Emp();
        emp.setEmail(email);
        emp.setDelFlg("0");
        emp = empMapper.selectOne(emp);
        ByteSource salt = ByteSource.Util.bytes(emp.getPhone());
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(email, emp.getPassword(), salt, getName());

        LoginInfo loginInfo = new LoginInfo(emp);
        SecurityUtils.getSubject().getSession().setAttribute(LoginInfo.SESSION_NAME, loginInfo);
        return info;
    }
}
