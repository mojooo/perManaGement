<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="/struts-dojo-tags" prefix="sx"%>
<html>
<head>
<s:head theme="xhtml" />
<sx:head parseContent="true" />
<title><s:text name="mainmanage.title" /></title>
<link href="images/style.css" rel="stylesheet" type="text/css" />
<link href="images/mainstyle.css" rel="stylesheet" type="text/css" />
<link href="images/qiandao.css" rel="stylesheet" type="text/css" />
<s:head />
</head>
<body>
	<div id="container">
		<div id="tophead">
			<jsp:include page="Top.jsp" />
		</div>
		<div id="leftcontent">
			<jsp:include page="LeftTree.jsp" />
		</div>
		<div id="maincontent">
			<s:form theme="simple" method="post" action="attendanceAction_dayAdtOpUI.action">
				<span class="choseinfo">请选择日期：</span>
				<sx:datetimepicker name="opDate" toggleType="explode" value="today" />
				<s:submit value="生成签到表" cssClass="shengcheng" />
				<s:fielderror cssClass="fielderr" />
				<font color="red"><s:property value="result" /></font>

			</s:form>

		</div>
	</div>
</body>
</html>