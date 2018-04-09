package com.depth.management.config;

import com.depth.management.common.LoginInfoWebArgument;
import com.depth.management.common.PageWebArgument;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.mvc.method.annotation.ServletWebArgumentResolverAdapter;

import java.util.List;

@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        argumentResolvers.add(new ServletWebArgumentResolverAdapter(new LoginInfoWebArgument()));
        argumentResolvers.add(new ServletWebArgumentResolverAdapter(new PageWebArgument()));
    }
}
