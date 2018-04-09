package com.depth.management.config;

import com.depth.management.global.AuthRealm;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

@Configuration
public class ShiroConfig {

    @Bean
    public EhCacheManager ehCacheManager() {
        EhCacheManager manager = new EhCacheManager();
        manager.setCacheManagerConfigFile("classpath:ehcache.xml");
        return manager;
    }

    @Autowired
    private AuthRealm realm;

    @Bean
    public DefaultWebSecurityManager defaultWebSecurityManager() {
        DefaultWebSecurityManager manager = new DefaultWebSecurityManager();
        manager.setCacheManager(ehCacheManager());
        manager.setRealm(realm);
        return manager;
    }

    @Bean
    public ShiroFilterFactoryBean shiroFilterFactoryBean() {
        ShiroFilterFactoryBean bean = new ShiroFilterFactoryBean();
        bean.setSecurityManager(defaultWebSecurityManager());
        bean.setLoginUrl("/account/login");
        bean.setSuccessUrl("/");
        Map<String, String> map = new HashMap<>();
        map.put("/bootstrap/**", "anon");
        map.put("/dist/**", "anon");
        map.put("/login_assets/**", "anon");
        map.put("/plugins/**", "anon");
        map.put("/account/login", "anon");
        map.put("/account/logout", "logout");
        map.put("/**", "authc");
        bean.setFilterChainDefinitionMap(map);
        return bean;
    }

}
