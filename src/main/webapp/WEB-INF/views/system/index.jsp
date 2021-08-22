<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="All Rights Reserved, Copyright (C) 2020, liqingyang, Ltd." />
<title>后台管理主页</title>
<link rel="stylesheet" type="text/css" href="../../../resources/admin/easyui/easyui/1.3.4/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/admin/easyui/css/wu.css" />
<link rel="stylesheet" type="text/css" href="../../../resources/admin/easyui/css/icon.css" />
<script type="text/javascript" src="../../../resources/admin/easyui/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../../../resources/admin/easyui/easyui/1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../resources/admin/easyui/easyui/1.3.4/locale/easyui-lang-zh_CN.js"></script>
<script>
    var pc;
    //不要放在$(function(){});中
    $.parser.onComplete = function () {
        if (pc) clearTimeout(pc);
        pc = setTimeout(closes, 1000);
    }

    function closes() {
    	$('#loading').fadeOut('normal', function () {
            $(this).remove();
        });
    }
</script>
</head>
<body class="easyui-layout">
	<!-- begin of header -->
	<div class="wu-header" data-options="region:'north',border:false,split:true">
    	<div class="wu-header-left">
        	<h1>小区物业管理系统</h1>
        </div>
        <div class="wu-header-right">
        	<p><strong class="easyui-tooltip" title="0条未读消息">
                <c:if test="${sessionScope.roleId == 1}">
                    超级管理员
                </c:if>
                <c:if test="${sessionScope.roleId == 2}">
                    管理员
                </c:if>
                :${sessionScope.userName}</strong>，欢迎您！</p>
            <p><a href="logout">安全退出</a></p>
        </div>
    </div>
    <!-- end of header -->
    <!-- begin of sidebar -->
	<div class="wu-sidebar" data-options="region:'west',split:true,border:true,title:'导航菜单'"> 
    	<div class="easyui-accordion" data-options="border:false,fit:true">
        	<div title="用户管理" style="padding:5px;">
    			<ul class="easyui-tree wu-side-tree">
                    <li><a href="javascript:void(0)" data-icon="${secondMenu.icon }" data-link="../user/list1?_mid=${secondMenu.id }" iframe="1">管理人员管理</a></li>
                </ul>
                <ul class="easyui-tree wu-side-tree">
                    <li><a href="javascript:void(0)" data-icon="${secondMenu.icon }" data-link="../head/list1?_mid=${secondMenu.id }" iframe="1">业主管理</a></li>
                </ul>
            </div>
            <div title="公共设施管理" style="padding:5px;">
                <ul class="easyui-tree wu-side-tree">
                    <li><a href="javascript:void(0)" data-icon="${secondMenu.icon }" data-link="../facility/index?_mid=${secondMenu.id }" iframe="1">公共设施管理</a></li>
                    <li><a href="javascript:void(0)" data-icon="${secondMenu.icon }" data-link="../commservice/list1?_mid=${secondMenu.id }" iframe="1">记录管理</a></li>
                </ul>
            </div>
            <div title="车位管理" style="padding:5px;">
                <ul class="easyui-tree wu-side-tree">
                    <li><a href="javascript:void(0)" data-icon="${secondMenu.icon }" data-link="../stall/list1?_mid=${secondMenu.id }" iframe="1">车位管理</a></li>
                </ul>
            </div>
            <div title="报修管理" style="padding:5px;">
                <ul class="easyui-tree wu-side-tree">
                    <li><a href="javascript:void(0)" data-icon="${secondMenu.icon }" data-link="../repairs/list1?_mid=${secondMenu.id }" iframe="1">报修管理</a></li>
                </ul>
            </div>
            <div title="物业费用管理" style="padding:5px;">
                <ul class="easyui-tree wu-side-tree">
                    <li><a href="javascript:void(0)" data-icon="${secondMenu.icon }" data-link="../propertyFee/list1?_mid=${secondMenu.id }" iframe="1">物业费管理</a></li>
                    <li><a href="javascript:void(0)" data-icon="${secondMenu.icon }" data-link="../payrecords/list1?_mid=${secondMenu.id }" iframe="1">缴费记录</a></li>
                </ul>
            </div>
            <div title="房屋管理" style="padding:5px;">
                <ul class="easyui-tree wu-side-tree">
                    <li><a href="javascript:void(0)" data-icon="${secondMenu.icon }" data-link="../rud/list1?_mid=${secondMenu.id }" iframe="1">房屋管理</a></li>

                </ul>
            </div>
        </div>
    </div>	
    <!-- end of sidebar -->    
    <!-- begin of main -->
    <div class="wu-main" data-options="region:'center'">
        <div id="wu-tabs" class="easyui-tabs" data-options="border:false,fit:true">
            <div title="首页" data-options="href:'welcome',closable:false,iconCls:'icon-tip',cls:'pd3'"></div>
        </div>
    </div>
    <!-- end of main --> 
    <!-- begin of footer -->
	<div class="wu-footer" data-options="region:'south',border:true,split:true">
    	&copy; 2020 【】 All Rights Reserved
    </div>
    <!-- end of footer -->  
    <script type="text/javascript">
		$(function(){
			$('.wu-side-tree a').bind("click",function(){
				var title = $(this).text();
				var url = $(this).attr('data-link');
				var iconCls = $(this).attr('data-icon');
				var iframe = $(this).attr('iframe')==1?true:false;
				addTab(title,url,iconCls,iframe);
			});
		})


		/**
		* Name 添加菜单选项
		* Param title 名称
		* Param href 链接
		* Param iconCls 图标样式
		* Param iframe 链接跳转方式（true为iframe，false为href）
		*/
		function addTab(title, href, iconCls, iframe){
			var tabPanel = $('#wu-tabs');
			if(!tabPanel.tabs('exists',title)){
				var content = '<iframe scrolling="auto" frameborder="0"  src="'+ href +'" style="width:100%;height:100%;"></iframe>';
				if(iframe){
					tabPanel.tabs('add',{
						title:title,
						content:content,
						iconCls:iconCls,
						fit:true,
						cls:'pd3',
						closable:true
					});
				}
				else{
					tabPanel.tabs('add',{
						title:title,
						href:href,
						iconCls:iconCls,
						fit:true,
						cls:'pd3',
						closable:true
					});
				}
			}
			else
			{
				tabPanel.tabs('select',title);
			}
		}
		/**
		* Name 移除菜单选项
		*/
		function removeTab(){
			var tabPanel = $('#wu-tabs');
			var tab = tabPanel.tabs('getSelected');
			if (tab){
				var index = tabPanel.tabs('getTabIndex', tab);
				tabPanel.tabs('close', index);
			}
		}
	</script>
</body>
</html>