<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header.jsp"%>
<div class="easyui-layout" data-options="fit:true">
    <!-- Begin of toolbar -->
    <div id="wu-toolbar">
        <div class="wu-toolbar-button">
            <%@include file="../common/menus.jsp"%>
        </div>
        <div class="wu-toolbar-search">
            <label>状态:</label>
            <select  id="search-status" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="">全部</option>
            	<option value="0">已完成</option>
            	<option value="1">处理中</option>
            </select>
            <a href="#" id="search-btn" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<!-- 添加弹框 -->
<div id="add-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:420px; padding:10px;">
	<form id="add-form" method="post">
        <table>
            <tr>
                <td align="right">投诉日期:</td>
                <td><input type="text" id="add-complaintDate" name="complaintDate" class="wu-text easyui-datebox easyui-validatebox" /></td>
            </tr>
			<tr>
                <td align="right">投诉内容:</td>
                <td><textarea id="add-com_question" name="com_question" rows="6" class="wu-textarea" style="width:260px"></textarea></td>
            </tr>
        </table>
    </form>
</div>
<!-- 修改窗口 -->

<%@include file="../common/footer.jsp"%>
<!-- End of easyui-dialog -->
<script type="text/javascript">
	
	/**
	*  添加记录
	*/
	function add(){
		var validate = $("#add-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","请检查你输入的数据!","warning");
			return;
		}
		var data = $("#add-form").serialize();
		$.ajax({
			url:'add',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.type == 'success'){
					$.messager.alert('信息提示','添加成功！','info');
					$('#add-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}

	
	/**
	* Name 打开添加窗口
	*/
	function openAdd(){
		//$('#add-form').form('clear');
		$('#add-dialog').dialog({
			closed: false,
			modal:true,
            title: "添加投诉信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: add
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#add-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	$("#add-form input").val('');
            	
            }
        });
	}
	
	//搜索按钮监听
	$("#search-btn").click(function(){
		var  option= {complaintDate:$("#search-complaintDate").val()};
		var status = $("#search-status").combobox('getValue');
		if(status != -1){
			option.status = status;
		}
		$('#data-datagrid').datagrid('reload',option);
		$('#data-datagrid').datagrid('unselectAll');
	});
	/** 
	* 载入数据
	*/
	$('#data-datagrid').datagrid({
		url:'list',
		rownumbers:true,
		singleSelect:false,
		pageSize:20,           
		pagination:true,
		multiSort:true,
		fitColumns:true,
		idField:'id',
	    treeField:'name',
		fit:true,
		columns:[[
			{ field:'chk',checkbox:true},
			{ field:'complaintDate',title:'投诉日期',width:100,sortable:true},
			{ field:'status',title:'状态',width:100,formatter:function(value,row,index){
				switch(value){
					case 0:{
						return '已处理';
					}
					case 1:{
						return '处理中';
					}
					case 2:{
						return '未处理';
					}
				}
				return value;
			}},
			{ field:'com_question',title:'投诉内容',width:130,sortable:true},
			{ field:'com_result',title:'投诉结果',width:130,sortable:true},
			{ field:'remark',title:'备注',width:200,sortable:true},
		]]
	});
</script>