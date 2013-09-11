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
<link href="images/addimp.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="images/manage.js"></script>
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
			<div id="ftdiv">
				<s:form onsubmit="return addimpcheck();" theme="simple" action="empAction_addEmp.action" method="post" enctype="multipart/form-data">
					<fieldset>
						<legend>注册新员工</legend>

						<table width="500">
							<tr>
								<td style="width: 80px;">职工编号:</td>
								<td><s:textfield name="emp.empId" id="impId" cssClass="inputarea" /><span id="impIderr" class="fielderr"></span></td>

							</tr>
							<tr>
								<td>职工姓名:</td>
								<td><s:textfield name="emp.empName" id="impName" cssClass="inputarea" /><span id="impNameerr" class="fielderr"></span></td>
							</tr>
							<tr>
								<td>职工性别:</td>
								<td><s:radio name="emp.empSex" list="genderList" listKey="key" listValue="value" /></td>
							</tr>
							<tr>
								<td>出生日期:</td>
								<td><sx:datetimepicker name="emp.empBirth" id="impBirth" label="" toggleType="explode" value="today" cssClass="timepick" displayFormat="yyyy-MM-dd"/><span
									id="impBirtherr" class="fielderr"></span></td>
							</tr>
							<tr>
								<td>个人邮箱:</td>
								<td><s:textfield name="emp.empEmail" id="impEmail" cssClass="inputarea" /><span id="impEmailerr" class="fielderr"></span></td>
							</tr>
							<tr>
								<td>个人电话:</td>
								<td><s:textfield name="emp.empTel" id="impTel" cssClass="inputarea" /><span id="impTelerr" class="fielderr"></span></td>
							</tr>
							<tr>
								<td>所属部门:</td>
								<td><s:select name="emp.departmentinfo.departId" list="departList" listKey="key" listValue="value" /></td>
							</tr>
							<tr>
								<td>职 位:</td>
								<td><s:textfield name="emp.empRoll" id="impRoll" cssClass="inputarea" /><span id="impRollerr" class="fielderr"></span></td>
							</tr>
							<tr>
								<td>薪 资:</td>
								<td><s:textfield id="impSalary" name="emp.empSalary" /><span id="impSalaryerr" class="fielderr"></span></td>
							</tr>
							<tr>
								<td>上传头像:</td>
								<td><input type="file" name="upload" class="infile" /></td>
							</tr>
						</table>
					</fieldset>
					<fieldset>
						<legend>个人简历</legend>
						<span id="impBioerr" class="fielderr"></span>
						<p>
							<s:textarea cols="68" rows="15" id="impBio" name="emp.empBio"></s:textarea>
						</p>
					</fieldset>
					<s:submit value="提 交" cssClass="tijiao" onmouseover="this.className='tijiaoover';" onmouseout="this.className='tijiao';" />
				</s:form>
				<s:fielderror cssClass="fielderr" />
				<script type="text/javascript">
					result = "<s:property value="result"/>";
					if (result != "") {
						alert(result);
					}
				</script>
			</div>

		</div>
	</div>
</body>
</html>