<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
	<head><meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
		<title><s:text name="mainmanage.title"/></title>
		<link href="images/style.css" rel="stylesheet" type="text/css"/>
		<link href="images/mainstyle.css" rel="stylesheet" type="text/css"/>
		<link href="images/departListstyle.css" rel="stylesheet" type="text/css"/>
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
		<s:head/>
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
			<table border="1" bgcolor="#e2e2e2" cellspacing="1" align="center" width="100%">
				<caption><h4>请假情况列表</h4></caption>
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
					<tr id="h<s:property value="#h.index"/>"
						<s:if test="#h.odd">class="oddRow"</s:if>
						<s:else>class="evenRow"</s:else>
						onmouseover="this.className='selectedRow';" 
						onmouseout="mymouseout('h<s:property value='#h.index'/>',
						<s:if test='#h.odd'>'oddRow'</s:if>
						<s:else>'evenRow'</s:else>);" 
						>
						<td><s:property value="employeeinfo.empId"/></td>
						<td><s:property value="employeeinfo.empName"/></td>
						<td><s:property value="employeeinfo.departmentinfo.departName"/></td>
						<td><s:property value="applyTime"/></td>
						
						<td><s:property value="startTime"/></td>
						<td><s:property value="endTime"/></td>
						<td><s:property value="executes"/></td>
						<td>
							<s:property value="holsState==0?'未处理':''"/>
							<s:property value="holsState==1?'同意':''"/>
							<s:property value="holsState==2?'撤消':''"/>
							<s:property value="holsState==3?'拒绝':''"/>
						</td>
						
						<td>
						
						
							<a href="holsAction_dellHols.action?holsId=<s:property value="holsId"/>"><s:property value="holsState==0?'撤消':''"/></a>
							<s:property value="holsState!=0?'---':''"/>
						</td>
				
					</tr>
				</s:iterator>
			</table>
		
		
			<table border="0" align="center" width="100%px" cellspacing="0" cellpadding="0">
				<tr>
					<td><span class="gongye"><s:text name="impleeyList.gong"/><s:property value="maxPage"/><s:text name="impleeyList.ye"/></span></td>
					<td><span class="gongye"><s:property value="totalMessage"/><s:text name="impleeyList.jilushu"/></span></td>
					<td style="width:100px;">
					</td>
					<td style="width:60px;">
						<span style="font-size:14px;">
						<s:if test="currenPage>1">
							<a href="appSearch.action?currenPage=<s:property value="currenPage-1"/>&departId=<s:property value="departId"/>"><s:text name="impleeyList.shangye"/></a>
						</s:if>
						</span>
					</td>
					<td style="width:60px;">
						<span style="font-size:14px;">
						<s:if test="currenPage<maxPage">
						<a href="appSearch.action?currenPage=<s:property value="currenPage+1"/>&departId=<s:property value="departId"/>"><s:text name="impleeyList.xiaye"/></a>
						</s:if>
						</span>
					</td>
					<td>
						<span class="gongye">
						<s:form action="appSearch" onsubmit="return checkmax1();" theme="simple">
						<s:textfield name="departId" cssStyle="display:none"/>
						<s:text name="impleeyList.tiaozhuan"/><s:textfield name="currenPage" id="aimpage" onmouseover="this.select();" cssClass="yeinput"/><s:text name="impleeyList.ye"/>
						<s:submit value="%{getText(\"impleeyList.queding\")}" cssClass="queding"/>
						</s:form>
						</span>
					</td>
				</tr>
			</table>
		</div>
	</div>
	</body>
</html>