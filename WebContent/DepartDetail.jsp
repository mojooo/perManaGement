<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<title>部门详细信息</title>
		<link href="images/style.css" rel="stylesheet" type="text/css"/>
		<link href="images/departDetail.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
	<div id="contain">
		<table>
			<caption>部门详细信息</caption>
			<tr>
				<td class="tdtitle">部门编号</td>
				<td class="tddata"><s:property value="department.departId"/></td>
				<td class="tdtitle">部门名称</td>
				
				<td class="tddata"><s:property value="department.departName"/></td>
			</tr>
			<tr>
				<td class="tdtitle">在职人数</td>
				<td class="tddata"><a href="departImp.action?departId=<s:property value="departId"/>" target="_blank" alt="点击查看详细职工信息"><s:property value="department.departNum"/></a></td>
				<td  class="tdtitle"></td>
				<td class="tddata"></td>
			</tr>
		</table>
		<fieldset>
			<legend>部门描述</legend>
			<p><s:property value="department.departDescrip"/></p>
		</fieldset>
	</div>
	</body>
</html>