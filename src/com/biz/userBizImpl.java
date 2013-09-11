package com.biz;

import java.util.List;

import com.dao.IuserDao;
import com.entity.Userinfo;

public class userBizImpl extends baseBizImpl<Userinfo> implements IuserBiz {

    private IuserDao userDao;

    @Override
    public Userinfo login(Userinfo user) {
        List<Userinfo> users = userDao.login(user);
        if (users.size() > 0) {
            return users.get(0);
        }
        return null;
    }

    public void setUserDao(IuserDao userDao) {
        this.userDao = userDao;
    }

}
