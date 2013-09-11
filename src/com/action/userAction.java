package com.action;

import java.util.List;

import com.biz.IbaseBiz;
import com.biz.IuserBiz;
import com.entity.Employeeinfo;
import com.entity.Userinfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class userAction extends ActionSupport {

    private IuserBiz userBiz;
    private Userinfo user;
    private List<Userinfo> users;
    private String userId;
    private int index;
    private int size = 3;
    private String hql = "from Userinfo";
    private int PageCount;
    private String result;
    private String newpwd;

    // 计算总页数
    public void getPage() {
        int count = userBiz.findList(hql).size();
        PageCount = (count - 1) / size + 1;
    }

    // 添加用户UI跳转
    public String addUserUI() {

        return "addUserUI";
    }

    // 添加用户数据
    public String addUser(Userinfo u) {
        Boolean flag = userBiz.add(u);
        if (flag) {
            return "addUserOk";
        }
        return "Error";
    }

    // 删除用户信息
    public String dellUser(Userinfo u) {
        Boolean flag = userBiz.dell(new Userinfo(), userId);
        if (flag) {
            return "dellUserOk";
        }
        return "Error";
    }

    // 修改用户UI跳转
    public String updateUserUI() {
        user = userBiz.getById(new Userinfo(), userId);
        return "updateUserUI";
    }

    // 修改用户
    public String updateUser() {
        Boolean flag = userBiz.update(user);
        if (flag) {
            return "updateUserOk";
        }
        return "Error";
    }

    // 修改密码
    public String updatePwd() {
        Userinfo userinfo = (Userinfo) ActionContext.getContext().getSession().get("loginuser");
        user.setEmpId(userinfo.getEmpId());
        if (user.getPwd().equals(userinfo.getPwd())) {
            user.setPwd(newpwd);
            Boolean flag = userBiz.update(user);
            if (flag) {
                return "updatePwdOk";
            }
        }
        result = this.getText("validate.oldpwderror");
        return "updatePwdError";
    }

    public String findUserPageList() {
        if (0 == index) {
            index = 1;
        }
        users = userBiz.findPageList(hql, index, size);
        return "findUserPageList";
    }

    public Userinfo getUser() {
        return user;
    }

    public void setUser(Userinfo user) {
        this.user = user;
    }

    public List<Userinfo> getUsers() {
        return users;
    }

    public void setUserBiz(IuserBiz userBiz) {
        this.userBiz = userBiz;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getIndex() {
        return index;
    }

    public int getPageCount() {
        return PageCount;
    }

    public String getResult() {
        return result;
    }

    public void setNewpwd(String newpwd) {
        this.newpwd = newpwd;
    }

}
