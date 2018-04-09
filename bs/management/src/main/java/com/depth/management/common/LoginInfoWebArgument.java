package com.depth.management.common;

import com.depth.management.session.LoginInfo;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.context.request.NativeWebRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginInfoWebArgument implements WebArgumentResolver {
    @Override
    public Object resolveArgument(MethodParameter methodParameter, NativeWebRequest nativeWebRequest) throws Exception {

        if (methodParameter.getParameterType() != null && methodParameter.getParameterType() == LoginInfo.class) {
            HttpServletRequest request = nativeWebRequest.getNativeRequest(HttpServletRequest.class);
            HttpSession session = request.getSession();
            Object loginInfo = session.getAttribute(LoginInfo.SESSION_NAME);
            if (loginInfo != null) {
                return loginInfo;
            }
        }
        return UNRESOLVED;
    }
}
