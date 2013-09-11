<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title><s:text name="mainmanage.title" /></title>
<link href="images/style.css" rel="stylesheet" type="text/css" />
<link href="images/mainstyle.css" rel="stylesheet" type="text/css" />
<link href="images/impListstyle.css" rel="stylesheet" type="text/css" />
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
			<s:form theme="simple" method="post" action="empAction_searchEmpList.action">
				<table width="100%" style="color: #404040; font-size: 14px; text-align: center;">
					<tr>
						<td>部门:<s:select name="departId" label="" labelposition="left" list="departList" listKey="key" listValue="value" />
						</td>
						<td>职工编号:<s:textfield name="empId" cssStyle="width:70px;" />
						</td>
						<td>职工姓名:<s:textfield name="empName" cssStyle="width:70px;" />
						</td>
						<td>薪资:<s:textfield name="downSalary" cssStyle="width:60px;" />至<s:textfield name="upSalary" cssStyle="width:60px;" />
						</td>
						<td><s:submit value="确定" /></td>
					</tr>
				</table>
			</s:form>
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
						<th>^_^</th>
					</tr>
					<s:iterator id="impList" value="emps" status="e">
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
							<td><a href="empAction_updateEmpUI.action?empId=<s:property value="empId"/>" target="_blank">编辑</a>/<a
								href="empAction_dellEmp.action?empId=<s:property value="empId"/>">删除</a></td>
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
								<a href="searchImp.action?index=<s:property value="index-1"/>"><s:text name="impleeyList.shangye" /></a>
							</s:if>
						</span> <span class="xiaye"> <s:if test="index<PageCount">
								<a href="searchImp.action?index=<s:property value="index+1"/>"><s:text name="impleeyList.xiaye" /></a>
							</s:if>
						</span>
						<s:form action="searchImp" theme="simple" onsubmit="return checkmax1()">
							<span class="tiaozhuan"><s:text name="impleeyList.tiaozhuan" /></span>
							<s:textfield id="tiaoye" name="index" cssClass="yefield" onmouseover="this.select();" />
							<span class="ye"><s:text name="impleeyList.ye" /></span>
							<s:submit value="%{getText(\"impleeyList.queding\")}" cssClass="queding" />

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