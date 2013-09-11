<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/struts-dojo-tags" prefix="sx"%>
<html>
<head>
<s:head theme="xhtml" />
<sx:head parseContent="true" />
<title><s:text name="mainmanage.title" /></title>
<link href="images/style.css" rel="stylesheet" type="text/css" />
<link href="images/mainstyle.css" rel="stylesheet" type="text/css" />
<link href="images/impListstyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="images/manage.js"></script>
<script type="text/javascript">
	function mymouseout(id, styleclass) {
		document.getElementById(id).className = styleclass;
	}
</script>
<s:head />
</head>
<body>
	<div style="width: 550px; background: white; margin-top: 30px;">
		<s:form theme="simple" onsubmit="return editimpcheck();" action="empAction_updateEmp.action" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend>编辑员工信息</legend>

				<table width="500">
					<tr>
						<td style="width: 80px;">职工编号:</td>
						<td><s:property value="emp.empId" />
							<s:textfield name="emp.empId" cssStyle="display:none" /></td>
					</tr>
					<tr>
						<td>职工姓名:</td>
						<td><s:textfield name="emp.empName" cssClass="inputarea" value="%{emp.empName}" /><span id="impNameerr" class="fielderr"></span></td>
					</tr>
					<tr>
						<td>职工性别:</td>
						<td><s:radio name="emp.empSex" list="genderList" listKey="key" listValue="value" /></td>
					</tr>
					<tr>
						<td>出生日期:</td>
						<td><sx:datetimepicker name="emp.empBirth" toggleType="explode" cssClass="timepick" displayFormat="yyyy-MM-dd" value="%{emp.empBirth}" /></td>
					</tr>
					<tr>
						<td>个人邮箱:</td>
						<td><s:textfield name="emp.empEmail" cssClass="inputarea" value="%{emp.empEmail}" /><span id="impEmailerr" class="fielderr"></span></td>
					</tr>
					<tr>
						<td>个人电话:</td>
						<td><s:textfield name="emp.empTel" cssClass="inputarea" value="%{emp.empTel}" /><span id="impTelerr" class="fielderr"></span></td>
					</tr>
					<tr>
						<td>所属部门:</td>
						<td><s:select name="emp.departmentinfo.departId" list="departList" listKey="key" listValue="value" /></td>
					</tr>
					<tr>
						<td>职 位:</td>
						<td><s:textfield name="emp.empRoll" cssClass="inputarea" value="%{emp.empRoll}" /><span id="impRollerr" class="fielderr"></span></td>
					</tr>
					<tr>
						<td>薪 资:</td>
						<td><s:textfield name="emp.empSalary" value="%{emp.empSalary}" /><span id="impSalaryerr" class="fielderr"></span></td>
					</tr>
					<tr>
						<td>更改头像:</td>
						<td><input type="file" name="upload" class="infile" /></td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<legend>个人简历</legend>
				<span id="impBioerr" class="fielderr"></span>
				<p>
					<s:textarea cols="75" rows="15" name="emp.empBio" value="%{emp.empBio}"></s:textarea>
				</p>
			</fieldset>
			<s:submit value="提 交" cssClass="tijiao" />
		</s:form>
		<script type="text/javascript">
			result = "<s:property value="result"/>";
			if (result != "") {
				alert(result);
			}
		</script>
		<s:fielderror cssClass="fielderr" />
	</div>
</body>
</html>