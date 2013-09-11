package com.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.biz.IbaseBiz;
import com.entity.Departmentinfo;
import com.entity.Extrawork;
import com.opensymphony.xwork2.ActionSupport;

public class extraworkAction extends ActionSupport {

    private IbaseBiz<Extrawork> baseBiz;
    private Extrawork extrawork;
    private IbaseBiz<Departmentinfo> departBiz;
    private Map<String, Object> departList;
    private String departId = "";
    private String startTime = "";
    private String endTime = "";
    private String empId = "";
    private List<Extrawork> extraworks;
    private int extId;
    private int currenPage = 1;
    private int size = 3;
    private String hql = "from Extrawork e where 1=1";
    private int maxPage;
    private int totalMessage;

    // 计算总页数
    public void getPage(String hql) {
        totalMessage = baseBiz.findList(hql).size();
        maxPage = (totalMessage - 1) / size + 1;
    }

    // 加班单详情查询
    public String extDetail() {
        extrawork = baseBiz.getById(new Extrawork(), extId);
        return "extDetail";
    }

    // 添加加班UI
    public String addExtUI() {

        return "addExtUI";
    }

    // 添加加班单
    public String addExt() {
        Boolean flag = baseBiz.add(extrawork);
        if (flag) {
            return "addExtOk";
        }
        return "Error";
    }

    // 删除加班单
    public String dellExt() {
        Boolean flag = baseBiz.dell(new Extrawork(), extId);
        if (flag) {
            return "dellExtOk";
        }
        return "Error";
    }

    // 修改加班单UI跳转
    public String updateExtUI() {
        extrawork = baseBiz.getById(new Extrawork(), extId);
        return "updateExtUI";
    }

    // 修改加班单
    public String updateExt() {
        Boolean flag = baseBiz.update(extrawork);
        if (flag) {
            return "updateExtOk";
        }
        return "Error";
    }

    // 查询个人加班
    public String findOneExtPageList() {
        if (!"".equals(empId)) {
            hql += " and e.employeeinfo.empId = " + empId;
        }
        if (!"".equals(endTime)) {
            hql += " and e.workTime < '" + endTime + "'";
        }
        if (!"".equals(startTime)) {
            hql += " and e.workTime > '" + startTime + "'";
        }
        System.out.println("hql +++++ " + hql);
        getPage(hql);
        extraworks = baseBiz.findPageList(hql, currenPage, size);
        return "findOneExtPageList";
    }

    // 查询所有加班单信息
    public String findExtPageList() {
        if (!"".equals(departId)) {
            hql += " and e.employeeinfo.departmentinfo.departId = " + departId;
        }
        if (!"".equals(endTime)) {
            hql += " and e.workTime < '" + endTime + "'";
        }
        if (!"".equals(startTime)) {
            hql += " and e.workTime > '" + startTime + "'";
        }
        System.out.println("hql +++++ " + hql);
        getPage(hql);
        extraworks = baseBiz.findPageList(hql, currenPage, size);
        return "findExtPageList";
    }

    public Extrawork getExtrawork() {
        return extrawork;
    }

    public void setExtrawork(Extrawork extrawork) {
        this.extrawork = extrawork;
    }

    public int getIndex() {
        return currenPage;
    }

    public void setIndex(int index) {
        this.currenPage = index;
    }

    public List<Extrawork> getExtraworks() {
        return extraworks;
    }

    public void setBaseBiz(IbaseBiz<Extrawork> baseBiz) {
        this.baseBiz = baseBiz;
    }

    public void setExtId(int extId) {
        this.extId = extId;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getMaxPage() {
        return maxPage;
    }

    public int getTotalMessage() {
        return totalMessage;
    }

    public void setCurrenPage(int currenPage) {
        this.currenPage = currenPage;
    }

    public void setDepartBiz(IbaseBiz<Departmentinfo> departBiz) {
        this.departBiz = departBiz;
    }

    public int getCurrenPage() {
        return currenPage;
    }

    public void setDepartId(String departId) {
        this.departId = departId;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }

    public Map<String, Object> getDepartList() {
        List<Departmentinfo> list = departBiz.findList("from Departmentinfo");
        departList = new HashMap<String, Object>();
        departList.put("", "全部");
        for (Departmentinfo d : list) {
            departList.put(d.getDepartId(), d.getDepartName());
        }
        return departList;
    }
}
