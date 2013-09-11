package com.biz;

import java.io.Serializable;
import java.util.List;

public interface IbaseBiz<T> {

    // 通过主键获取对象
    public T getById(T t, Serializable id);

    // 增加数据
    public Boolean add(T t);

    // 删除数据
    public Boolean dell(T t, Serializable id);

    // 修改数据
    public Boolean update(T t);

    // 查询所有数据
    public List<T> findList(String hql);

    // 分页查询
    public List<T> findPageList(String hql, int index, int size);
}
