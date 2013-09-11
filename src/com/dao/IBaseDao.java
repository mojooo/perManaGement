package com.dao;

import java.io.Serializable;
import java.util.List;

public interface IBaseDao<T> {

    // 通过主键获取对象
    public T getByID(T obj, Serializable id);

    // 添加数据
    public Boolean add(T t);

    // 通过主键删除数据
    public Boolean dell(T obj, Serializable id);

    // 修改数据
    public Boolean update(T t);

    // 查询所有数据
    public List<T> findList(String hql);

    // 分页查询所有数据
    public List<T> findPageList(final String hql, final int index, final int size);
}
