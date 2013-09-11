<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title><s:text name="mainmanage.title" /></title>
<link href="images/style.css" rel="stylesheet" type="text/css" />
<link href="images/mainstyle.css" rel="stylesheet" type="text/css" />
<link href="images/departListstyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
		function mymouseout(id,styleclass)
		{
			document.getElementById(id).className=styleclass;
		}
		function checkmax1()
		{
			var total=<s:property value="maxPage"/>
			var page=document.getElementById("aimpage").value;
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
			<s:form action="holsAction_adminHols.action" theme="simple">
				<table style="font-size: 14px; color: #404040;">
					<tr>
						<td>请选择部门:<s:select name="departId" label="%{getText(\"impleeyList.xuanbumen\")}" labelposition="left" list="departList" listKey="key"
								emptyOption="true" listValue="value" onchange="this.form.submit();" cssStyle="label-size:14px;" />
						</td>
						<td>状态:<s:select name="holsState" label="%{getText(\"impleeyList.xuanbumen\")}" labelposition="left" list="stateList" listKey="key"
								emptyOption="true" listValue="value" onchange="this.form.submit();" cssStyle="label-size:14px;" />
						</td>
					</tr>
				</table>


			</s:form>

			<table border="1" bgcolor="#e2e2e2" cellspacing="1" align="center" width="100%">
				<caption>
					<h4>薪资列表</h4>
				</caption>
				<tr class="headerClass">
					<th>职工编号</th>
					<th>姓名</th>
					<th>部门</th>
					<th>申请时间</th>
					<th>起始时间</th>
					<th>终止时间</th>
					<th>原因</th>
					<th>状态</th>
					<th>^_^</th>
				</tr>
				<s:iterator id="applyList" value="holss" status="h">
					<tr id="h<s:property value="#h.index"/>" <s:if test="#h.odd">class="oddRow"</s:if> <s:else>class="evenRow"</s:else>
						onmouseover="this.className='selectedRow';"
						onmouseout="mymouseout('h<s:property value='#h.index'/>',
						<s:if test='#h.odd'>'oddRow'</s:if>
						<s:else>'evenRow'</s:else>);">
						<td><s:property value="employeeinfo.empId" /></td>
						<td><s:property value="employeeinfo.empName" /></td>
						<td><s:property value="employeeinfo.departmentinfo.departName" /></td>
						<td><s:property value="applyTime" /></td>

						<td><s:property value="startTime" /></td>
						<td><s:property value="endTime" /></td>
						<td><s:property value="executes" /></td>
						<td><s:property value="holsState==0?'未处理':''" /> <s:property value="holsState==1?'同意':''" /> <s:property value="holsState==2?'撤消':''" />
							<s:property value="holsState==3?'拒绝':''" /></td>

						<td><a href="holsAction_updateHols.action?holsId=<s:property value="holsId"/>&holsState=1"><s:property value="holsState==0?'同意':''" /></a>
							<s:property value="holsState==0?'/':''" /> <a href="holsAction_updateHols.action?holsId=<s:property value="holsId"/>&holsState=3"><s:property
									value="holsState==0?'拒绝':''" /></a> <s:property value="holsState!=0?'---':''" /></td>

					</tr>
				</s:iterator>
			</table>


			<table border="0" align="center" width="100%px" cellspacing="0" cellpadding="0">
				<tr>
					<td><span class="gongye"><s:text name="impleeyList.gong" /> <s:property value="maxPage" /> <s:text name="impleeyList.ye" /></span></td>
					<td><span class="gongye"><s:property value="totalMessage" /> <s:text name="impleeyList.jilushu" /></span></td>
					<td style="width: 60px;"><span style="font-size: 14px;"> <s:if test="currenPage>1">
								<a href="holsAction_adminHols.action?currenPage=<s:property value="currenPage-1"/>"><s:text name="impleeyList.shangye" /></a>
							</s:if>
					</span></td>
					<td style="width: 60px;"><span style="font-size: 14px;"> <s:if test="currenPage<maxPage">
								<a href="holsAction_adminHols.action?currenPage=<s:property value="currenPage+1"/>"><s:text name="impleeyList.xiaye" /></a>
							</s:if>
					</span></td>
					<td><span class="gongye"> <s:form action="holsAction_adminHols.action" onsubmit="return checkmax1();" theme="simple">
								<s:textfield name="departId" cssStyle="display:none" />
								<s:text name="impleeyList.tiaozhuan" />
								<s:textfield name="currenPage" onmouseover="this.select();" cssClass="yeinput" id="aimpage" />
								<s:text name="impleeyList.ye" />
								<s:submit value="%{getText(\"impleeyList.queding\")}" cssClass="queding" />
							</s:form>
					</span></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>