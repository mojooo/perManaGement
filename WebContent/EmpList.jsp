<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title><s:text name="mainmanage.title" /></title>
<link href="images/style.css" rel="stylesheet" type="text/css" />
<link href="images/mainstyle.css" rel="stylesheet" type="text/css" />
<link href="images/impListstyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="images/manage.js"></script>
<script type="text/javascript">
		function mymouseout(id,styleclass)
		{
			document.getElementById(id).className=styleclass;
		}
		
		function checkmax1()
		{
			var total=<s:property value="PageCount"/>
			var page=document.getElementById("tiaoye").value;
			if(page>total)
			{
				alert("超过最大页数");
				
				return false;
			}
			else
			{
				return true;
			}
		}
		</script>
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
			<div id="topop">
				<s:form action="impleeyList">
				</s:form>

				<span class="xinzipai"><s:text name="impleeyList.xinzipai" /> <a href="empAction_findEmpPageList.action?orderBySalary=1"> <s:text
							name="impleeyList.shengxu" /></a> <img src="images/sheng.gif" style="height: 14px; width: 7px;"> <img src="images/jiang.gif"
					style="height: 14px; width: 7px;"> <a href="empAction_findEmpPageList.action?orderBySalary=-1"> <s:text name="impleeyList.jiangxu" /></a></span>
				<s:text name="impleeyList.nianlingpai" />
				<a href="empAction_findEmpPageList.action?orderByAge=1"> <s:text name="impleeyList.shengxu" /></a> <img src="images/sheng.gif"
					style="height: 14px; width: 7px;"> <img src="images/jiang.gif" style="height: 14px; width: 7px;"> <a
					href="empAction_findEmpPageList.action?orderByAge=-1"><s:text name="impleeyList.jiangxu" /></a>

			</div>
			<s:if test="emps.size()!=0">

				<table border="1" bgcolor="#e2e2e2" cellspacing="1" align="center" width="770px">

					<tr class="headerClass">
						<th>编号</th>
						<th>姓名</th>
						<th>性别</th>
						<th>出生日期</th>
						<th>所属部门</th>
						<th>职位</th>
						<th>基本薪资</th>
						<th>电话</th>
						<th>详细信息</th>
					</tr>
					<s:iterator id="empList" value="emps" status="e">
						<tr id="e<s:property value="#e.index"/>" <s:if test="#e.odd">class="oddRow"</s:if> <s:else>class="evenRow"</s:else>
							onmouseover="this.className='selectedRow';"
							onmouseout="mymouseout('e<s:property value='#e.index'/>',
							<s:if test='#e.odd'>'oddRow'</s:if>
							<s:else>'evenRow'</s:else>);">
							<td><s:property value="empId" /></td>
							<td><s:property value="empName" /></td>
							<td><s:property value="empSex" /></td>
							<td><s:property value="empBirth" /></td>
							<td><s:property value="departmentinfo.departName" /></td>
							<td><s:property value="empRoll" /></td>
							<td><s:property value="empSalary" /></td>
							<td><s:property value="empTel" /></td>
							<td><a href="empAction_empDetail.action?empId=<s:property value="empId"/>" target="_blank">查看</a></td>
						</tr>
					</s:iterator>
				</table>

				<div id="buttomop">
					<div class="info">
						<span class="totalpage"><s:text name="impleeyList.gong" /> <s:property value="PageCount" /> <s:text name="impleeyList.ye" /></span> <span
							class="totalnum"><s:property value="totalMessage" /> <s:text name="impleeyList.jilushu" /></span>
					</div>
					<div class="pageop">
						<span class="shangye"> <s:if test="index>1">
								<a href="empAction_findEmpPageList.action?index=<s:property value="index-1"/>"><s:text name="impleeyList.shangye" /></a>
							</s:if>
						</span> <span class="xiaye"> <s:if test="index<PageCount">
								<a href="empAction_findEmpPageList.action?index=<s:property value="index+1"/>"><s:text name="impleeyList.xiaye" /></a>
							</s:if>
						</span>

						<s:form action="empAction_findEmpPageList.action" theme="simple" onsubmit="return checkmax1()">
							<span class="tiaozhuan"><s:text name="impleeyList.tiaozhuan" /></span>
							<s:textfield id="tiaoye" name="index" cssClass="yefield" onmouseover="this.select();" />
							<span class="ye"><s:text name="impleeyList.ye" /></span>
							<s:submit value="%{getText(\"impleeyList.queding\")}" cssClass="queding" onmouseover="this.className='quedingover';"
								onmouseout="this.className='queding';" />
						</s:form>
					</div>
				</div>

			</s:if>
			<s:else>
				<p>没有相应的职工信息</p>
			</s:else>
		</div>
	</div>
</body>
</html>