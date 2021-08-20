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
            <label>房间类型名称:</label><input id="search-name" class="wu-text" style="width:100px">
            <label>状态:</label>
            <select id="search-status" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">全部</option>
            	<option value="0">房型已满</option>
            	<option value="1">可购买</option>
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
                <td align="right">名称:</td>
                <td><input type="text" id="add-name" name="type_name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写房间类型名称'" /></td>
            </tr>
            <tr>
                <td align="right">价格:</td>
                <td><input type="text" id="add-price" name="type_price" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写房间类型价格'" /></td>
            </tr>
            <tr>
                <td align="right">房屋数:</td>
                <td><input type="text" id="add-roomNum" name="roomNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写房间类型房屋数'" /></td>
            </tr>
            <tr>
                <td align="right">状态:</td>
                <td>
               		 <select id="add-status" name="status" class="easyui-combobox" panelHeight="auto" style="width:268px">
            			<option value="0">房型已满</option>
            			<option value="1">未出售</option>
          		 	 </select>
				</td>
            </tr>
            <tr>
                <td align="right">备注:</td>
                <td><textarea id="add-remark" name="remark" rows="6" class="wu-textarea" style="width:260px"></textarea></td>
            </tr>
        </table>
    </form>
</div>
<!-- 修改窗口 -->
<div id="edit-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="edit-form" method="post">
        <input type="hidden" name="type_id" id="edit-id">
        <table>
           <tr>
                <td align="right">名称:</td>
                <td><input type="text" id="edit-name" name="type_name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写房间类型名称'" /></td>
            </tr>
             <tr>
                <td align="right">价格:</td>
                <td><input type="text" id="edit-price" name="type_price" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写房间类型价格'" /></td>
            </tr>
            <tr>
                <td align="right">房屋数:</td>
                <td><input type="text" id="edit-roomNum" name="roomNum" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写房间类型房屋数'" /></td>
            </tr>
            <tr>
                <td align="right">房间类型状态:</td>
                <td>
               		 <select id="edit-status" name="status" class="easyui-combobox" panelHeight="auto" style="width:268px">
            			<option value="0">房型已满</option>
            			<option value="1">未出售</option>
          		 	 </select>
				</td>
            </tr>
            <tr>
                <td align="right">房间类型备注:</td>
                <td><textarea id="edit-remark" name="remark" rows="6" class="wu-textarea" style="width:260px"></textarea></td>
            </tr>
        </table>
    </form>
</div>
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
					$("#add-name").val('');
					$("#add-remark").val('');
					$('#add-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	/**
	* 编辑记录
	*/
	function edit(){
		var validate = $("#edit-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","请检查你输入的数据!","warning");
			return;
		}
		var data = $("#edit-form").serialize();
		$.ajax({
			url:'edit',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.type == 'success'){
					$.messager.alert('信息提示','修改成功！','info');
					$('#edit-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	
	/**
	* 删除记录
	*/
	function remove(){
		$.messager.confirm('信息提示','确定要删除该记录？', function(result){
			if(result){
				var item = $('#data-datagrid').datagrid('getSelected');
				if(item == null || item.length == 0){
					$.messager.alert('信息提示','请选择要删除的数据！','info');
					return;
				}
				$.ajax({
					url:'delete',
					dataType:'json',
					type:'post',
					data:{type_id:item.type_id},
					success:function(data){
						if(data.type == 'success'){
							$.messager.alert('信息提示','删除成功！','info');
							$('#data-datagrid').datagrid('reload');
						}else{
							$.messager.alert('信息提示',data.msg,'warning');
						}
					}
				});
			}	
		});
	}
	
	/**
	* Name 打开编辑窗口
	*/
	function openEdit(){
		//$('#add-form').form('clear');
		var item = $('#data-datagrid').datagrid('getSelected');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择要编辑的数据！','info');
			return;
		}
		$('#edit-dialog').dialog({
			closed: false,
			modal:true,
            title: "编辑房间类型信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: edit
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#edit-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	//$("#add-form input").val('');
            	$("#edit-id").val(item.type_id);
            	$("#edit-name").val(item.type_name);
            	$("#edit-price").val(item.type_price);
            	$("#edit-roomNum").val(item.roomNum);
            	$("#edit-status").combobox('setValue',item.status);
            	$("#edit-remark").val(item.remark);
            	
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
            title: "添加房间类型信息",
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
            	//$("#add-form input").val('');
            	
            }
        });
	}
	
	//搜索按钮监听
	$("#search-btn").click(function(){
		var option = {type_name:$("#search-name").val()};
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
		singleSelect:true,
		pageSize:20,           
		pagination:true,
		multiSort:true,
		fitColumns:true,
		idField:'id',
	    treeField:'name',
		fit:true,
		columns:[[
			{ field:'chk',checkbox:true},
			{ field:'type_name',title:'名称',width:100,sortable:true},
			{ field:'type_price',title:'价格(万元)',width:100,sortable:true},
			{ field:'roomNum',title:'房间数(个)',width:100,sortable:true},
			{ field:'livedNum',title:'已入住(个)',width:100,sortable:true},
			{ field:'avilableNum',title:'可购房间数(个)',width:100,sortable:true},
			{ field:'remark',title:'房间类型备注',width:200},
		]]
	});
</script>