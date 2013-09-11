<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title><s:text name="mainmanage.title" /></title>
<link href="images/style.css" rel="stylesheet" type="text/css" />
<link href="images/mainstyle.css" rel="stylesheet" type="text/css" />
<link href="images/qiandao.css" rel="stylesheet" type="text/css" />
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

			<div>
				<s:form action="attendanceAction_addAtd.action" theme="simple">
					<span style="font-size: 14px; color: #404040">请输入职工号：</span>
					<s:textfield name="attendance.employeeinfo.empId" cssStyle="height:20px;" />
					<s:submit value="签到" cssClass="tiaozhuan" />
				</s:form>
				<table border="1" bgcolor="#e2e2e2" cellspacing="1" align="center" width="770px">
					<caption>
						<h4>职工签到表</h4>
					</caption>
					<tr class="headerClass">
						<th>职工编号</th>
						<th>职工姓名</th>
						<th>所属部门</th>
						<th>日期</th>
						<th>状态</th>
						<th>^_^</th>
					</tr>
					<s:iterator id="qianDaoList" value="attendances" status="a">
						<tr id="a<s:property value="#a.index"/>" <s:if test="#a.odd">class="oddRow"</s:if> <s:else>class="evenRow"</s:else>
							onmouseover="this.className='selectedRow';"
							onmouseout="mymouseout('a<s:property value='#a.index'/>',
							<s:if test='#a.odd'>'oddRow'</s:if>
							<s:else>'evenRow'</s:else>);">
							<td><s:property value="employeeinfo.empId" /></td>
							<td><s:property value="employeeinfo.empName" /></td>
							<td><s:property value="employeeinfo.departmentinfo.departName" /></td>
							<td><s:property value="attendTime" /></td>
							<td><s:property value="attendState==0?'缺勤':(attendState==1?'在职':'请假')" /></td>
							<td><a href="attendanceAction_updateAtd.action?atdId=<s:property value="attendId"/>"><s:property value="attendState==0?'签到':''" /></a> <s:property
									value="attendState!=0?'---':''" /></td>
						</tr>
					</s:iterator>
				</table>
				<s:form>
				</s:form>
				<div>
					<s:form theme="simple" action="attendanceAction_addAtdUI.action" onsubmit="return checkmax1()">
						<table width="770px">
							<td style="width: 400px; font-size: 14px; color: #404040">共<s:property value="PageCount" />页 <s:property value="totalMessage" />条记录
							</td>
							<td style="width: 400px; font-size: 14px;"><s:if test="index>1">
									<a href="attendanceAction_addAtdUI.action?index=<s:property value="index-1"/>">上一页</a>
								</s:if></td>
							<td style="width: 400px; font-size: 14px;"><s:if test="index<PageCount">
									<a href="attendanceAction_addAtdUI.action?index=<s:property value="index+1"/>">下一页</a>
								</s:if></td>
							<td style="width: 400px; font-size: 14px; color: #404040">跳转到第<s:textfield id="tiaoye" name="index" cssStyle="width:20px;height:20px;"
									onmouseover="this.select();" />页 <s:submit value="跳转" cssClass="tiaozhuan" />
							</td>
						</table>
					</s:form>
				</div>
				<s:if test="read==false">
					<script type="text/javascript">
					alert("<s:property value="result"/>");
					</script>
				</s:if>
			</div>
		</div>
	</div>
</body>
</html>