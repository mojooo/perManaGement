package com.biz;

import com.entity.Userinfo;

public interface IuserBiz extends IbaseBiz<Userinfo> {

    // 用户登录并返回用户信息
    public Userinfo login(Userinfo user);

}
