<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
	<head>
		<title>top.jsp</title>
		<link href="images/topstyle.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="images/top.js"></script>
		<script type="text/javascript">
			window.onload=realtime;
		</script>
	</head>
	<body>
		<div id="container">
			<div id="mainHead">
				<h1><i><s:text name="top.title"/></i></h1>
			</div>
			<div id="simpleinfo">
				<p><span><s:text name="top.info"/></span><span id="time"></span><a href="LoginAction_logout.action">退出登录</a></p>
			</div>
		</div>
	</body>
</html>