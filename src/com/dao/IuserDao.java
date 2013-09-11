package com.dao;

import java.util.List;

import com.entity.Userinfo;

public interface IuserDao extends IBaseDao<Userinfo> {

    // 用户登录验证并返回用户对象
    public List<Userinfo> login(Userinfo user);

}
 