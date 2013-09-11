package com.dao;

import java.util.List;

import com.entity.Userinfo;

public class userDaoImpl extends baseDaoImpl<Userinfo> implements IuserDao {

    @Override
    public List<Userinfo> login(Userinfo user) {
        String hql = "from Userinfo u where u.empId=? and u.pwd=?";
        List<Userinfo> users = this.getHibernateTemplate().find(hql, new Object[] { user.getEmpId(), user.getPwd() });
        return users;
    }

}
