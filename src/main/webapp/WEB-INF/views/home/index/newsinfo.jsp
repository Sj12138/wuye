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
<title>小区物业管理系统首页</title>
</head>
<body >
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
               <TABLE class=xsnr   cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
       				 <TR>
          				<TD  align=center>
		  					<h3>${news.news_title }</h3>
		  				 </TD>
					</TR>
					<TR>
       				   <TD  align=center>
							  发布人：admin 发布时间：${news.newsDate } 点击率：8000
					   </TD>
					</TR>
				
					<TR>
       				   	<TD  align=center>
							 <br/> ${news.news_content }
		 			 	 </TD>
					</TR>
					</TBODY>
				</TABLE>			
			</TD>
		</TR>
        </TBODY>
	  </TABLE>
</BODY>
<%@include file="../common/foot.jsp"%>