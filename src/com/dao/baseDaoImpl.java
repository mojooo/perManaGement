package com.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class baseDaoImpl<T> extends HibernateDaoSupport implements IBaseDao<T> {

    @Override
    public T getByID(T obj, Serializable id) {
	T t = (T) this.getHibernateTemplate().load(obj.getClass(), id);
	return t;
    }

    @Override
    public Boolean add(T t) {
	Boolean flag = false;
	try {
	    this.getHibernateTemplate().save(t);
	    flag = true;
	} catch (Exception e) {
	    e.printStackTrace();
	}
	return flag;
    }

    @Override
    public Boolean dell(T obj, Serializable id) {
	Boolean flag = false;
	try {
	    T t = (T) this.getHibernateTemplate().load(obj.getClass(), id);
	    this.getHibernateTemplate().delete(t);
	    flag = true;
	} catch (Exception e) {
	    e.printStackTrace();
	}
	return flag;
    }

    @Override
    public Boolean update(T t) {
	Boolean flag = false;
	try {
	    this.getHibernateTemplate().update(t);
	    flag = true;
	} catch (Exception e) {
	    e.printStackTrace();
	}
	return flag;
    }

    @Override
    public List<T> findList(String hql) {
	List<T> list = null;
	try {
	    list = this.getHibernateTemplate().find(hql);
	} catch (Exception e) {
	    e.printStackTrace();
	}
	return list;
    }

    @Override
    public List<T> findPageList(final String hql, final int index,
	    final int size) {
	List<T> list = null;
	try {
	    list = this.getHibernateTemplate().executeFind(
		    new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session)
				throws HibernateException, SQLException {
			    Query query = session.createQuery(hql);
			    query.setFirstResult((index - 1) * size);
			    query.setMaxResults(size);
			    return query.list();
			}
		    });
	} catch (Exception e) {
	    e.printStackTrace();
	}
	return list;
    }

}
