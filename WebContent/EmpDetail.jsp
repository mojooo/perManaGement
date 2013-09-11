<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<title>职工详细信息</title>
		<link href="images/style.css" rel="stylesheet" type="text/css"/>
		<link href="images/impdetail.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="images/manage.js"></script>
	</head>
	<body>
	<div id="container1">
		<div id="infohead"><s:property value="emp.empName"/>的详细信息</div>
		<div id="pic">
			<div style="height:175;width:200px;">
			<img id="personpic" src="<s:property value="emp.empPic"/>" onload="changePic('personpic');">
			</div>
			
			<span><s:property value="emp.empName"/>的头像</span>
		</div>
	
		<div id="info">
			<table>
				<tr class="evenrow">
					<td>职工编号：</td>
					<td><s:property value="emp.empId"/></td>
				</tr>
				<tr class="oddrow">
					<td>职工姓名：</td>
					<td><s:property value="emp.empName"/></td>
				</tr>
				<tr class="evenrow">
					<td>职工性别：</td>
					<td><s:property value="emp.empSex"/></td>
				</tr>
				<tr class="oddrow">
					<td>出生日期：</td>
					<td><s:property value="emp.empBirth"/></td>
				</tr>
				<tr class="evenrow">
					<td>个人邮箱：</td>
					<td><s:property value="emp.empEmail"/></td>
				</tr>
				<tr class="oddrow">
				 	<td>个人电话：</td>
					<td><s:property value="emp.empTel"/></td>
				</tr>
				<tr class="evenrow">
					<td>所属部门：</td>
					<td><s:property value="emp.departmentinfo.departName"/></td>
				</tr>
				<tr class="oddrow">
					<td>职  位：</td>
					<td><s:property value="emp.empRoll"/></td>
				</tr>
				<tr class="evenrow">
					<td>薪  资：</td>
					<td><s:property value="emp.empSalary"/></td>
				</tr>
			</table>
		</div>
		<div style="clear:both;"></div>
		<div id="jianli">
			<fieldset>
				<legend>个人简历</legend>
				
				<p><s:property value="emp.empBio"/></p>
			</fieldset>
		</div>
	</div>
	</body>
</html>