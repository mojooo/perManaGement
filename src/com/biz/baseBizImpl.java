package com.biz;

import java.io.Serializable;
import java.util.List;

import com.dao.IBaseDao;

public class baseBizImpl<T> implements IbaseBiz<T> {

    private IBaseDao<T> baseDao;

    @Override
    public T getById(T t, Serializable id) {
        return baseDao.getByID(t, id);
    }

    @Override
    public Boolean add(T t) {
        return baseDao.add(t);
    }

    @Override
    public Boolean dell(T t, Serializable id) {
        return baseDao.dell(t, id);
    }

    @Override
    public Boolean update(T t) {
        return baseDao.update(t);
    }

    @Override
    public List<T> findList(String hql) {
        return baseDao.findList(hql);
    }

    @Override
    public List<T> findPageList(String hql, int index, int size) {
        return baseDao.findPageList(hql, index, size);
    }

    public void setBaseDao(IBaseDao<T> baseDao) {
        this.baseDao = baseDao;
    }

}
