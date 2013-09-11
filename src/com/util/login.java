package com.util;

import com.entity.Userinfo;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class login extends AbstractInterceptor {

    /**
     * 同步
     */
    private static final long serialVersionUID = 1L;

    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        // TODO Auto-generated method stub
        Userinfo user = (Userinfo) actionInvocation.getInvocationContext().getSession().get("loginuser");
        if (user != null) {
            return actionInvocation.invoke();
        }
        return "loginError";
    }

}
