<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/struts-dojo-tags" prefix="sx"%>
<html>
<head>
<s:head theme="xhtml" />
<sx:head parseContent="true" />
<title><s:text name="mainmanage.title" /></title>
<link href="images/style.css" rel="stylesheet" type="text/css" />
<link href="images/mainstyle.css" rel="stylesheet" type="text/css" />
<link href="images/departListstyle.css" rel="stylesheet" type="text/css" />

<s:head />
</head>
<body>
	<div id="container">
		<div id="tophead">
			<jsp:include page="Top.jsp" />
		</div>
		<div id="leftcontent">
			<jsp:include page="LeftTree2.jsp" />
		</div>
		<div id="maincontent">
			<s:form theme="simple" action="holsAction_addHols.action">
				<table align="center" style="color: #404040; font-size: 14px;">
					<tr>
						<td>起始时间:<sx:datetimepicker name="hols.startTime" toggleType="explode" value="" displayFormat="yyyy-MM-dd" />
						</td>
						<td>终止时间:<sx:datetimepicker name="hols.endTime" toggleType="explode" value="" displayFormat="yyyy-MM-dd" /> <s:submit value="确定" />
						</td>

					</tr>
					<tr>
						<td colspan="2">
							<fieldset>
								<legend>请假原因</legend>
								<s:textarea cols="85" rows="15" name="hols.executes">
								</s:textarea>
							</fieldset>
						</td>
					</tr>
					<tr>
						<td><span style="color: red; font-size: 14px;"><s:property value="result" /> <s:fielderror cssClass="fielderr" /></span></td>

					</tr>
				</table>
			</s:form>

		</div>

	</div>

</body>
</html>