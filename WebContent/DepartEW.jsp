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
<link href="images/departListstyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
			function mymouseout(id,styleclass)
			{
				document.getElementById(id).className=styleclass;
			}
			function checkmax1()
			{
				var total=<s:property value="maxPage"/>
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
			<s:form theme="simple" action="extraworkAction_findExtPageList.action">
				<table width="700px" style="font-size: 14px; color: #404040;" align="center">
					<tr>
						<td>请选择部门:<s:select name="departId" label="%{getText(\"impleeyList.xuanbumen\")}" labelposition="left" list="departList" listKey="key"
								listValue="value" />
						</td>
						<td>起始时间:<sx:datetimepicker name="startTime" toggleType="explode" value="today" displayFormat="yyyy-MM-dd" />
						</td>
						<td>终止时间:<sx:datetimepicker name="endTime" toggleType="explode" value="today" displayFormat="yyyy-MM-dd" />
						</td>
						<td><s:submit value="查询" /></td>
					</tr>

				</table>
			</s:form>

			<s:if test="extraworks.size()>0">
				<table border="1" bgcolor="#e2e2e2" cellspacing="1" align="center" width="700px">
					<caption>
						<h4>个人加班列表</h4>
					</caption>
					<tr class="headerClass">
						<th>职工编号</th>
						<th>职工姓名</th>
						<th>所属部门</th>
						<th>加班日期</th>
						<th>加班原因</th>
						<th>^_^</th>
						<th>^_^</th>
					</tr>
					<s:iterator id="dEWList" value="extraworks" status="e">
						<tr id="dEWRecord<s:property value="#e.index"/>" <s:if test="#e.odd">class="oddRow"</s:if> <s:else>class="evenRow"</s:else>
							onmouseover="this.className='selectedRow';"
							onmouseout="mymouseout('e<s:property value='#e.index'/>',
						<s:if test='#e.odd'>'oddRow'</s:if>
						<s:else>'evenRow'</s:else>);">
							<td><s:property value="employeeinfo.empId" /></td>
							<td><s:property value="employeeinfo.empName" /></td>
							<td><s:property value="employeeinfo.departmentinfo.departName" /></td>
							<td><s:property value="workTime" /></td>
							<td><s:property value="executes" /></td>
							<td><a href="extraworkAction_extDetail.action?extId=<s:property value="extraId"/>" target="_blank">详情</a></td>
							<td><a href="extraworkAction_dellExt.action?extId=<s:property value="extraId"/>">删除</a></td>
						</tr>
					</s:iterator>
				</table>

				<table border="0" align="center" width="700px" cellspacing="0" cellpadding="0">
					<tr>
						<td><span class="gongye"><s:text name="impleeyList.gong" /> <s:property value="maxPage" /> <s:text name="impleeyList.ye" /></span></td>
						<td><span class="gongye"><s:property value="totalMessage" /> <s:text name="impleeyList.jilushu" /></span></td>
						<td style="width: 60px;"><span style="font-size: 14px;"> <s:if test="currenPage>1">
									<a href="extraworkAction_findExtPageList.action?currenPage=<s:property value="currenPage-1"/>"><s:text name="impleeyList.shangye" /></a>
								</s:if>
						</span></td>
						<td style="width: 60px;"><span style="font-size: 14px;"> <s:if test="currenPage<maxPage">
									<a href="extraworkAction_findExtPageList.action?currenPage=<s:property value="currenPage+1"/>"><s:text name="impleeyList.xiaye" /></a>
								</s:if>
						</span></td>
						<td><span class="gongye"> <s:form action="extraworkAction_findExtPageList.action" theme="simple" onsubmit="return checkmax1()">
									<s:text name="impleeyList.tiaozhuan" />
									<s:textfield id="tiaoye" name="currenPage" onmouseover="this.select();" cssClass="yeinput" />
									<s:text name="impleeyList.ye" />
									<s:submit value="%{getText(\"impleeyList.queding\")}" cssClass="queding" />
								</s:form>
						</span></td>
					</tr>
				</table>
			</s:if>
			<s:else>
				<p class="fielderr" style="margin-left: 40px;">
					没有相关信息
					<s:fielderror cssClass="fielderr" cssStyle="margin-left:40px;" />
				</p>
			</s:else>

		</div>
	</div>
</body>
</html>