package com.action;

import java.util.List;

import com.biz.IbaseBiz;
import com.entity.Departmentinfo;
import com.opensymphony.xwork2.ActionSupport;

public class departAction extends ActionSupport {

    private IbaseBiz<Departmentinfo> baseBiz;
    private Departmentinfo depart;
    private List<Departmentinfo> departs;
    private String depId;
    private int currenPage;
    private int size = 3;
    private String hql = "from Departmentinfo";
    private int maxPageNo;
    private int totalMessage;

    // 计算总页数
    public void getPage(String hql) {
        totalMessage = baseBiz.findList(hql).size();
        maxPageNo = (totalMessage - 1) / size + 1;
    }

    // 添加部门UI跳转
    public String addDepUI() {

        return "addDepUI";
    }

    // 添加部门
    public String addDep() {
        Boolean flag = baseBiz.add(depart);
        if (flag) {
            return "addDepOk";
        }
        return "Error";
    }

    // 删除部门
    public String dellDep() {
        Boolean flag = baseBiz.dell(new Departmentinfo(), depId);
        if (flag) {
            return "dellDepOk";
        }
        return "Error";
    }

    // 修改部门UI跳转
    public String updateDepUI() {
        depart = baseBiz.getById(new Departmentinfo(), depId);
        return "updateDepUI";
    }

    // 修改部门
    public String updateDep() {
        Boolean flag = baseBiz.update(depart);
        if (flag) {
            return "updateDepOk";
        }
        return "Error";
    }

    // 查询部门信息
    public String findDepPageList() {
        getPage(hql);
        if (0 == currenPage) {
            currenPage = 1;
        }
        departs = baseBiz.findPageList(hql, currenPage, size);
        return "findDepPageList";
    }

    public Departmentinfo getDepart() {
        return depart;
    }

    public void setDepart(Departmentinfo depart) {
        this.depart = depart;
    }

    public int getIndex() {
        return currenPage;
    }

    public void setIndex(int index) {
        this.currenPage = index;
    }

    public List<Departmentinfo> getDeparts() {
        return departs;
    }

    public void setBaseBiz(IbaseBiz<Departmentinfo> baseBiz) {
        this.baseBiz = baseBiz;
    }

    public void setDepId(String depId) {
        this.depId = depId;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getPageCount() {
        return maxPageNo;
    }

    public int getCurrenPage() {
        return currenPage;
    }

    public void setCurrenPage(int currenPage) {
        this.currenPage = currenPage;
    }

    public int getMaxPageNo() {
        return maxPageNo;
    }

    public int getTotalMessage() {
        return totalMessage;
    }

}
