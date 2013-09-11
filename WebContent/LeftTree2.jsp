<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
	<head>
		<title>高级链接</title>
		<link href="images/tree2style.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
		<div id="leftTree">
			<ul>	
				<li><a href="empAction_empDet.action?empId=${emp.empId }">个人基本信息</a></li>
				<li><a href="PKaoQinSearch.jsp">考勤记录查询</a></li>			
				<li><a href="salaryAction_findSalList.action">个人工资列表</a></li>	
				<li><a href="holsAction_addHolsUI.action">假期申请</a></li>
				<li><a href="holsAction_findHolsPageList.action">假期申请查询</a></li>
				<li><a href="ChangePwd.jsp">修改密码</a></li>
			</ul>
		</div>
	</body>
</html>