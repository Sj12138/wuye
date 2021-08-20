<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
  <meta charset="UTF-8">
  <meta name="Author" content="">
  <meta name="Keywords" content="小区物业管理管理系统">
  <meta name="Description" content="小区物业管理管理系统">
  <link href="../resources/home/css/reservation.css" type="text/css" rel="Stylesheet"/>
  <link href="../resources/home/css/index.css" type="text/css" rel="Stylesheet"/>
  <LINK href="../resources/images/default.css" type=text/css rel=stylesheet>
  <LINK href="../resources/images/css.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="../resources/images/inc.js"></SCRIPT>
<SCRIPT language=JavaScript src="../resources/images/default.js"></SCRIPT>
<SCRIPT language=JavaScript src="../resources/images/swfobject.js"></SCRIPT>
<title>小区物业管理系统首页</title>
</head>
<body>
<%@include file="../common/head.jsp"%>
     <TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
        <TR>
          <TD class=head colspan="2">
			<SPAN class=TAG>小区资讯</SPAN> 
		  </TD>
		</TR>	  	
		<TR>
		<TD  class=middle align="left" >
            <TABLE class=xsnr id=tb1_nr1  cellSpacing=0 cellPadding=0 width="100%" border=0>
	             <TBODY>
	                  <c:forEach items="${newsList }" var="news">
					  	<TR>
                     	 	<TD align="left">
					  			<A href="../home/newsinfo?news_id=${news.news_id  }" target=_blank>${news.news_title}</A> <BR>
						 	 </TD>
						 	 <TD align="center">
								  ${news.newsDate }<BR>
					 		 </TD>
						</TR>
					</c:forEach> 
				</TBODY>
			</TABLE>			
			</TD>
		</TR>
        </TBODY>
	  </TABLE>
</body>
<%@include file="../common/foot.jsp"%>