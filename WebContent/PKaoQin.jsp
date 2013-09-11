<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/struts-dojo-tags" prefix="sx"%>
<html>
<head>
<title><s:text name="mainmanage.title" /></title>
<s:head theme="xhtml" />
<sx:head parseContent="true" />
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
			<jsp:include page="LeftTree2.jsp" />
		</div>
		<div id="maincontent">


			<div>
				<s:form theme="simple" action="attendanceAction_getByTimePageList.action">
					<table width="100%" style="font-size: 14px; color: #404040;">
						<tr>
							<td>选择状态: <s:select name="attendState" label="请选择状态：" labelposition="left" list="stateList" listKey="key" listValue="value" />
							</td>
							<td>起始时间:<sx:datetimepicker name="from_day" toggleType="explode" displayFormat="yyyy-MM-dd" />
							</td>
							<td>终止时间:<sx:datetimepicker name="to_day" toggleType="explode" displayFormat="yyyy-MM-dd" />
							</td>
							<td><s:submit value="确定" /></td>
						</tr>
					</table>


				</s:form>
				<s:if test="attendances.size()>0">
					<table border="1" bgcolor="#e2e2e2" cellspacing="1" align="center" width="770px">
						<caption>
							<h4>考勤表</h4>
						</caption>
						<tr class="headerClass">
							<th>职工编号</th>
							<th>职工姓名</th>
							<th>所属部门</th>
							<th>日期</th>
							<th>状态</th>

						</tr>
						<s:iterator id="recordList" value="attendances" status="atd">
							<tr id="qiandaorecord<s:property value="#attendances.index"/>" <s:if test="#attendances.odd">class="oddRow"</s:if>
								<s:else>class="evenRow"</s:else> onmouseover="this.className='selectedRow';"
								onmouseout="mymouseout('atd<s:property value='#atd.index'/>',
							<s:if test='#atd.odd'>'oddRow'</s:if>
							<s:else>'evenRow'</s:else>);">
								<td><s:property value="employeeinfo.empId" /></td>
								<td><s:property value="employeeinfo.empName" /></td>
								<td><s:property value="employeeinfo.departmentinfo.departName" /></td>
								<td><s:property value="attendTime" /></td>
								<td><s:property value="attendState==0?'缺勤':(attendState==1?'在职':'')" /> <a
									href="qingJiaDetail.action?empId=<s:property value="empId"/>&date=<s:property value="date"/>" target="_blank"><s:property
											value="attendState==2?'请假':''" /></a></td>
							</tr>
						</s:iterator>
					</table>
					<div>
						<s:form theme="simple" action="attendanceAction_getByTimePageList.action" onsubmit="return checkmax1();">
							<table width="770px">
								<td style="width: 400px; font-size: 14px; color: #404040">共<s:property value="PageCount" />页 <s:property value="totalMessage" />条记录
								</td>
								<td style="width: 400px; font-size: 14px;"><s:if test="index>1">
										<a href="attendanceAction_getByTimePageList?index=<s:property value="index-1"/>">上一页</a>
									</s:if></td>
								<td style="width: 400px; font-size: 14px;"><s:if test="index<PageCount">
										<a href="attendanceAction_getByTimePageList.action?index=<s:property value="index+1"/>">下一页</a>
									</s:if></td>
								<td style="width: 400px; font-size: 14px; color: #404040">跳转到第<s:textfield id="aimpage" name="index" cssStyle="width:20px;height:20px;"
										onmouseover="this.select();" />页 <s:submit value="跳转" cssClass="tiaozhuan" />
								</td>
							</table>
						</s:form>
					</div>
				</s:if>
				<s:else>
					<span style="font-size: 25; color: red;">暂没有相关的考勤信息</span>
				</s:else>
				<s:fielderror cssClass="fielderr" />
			</div>

		</div>
	</div>
</body>
</html>