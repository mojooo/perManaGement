<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/struts-dojo-tags" prefix="sx"%>
<html>
<head>
<s:head theme="xhtml"/><sx:head parseContent="true"/>
<title><s:text name="mainmanage.title" /></title>
<link href="images/style.css" rel="stylesheet" type="text/css" />
<link href="images/mainstyle.css" rel="stylesheet" type="text/css" />
<link href="images/departListstyle.css" rel="stylesheet" type="text/css" />
<link href="images/impdetail.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function mymouseout(id, styleclass) {
		document.getElementById(id).className = styleclass;
	}
</script>
<s:head />
</head>
<body>
	<div id="container">

		<div id="tophead">
			<jsp:include page="Top.jsp"></jsp:include>
		</div>
		<div id="leftcontent">
			<jsp:include page="LeftTree2.jsp"></jsp:include>
		</div>
		<div id="maincontent">
			<s:form theme="simple" action="attendanceAction_getByTimePageList.action">
				<table>
					<tr>
						<td>请选择时间段<sx:datetimepicker name="from_day" toggleType="explode" value="today" displayFormat="yyyy-MM-dd" /></td>
						<td>至<sx:datetimepicker name="to_day" toggleType="explode" value="today"  displayFormat="yyyy-MM-dd"/> <s:submit value="确定" /></td>
					</tr>
				</table>
			</s:form>
		</div>
	</div>
</body>
</html>