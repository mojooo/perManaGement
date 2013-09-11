<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title><s:text name="mainmanage.title" /></title>
<link href="images/style.css" rel="stylesheet" type="text/css" />
<link href="images/mainstyle.css" rel="stylesheet" type="text/css" />
<link href="images/departListstyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="images/manage.js"></script>
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
			<s:form theme="simple" action="userAction_updatePwd.action" onsubmit="return changepwd();">
				<table cellSpacing=0 cellPadding=0 width=620 align=center border=0 style="margin-top: 35px;">
					<tr bgColor="#edf2fc" height=24>
						<td colspan="3">&nbsp;<font color="#2d5bbb" size=""><b>修改密码</b></td>
					</tr>
					<tr>
						<td style="width: 200px; color: #404040; font-size: 14px;" bgcolor="white" align="right"><FONT color=#d11b00>*</FONT>&nbsp;您的旧密码:</td>
						<td align="left" style="width: 205px"><s:password name="user.pwd" id="oldpwd" cssStyle="width:200px;border-color:#edf2fc" /></td>
						<td align="left"><font color="red" size="2" style="display: none" id="oldpass">*旧密码不能为空</td>
					</tr>
					<tr>
						<td style="width: 200px; color: #404040; font-size: 14px;" bgcolor="white" align="right"><FONT color=#d11b00>*</FONT>&nbsp;您的新密码:</td>
						<td align="left" style="width: 205px"><s:password name="newpwd" id="newpwd" cssStyle="width:200px;border-color:#edf2fc" /></td>
						<td align="left"><font color="red" size="2" style="display: none" id="newpass">*新密码不能为空</font></td>
					</tr>
					<tr>
						<td style="width: 200px; color: #404040; font-size: 14px;" bgcolor="white" align="right"><FONT color=#d11b00>*</FONT>&nbsp;再次输入新密码:</td>
						<td align="left" style="width: 205px"><s:password name="renewpwd" id="renewpwd" cssStyle="width:200px;border-color:#edf2fc" /></td>
						<td align="left"><font color="red" size="2" style="display: none" id="repass">*请再次输入新密码</td>
					</tr>
					<tr bgColor="#edf2fc" height=30>
						<td colspan="3" align="center"><s:submit value="确  认" cssStyle="width:80px;height:23px;CURSOR:hand;" /> &nbsp;&nbsp <s:reset value="重  置"
								cssStyle="width:80px;height:23px;CURSOR:hand;" /> &nbsp;&nbsp&nbsp;&nbsp</td>
					</tr>
				</table>
			</s:form>
			<script type="text/javascript">
				var result = "<s:property value="result"/>";
				if (result != "") {
					alert(result);
				}
			</script>
		</div>

	</div>

</body>
</html>