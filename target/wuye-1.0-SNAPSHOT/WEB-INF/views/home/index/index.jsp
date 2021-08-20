<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
  <meta charset="UTF-8">
  <meta name="Author" content="">
  <meta name="Keywords" content="小区物业管理管理系统">
  <meta name="Description" content="小区物业管理管理系统">
  <link href="../../../../resources/images/default.css" type=text/css rel=stylesheet>

  <link href="../../../../resources/images/css.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="../../../../resources/images/inc.js"></SCRIPT>
<SCRIPT language=JavaScript src="../../../../resources/images/default.js"></SCRIPT>
<SCRIPT language=JavaScript src="../../../../resources/images/swfobject.js"></SCRIPT>
<script src="../../../../resources/home/js/jquery-1.11.3.js"></script>
<title>小区物业管理系统首页</title>
</head>
<body>
<!--头部-->
<%@include file="../common/head.jsp"%>

<TABLE class=MainTable cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TBODY>
  <TR>
    <TD vAlign=top width="35%" height="200" >
<!--*******************************幻灯开始*******************************-->
<TABLE  class=dragTable cellSpacing=0 cellPadding=0 width="100%" height="240" align=center border=0>
 <tbody>
        <tr>
            <td class=head>
            	<SPAN class=TAG>图片资讯</SPAN>
            </td>
		</tr>
        <tr>
			<td align="center">
				<ul id="trigger">
				  <li><img src="../../../../resources/images/news1.jpg" alt="" style="width:330px;height:200px;margin:5px"></li>
				</ul>
			</td>
		</tr>
	</tbody>
</TABLE>
<!--*******************************幻灯结束*******************************-->
	</TD>
     <TD class=Side vAlign=top align=left width="40%" height=200>
<!--*******************************新闻资讯开始*******************************-->
 <TABLE  class=dragTable cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
 <TBODY>
        <TR>
          <TD class=head id=tb1_bt1 onmouseover=tb_xs(1,2,1) width="100%" height="30">
            <SPAN class=TAG>小区资讯</SPAN>
		  </TD>
		</TR>
        <TR>
		<TD class=middle  align="left" colspan="2">
<!--*******************************小区资讯**********************************-->
               <TABLE class=xsnr id=tb1_nr1  cellSpacing=0 cellPadding=0 width="100%" height="203" border=0>
                    <TBODY>
                    <c:forEach items="${newsList }" var="news">
					<TR>
                     	 <TD align="left" >
					  		<A href="../home/newsinfo?news_id=${news.news_id  }" target=_blank>${news.news_title}</A> <BR>
						  </TD>
						  <TD align="right">
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
<!--*******************************小区资讯结束*******************************-->
	</TD>
     <TD class=Side vAlign=top align=right width="25%">
<!--*******************************滚动公告开始*******************************-->
      <TABLE width="100%" height="240" border=0 cellPadding=0 cellSpacing=0 class=dragTable>
	  <TBODY>
        <TR>
          <TD class=head>
            <SPAN class=TAG>
            <P>物业公告</P>
            </SPAN>
		  </TD>
		</TR>
        <TR>
          <TD class=middle align=left>
          <MARQUEE onmouseover=if(document.all!=null){this.stop()} onmouseout=if(document.all!=null){this.start()} scrollAmount=1 scrollDelay=1 direction=up height=180>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
				  <c:forEach items="${noticeList }" var="notice">
					<tr>
                     	 <td align="left">
					  		${notice.notice_content} <BR>
						  </td>
					</tr>
					<tr>
						  <TD align="right">
							  ${notice.noticeDate }<BR>
					 	 </TD>
					</tr>
					</c:forEach>
			  </TBODY>
			 </TABLE>
			 </MARQUEE>
		  </TD>
		</TR>
	</TBODY>
<!--*******************************滚动公告结束*******************************-->
	</TABLE>
</TD>
   </TR>
  </TBODY>
</TABLE>


<!--*******************************信息栏目下通栏广告开始AF01*******************************-->
<TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TBODY>
  <TR>
    <TD>
      <img src="../../../../resources/images/ad2.jpg" width="100%" height="300" border="0" align=center>
	</TD>
   </TR>
  </TBODY>
</TABLE>
<script type="text/javascript">
/*功能点2：轮播*/
var pic = {
  intr: function () {
    var i = 1;
    var str1 = $("#trigger img").attr("src");
    var str = str1.toString();
    var timer = setInterval(function () {
      i++;
      if (i > 4) {
        i = 1;
      }
      str = str.replace(/[1-4]/, i);
      $("#trigger img").attr("src", str);
    }, 2000);
  }
}
pic.intr();
</script>
<SCRIPT type=text/javascript>
	document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
	document.write('<param name="allowScriptAccess" value="sameDomain" /><param name="movie" value="../rescources/images/rollpic.swf" /><param name="quality" value="high" /><param name="bgcolor" value="#F0F0F0">');
	document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
	document.write('</object>');
</SCRIPT>
</body>
<%@include file="../common/foot.jsp"%>