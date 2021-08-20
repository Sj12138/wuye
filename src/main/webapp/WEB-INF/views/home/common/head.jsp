<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>小区物业管理系统首页</title>
<META http-equiv=Content-Language content=zh-cn>
<META name="keywords" content="小区物业管理系统首页" />
<META name="description" content="小区物业管理系统首页" />
<LINK href="../rescources/images/css.css" type=text/css rel=stylesheet>
<LINK href="../rescources/images/default.css" type=text/css rel=stylesheet>

<SCRIPT language=JavaScript src="../resources/images/Common.js"></SCRIPT>
<SCRIPT language=JavaScript src="../resources/images/index.js"></SCRIPT>
<SCRIPT language=JavaScript src="../resources/images/calendar.js"></SCRIPT>
<SCRIPT language=JavaScript src="../resources/images/inc.js"></SCRIPT>
<SCRIPT language=JavaScript src="../resources/images/default.js"></SCRIPT>
<SCRIPT language=JavaScript src="../resources/images/swfobject.js"></SCRIPT>
</head>
<body text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
<SCRIPT language=JavaScript>

</SCRIPT>
<TABLE id=toplogin cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TBODY>
  <TR>
    <TD vAlign=center align=left>
      <DIV class=jstime style="FLOAT: right; WIDTH: 45%; TEXT-ALIGN: right">
	  <!--****************时间日历开始****************-->
      <SCRIPT>setInterval("clock.innerHTML=new Date().toLocaleString()+'&nbsp;&nbsp;星期'+'日一二三四五六'.charAt(new Date().getDay());",1000)</SCRIPT>
      <SPAN id=clock></SPAN>
	  <!--****************时间日历结束****************-->&nbsp;&nbsp; 
	  <c:if test="${yezhu == null }">
	      <A >关于我们</A> 
	  </c:if>
	  <c:if test="${yezhu != null }">
		  <font color="red">欢迎您：${yezhu.name }&nbsp;&nbsp;|&nbsp;&nbsp;</font>
			<a href="../home/yezhu/yezhu_index">用户中心</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="../system/logout">注销登录</a>&nbsp;
	  </c:if>
	  </DIV>
	</TD>
   </TR>
   </TBODY>
</TABLE>
<TABLE id=header cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
	<TBODY>
		  <TR>
		    <TD>
		      <DIV class=ad id=banner style="background-image: url('../resources/home/images/shouye01.jpeg');">
		      <img src="../resources/home/images/shouye01.jpeg" style="width:100%"></img>
			  </DIV>
			</TD>
		  </TR>
	 </TBODY>
</TABLE>
<TABLE id=guide cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
<TBODY>
  <TR>
    <TD align=middle>
	<!--****************主菜单开始****************-->
	
	<A href="../home/index" target="">首    页</A> |
	
	<A href="../home/news" target="">小区资讯</A> |
	
	<A href="../home/reg" target="">免费注册</A> |
	
	<A href="../system/login" target="">管理登录</A> 
	
	<!--****************主菜单结束****************-->
	</TD>
  </TR>
</TBODY>
</TABLE>

</body>

