<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head><meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
		<title><s:text name="mainmanage.title"/></title>
		<link href="images/style.css" rel="stylesheet" type="text/css"/>
		<link href="images/qingjiadetail.css" rel="stylesheet" type="text/css"/>
	</head>
	<body>
	<div id="container">
		<table>
			<caption>请假详细信息</caption>
			<tr>
				<td>职工编号:</td>
				<td><s:property value="holsinfo.impId"/></td>
				<td>职工姓名:</td>
				<td><s:property value="holsinfo.impName"/></td>
			</tr>
			<tr>
				<td>申请时间:</td>
				<td><s:property value="holsinfo.applyTime"/></td>
				<td>天数:</td>
				<td><s:property value="holsinfo.holdays"/></td>
			</tr>
			<tr>
				<td>开始时间:</td>
				<td><s:property value="holsinfo.startTime"/></td>
				<td>结束时间:</td>
				<td><s:property value="holsinfo.endTime"/></td>
			</tr>
		</table>
		<fieldset>
			<legend>请假原因:</legend>
			<p><s:property value="holsinfo.executes"/></p>
		</fieldset>
	</div>
	</body>
</html>