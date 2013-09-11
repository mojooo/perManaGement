<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<head>
<s:head theme="xhtml" />
<sx:head parseContent="true" />
<title><s:text name="mainmanage.title" /></title>
<link href="images/style.css" rel="stylesheet" type="text/css" />
<link href="images/mainstyle.css" rel="stylesheet" type="text/css" />
<link href="images/addextraword.css" rel="stylesheet" type="text/css" />
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
			<div id="contain">
				<s:form theme="simple" method="post" action="extraworkAction_addExt.action">
					<table>
						<caption>
							<h4>添加加班信息</h4>
						</caption>
						<tr>
							<td>职工编号:</td>
							<td><s:textfield name="extrawork.employeeinfo.empId" /></td>
							<td>加班日期:</td>
							<td><sx:datetimepicker name="extrawork.workTime" toggleType="explode" value="today"  displayFormat="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<td colspan="4">
								<fieldset>
									<legend>加班原因:</legend>
									<s:textarea cols="70" rows="10" name="extrawork.executes"></s:textarea>
								</fieldset>
							</td>
						</tr>
					</table>
					<s:submit value="提交" cssClass="tijiao" />
				</s:form>
				<s:fielderror cssClass="fielderr" />
			</div>
		</div>
		<s:if test="(read==false)">
			<script language="JavaScript">
				window.onload = alertResult;

				function alertResult() {
					alert("<s:property value="result"/>");
				}
			</script>
		</s:if>
	</div>
</body>
</html>