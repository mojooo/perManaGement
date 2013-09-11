<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title><s:text name="mainmanage.title" /></title>
<link href="images/style.css" rel="stylesheet" type="text/css" />
<link href="images/mainstyle.css" rel="stylesheet" type="text/css" />
<link href="images/departListstyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="images/manage.js"></script>
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
			<s:form action="salaryAction_findMonthPageList.action">
				<s:select name="departId" label="%{getText(\"impleeyList.xuanbumen\")}" labelposition="left" list="departList" listKey="key" listValue="value"
					onchange="this.form.submit();" cssStyle="label-size:14px;" />
			</s:form>
			<s:if test="salarys.size()!=0">
				<table border="1" bgcolor="#e2e2e2" cellspacing="1" align="center" width="100%">
					<caption>
						<h4>薪资列表</h4>
					</caption>
					<tr class="headerClass">
						<th>职工编号</th>
						<th>职工姓名</th>
						<th>年</th>
						<th>月</th>
						<th>基本薪资</th>
						<th>加班费</th>
						<th>请假费</th>
						<th>缺勤费</th>
						<th>总计</th>
						<th>状态</th>
						<th>^_^</th>
					</tr>
					<s:iterator id="salaryList" value="salarys" status="s">
						<tr id="s<s:property value="#s.index"/>" <s:if test="#s.odd">class="oddRow"</s:if> <s:else>class="evenRow"</s:else>
							onmouseover="this.className='selectedRow';"
							onmouseout="mymouseout('s<s:property value='#s.index'/>',
						<s:if test='#s.odd'>'oddRow'</s:if>
						<s:else>'evenRow'</s:else>);">
							<td><s:property value="employeeinfo.empId" /></td>
							<td><s:property value="employeeinfo.empName" /></td>
							<td><s:property value="syear" /></td>
							<td><s:property value="smonth" /></td>

							<td><s:property value="sbase" /></td>
							<td><s:property value="sextra" /></td>
							<td><s:property value="sholiday" /></td>
							<td><s:property value="sabsence" /></td>

							<td><s:property value="stotal" /></td>
							<td><s:property value="sstate==0?'未发放':'已发放'" /></td>
							<td><a href="salaryAction_updateSal.action?salId=<s:property value="salaryId"/>"><s:property value="sstate==0?'发放':''" /></a> <s:property
									value="sstate==0?'':'---'" /></td>
						</tr>
					</s:iterator>
				</table>


				<table border="0" align="center" width="100%px" cellspacing="0" cellpadding="0">
					<tr>
						<td><span class="gongye"><s:text name="impleeyList.gong" /> <s:property value="maxPage" /> <s:text name="impleeyList.ye" /></span></td>
						<td><span class="gongye"><s:property value="totalMessage" /> <s:text name="impleeyList.jilushu" /></span></td>
						<td style="width: 60px;"><span style="font-size: 14px;"> <s:if test="currenPage>1">
									<a href="salaryAction_findMonthPageList.action?currenPage=<s:property value="currenPage-1"/>&salaryMonth=<s:property value="salaryMonth"/>"><s:text
											name="impleeyList.shangye" /></a>
								</s:if>
						</span></td>
						<td style="width: 60px;"><span style="font-size: 14px;"> <s:if test="currenPage<maxPage">
									<a href="salaryAction_findMonthPageList.action?currenPage=<s:property value="currenPage+1"/>&salaryMonth=<s:property value="salaryMonth"/>"><s:text
											name="impleeyList.xiaye" /></a>
								</s:if>
						</span></td>
						<td><span class="gongye"> <s:form action="salaryAction_findMonthPageList.action" onsubmit="return checkmax1();" theme="simple">
									<s:text name="impleeyList.tiaozhuan" />
									<s:textfield name="currenPage" onmouseover="this.select();" cssClass="yeinput" id="aimpage" />
									<s:text name="impleeyList.ye" />
									<s:submit value="%{getText(\"impleeyList.queding\")}" cssClass="queding" />
								</s:form>
						</span></td>
					</tr>
				</table>
			</s:if>
			<s:else>
				<font color="red"><p>没有相应的薪资信息</p></font>
			</s:else>
		</div>
	</div>
</body>
</html>