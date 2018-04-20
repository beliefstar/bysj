package com.depth.management.common;

import com.github.pagehelper.PageInfo;
import org.springframework.core.MethodParameter;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.context.request.NativeWebRequest;

import javax.servlet.http.HttpServletRequest;

public class PageWebArgument implements WebArgumentResolver {
    @Override
    public Object resolveArgument(MethodParameter methodParameter, NativeWebRequest nativeWebRequest) throws Exception {

        if (methodParameter.getParameterType() != null && methodParameter.getParameterType() == PageInfo.class) {
            HttpServletRequest request = nativeWebRequest.getNativeRequest(HttpServletRequest.class);

            String p = request.getParameter("_p");
            if (!StringUtils.isEmpty(p)) {
                String[] split = p.split("_");
                if (split.length == 3) {
                    PageInfo<?> pageInfo = new PageInfo<>();
                    pageInfo.setPageNum(Integer.parseInt(split[0]));
                    pageInfo.setPageSize(Integer.parseInt(split[1]));
                    pageInfo.setTotal(Integer.parseInt(split[2]));
                    return pageInfo;
                }
            }
        }
        return UNRESOLVED;
    }
}
