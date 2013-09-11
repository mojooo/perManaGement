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
				var total=<s:property value="maxPageNo"/>
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

			<table border="1" bgcolor="#e2e2e2" cellspacing="1" align="center" width="500px">
				<caption>
					<h4>部门列表</h4>
				</caption>
				<tr class="headerClass">
					<th>部门编号</th>
					<th>部门姓名</th>
					<th>职工人数</th>
					<th>部门描述</th>
					<th>^_^</th>
					<th>^_^</th>
				</tr>
				<s:iterator id="departList" value="departs" status="d">
					<tr id="d<s:property value="#d.index"/>" <s:if test="#d.odd">class="oddRow"</s:if> <s:else>class="evenRow"</s:else>
						onmouseover="this.className='selectedRow';"
						onmouseout="mymouseout('d<s:property value='#d.index'/>',
						<s:if test='#d.odd'>'oddRow'</s:if>
						<s:else>'evenRow'</s:else>);">
						<td><s:property value="departId" /></td>
						<td><s:property value="departName" /></td>
						<td><a href="empAction_searchEmpList.action?departId=<s:property value="departId"/>" target="_blank" title="点击查看详细职工信息"><s:property
									value="departNum" /></a></td>
						<td><s:property value="departDesc" /></td>
						<td><a href="departAction_dellDep.action?depId=<s:property value="departId"/>">删除</a></td>
						<td><a href="departAction_updateDepUI.action?depId=<s:property value="departId"/>" target="_blank">编辑</a></td>
					</tr>
				</s:iterator>
			</table>
		</div>

		<div>
			<div id="buttomop">
				<div class="info">
					<span class="totalpage"><s:text name="impleeyList.gong" /> <s:property value="maxPageNo" /> <s:text name="impleeyList.ye" /></span> <span
						class="totalnum"><s:property value="totalMessage" /> <s:text name="impleeyList.jilushu" /></span>
				</div>
				<div class="pageop">
					<span class="shangye"> <s:if test="currenPage>1">
							<a href="departAction_findDepPageList.action?currenPage=<s:property value="currenPage-1"/>"><s:text name="impleeyList.shangye" /></a>
						</s:if>
					</span> <span class="xiaye"> <s:if test="currenPage<maxPageNo">
							<a href="departAction_findDepPageList.action?currenPage=<s:property value="currenPage+1"/>"><s:text name="impleeyList.xiaye" /></a>
						</s:if>
					</span>

					<s:form action="departAction_findDepPageList.action" theme="simple" onsubmit="return checkmax1()">
						<span class="tiaozhuan"><s:text name="impleeyList.tiaozhuan" /></span>
						<s:textfield id="tiaoye" name="currenPage" cssClass="yefield" onmouseover="this.select();" />
						<span class="ye"><s:text name="impleeyList.ye" /></span>
						<s:submit value="%{getText(\"impleeyList.queding\")}" cssClass="queding" onmouseover="this.className='quedingover';"
							onmouseout="this.className='queding';" />
					</s:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>