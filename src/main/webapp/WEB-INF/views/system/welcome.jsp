<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>欢迎页面</title>
</head>
<body>
<div title="欢迎使用小区物业管理系统" align="center" style="padding:20px;overflow:hidden; color:red; " >
	<p style="font-size: 50px; line-height: 60px; height: 60px;">${sessionScope.userName}:欢迎您</p>
	<p style="font-size: 25px; line-height: 30px; height: 30px;">欢迎使用小区物业管理系统</p>
	<img alt="小区物业管理系统" src="../resources/images/xiaoqu_welcome.jpg">
  	<p>开发周期：2021/08/15 --- 2021/08/22（共计7天）</p>
  	<hr/>
  	<h2>系统环境</h2>
  	<p>系统环境：windows10</p>
	<p>开发工具：Intellij IDEA</p>
	<p>Java版本：JDK 1.8</p>
	<p>服务器：tomcat 7.0</p>
	<p>数据库：MySQL 8.0.12</p>
	<p>系统采用技术： spring+springMVC+mybaits+EasyUI+jQuery+Ajax+面向接口编程+maven</p>
</div>
</body>
</html>