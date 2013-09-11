<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
		<title><s:text name="mainmanage.title"/></title>
		<link href="images/style.css" rel="stylesheet" type="text/css"/>
		<link href="images/mainstyle.css" rel="stylesheet" type="text/css"/>
		<link href="images/impListstyle.css" rel="stylesheet" type="text/css"/>
		<script language="JavaScript">
		function mymouseout(id,styleclass)
		{
			document.getElementById(id).className=styleclass;
		}
		</script>
	</head>
	<body>
	<div id="container">
	<div style="width:780px;margin-left:100px;margin-top:30px;">
<s:if test="impList.size()!=0">	
				
	<table border="1" bgcolor="#e2e2e2" cellspacing="1" align="center" width="770px">
		<caption style="display:block;background:f2fdf2;color:#007b00;font-size:16px;"><h4><s:property value="departName"/></h4></caption>
		<tr class="headerClass">
			<th>编号</th>
			<th>姓名</th>
			<th>性别</th>
			<th>出生日期</th>
			<th>职位</th>
			<th>基本薪资</th>
			<th>电话</th>
			<th>详细信息</th>
		</tr>
		<s:iterator id="impList" value="impList" status="imp">
			<tr id="imp<s:property value="#imp.index"/>"
				<s:if test="#imp.odd">class="oddRow"</s:if>
				<s:else>class="evenRow"</s:else>
				onmouseover="this.className='selectedRow';" 
				onmouseout="mymouseout('imp<s:property value='#imp.index'/>',
				<s:if test='#imp.odd'>'oddRow'</s:if>
				<s:else>'evenRow'</s:else>);" 
				>
				<td><s:property value="impId"/></td>
				<td><s:property value="impName"/></td>
				<td><s:property value="impGender"/></td>
				<td><s:property value="impBirth"/></td>
				<td><s:property value="impRoll"/></td>
				<td><s:property value="impSalary"/></td>
				<td><s:property value="impTel"/></td>
				<td><a href="impDetail.action?impId=<s:property value="impId"/>" target="_blank">查看</a></td>
			</tr>
		</s:iterator>
	</table>
	
	<div id="buttomop">
	<div class="info">
	<span class="totalpage"><s:text name="impleeyList.gong"/><s:property value="totalPage"/><s:text name="impleeyList.ye"/></span>
	<span class="totalnum"><s:property value="totalMessage"/><s:text name="impleeyList.jilushu"/></span>
	</div>
	<div class="pageop">
	<s:form action="departImp" >
	<s:select name="pageSpan" id="pagespan"
	list="spanList" listKey="key" listValue="value" onchange="this.form.submit();"/>
	</s:form>
	<span class="shangye">
		<s:if test="currenPage>1">
			<a href="departImp.action?currenPage=<s:property value="currenPage-1"/>"><s:text name="impleeyList.shangye"/></a>
		</s:if>
	</span>
	<span class="xiaye">
	<s:if test="currenPage<totalPage">
		<a href="departImp.action?currenPage=<s:property value="currenPage+1"/>"><s:text name="impleeyList.xiaye"/></a>
	</s:if>
	</span>
	<s:form action="departImp" theme="simple">
		<span class="tiaozhuan"><s:text name="impleeyList.tiaozhuan"/></span>
		<s:textfield name="currenPage" cssClass="yefield" onmouseover="this.select();"/><span class="ye"><s:text name="impleeyList.ye"/></span>
		<s:submit value="%{getText(\"impleeyList.queding\")}" cssClass="queding"/>
		
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