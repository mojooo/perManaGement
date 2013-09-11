package com.action;

import java.util.Map;

import com.biz.IuserBiz;
import com.entity.Userinfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {

    private IuserBiz userBiz;
    private Userinfo user;
    private String yzm;
    private String result = "";

    // 登录
    public String login() {
        String autoyzh = (String) ActionContext.getContext().getSession().get("yzm");
        Map<String, Object> session = ActionContext.getContext().getSession();
        Userinfo userinfo = userBiz.login(user);
        if (!yzm.equalsIgnoreCase(autoyzh)) {
            result = this.getText("login.yanzhengmaerror");
            return "Error";
        } else if (userinfo != null) {
            if (Integer.parseInt(userinfo.getEmployeeinfo().getDepartmentinfo().getDepartId()) == 1) {
                session.put("right", "manage");
                session.put("loginuser", user);
                return "manage";
            } else {
                session.put("right", "personal");
                session.put("loginuser", user);
                return "personal";
            }
        } else {
            result = this.getText("login.wronguid");
        }
        return "loginError";
    }

    public String logout() {
        ActionContext.getContext().getSession().remove("loginuser");
        ActionContext.getContext().getSession().remove("right");
        return "logout";
    }

    public Userinfo getUser() {
        return user;
    }

    public void setUser(Userinfo user) {
        this.user = user;
    }

    public String getResult() {
        return result;
    }

    public void setUserBiz(IuserBiz userBiz) {
        this.userBiz = userBiz;
    }

    public void setYzm(String yzm) {
        this.yzm = yzm;
    }

}
