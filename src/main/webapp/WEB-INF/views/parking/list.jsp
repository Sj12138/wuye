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
            <label>车位名称:</label><input id="search-car_no" class="wu-text" style="width:100px">
            <label>状态:</label>
            <select id="search-status" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="">全部</option>
            	<option value="0">已售</option>
            	<option value="1">未售</option>
            </select>
            <label>业主姓名:</label>
            <select  id="search-yezhu_id" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="">全部</option>
            	<c:forEach items="${yezhuList }" var="yezhu">
            	<option value="${yezhu.yezhu_id }">${yezhu.yz_name }</option>
            	</c:forEach>
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
                <td align="right">车位名称:</td>
                <td><input type="text" id="add-park_no" name="park_no" class="wu-text easyui-validatebox"  /></td>
            </tr>
            <tr>
                <td align="right">状态:</td>
                <td>
               		 <select id="add-status" name="status" class="easyui-combobox" panelHeight="auto" style="width:268px">
            			<option value="0">已售</option>
            			<option value="1">未售</option>
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
        <input type="hidden" name="park_id" id="edit-park_id">
        <table>
            <tr>
                <td align="right">车位名称:</td>
                <td><input type="text" id="edit-park_no" name="park_no" class="wu-text easyui-validatebox"  /></td>
            </tr>
            <tr>
                <td align="right">车牌号:</td>
                <td><input type="text" id="edit-car_no" name="car_no" class="wu-text easyui-validatebox"  /></td>
            </tr>
            <tr>
            <td align="right">停车场姓名:</td>
            <td> 
             <select  id="edit-yezhu_id" name="yezhu_id" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="">空空</option>
            	<c:forEach items="${yezhuList }" var="yezhu">
            	<option value="${yezhu.yezhu_id }">${yezhu.yz_name }</option>
            	</c:forEach>
            </select>
            </td>
            </tr>
                 <tr>
                <td align="right">状态:</td>
                <td>
               		 <select id="edit-status" name="status" class="easyui-combobox" panelHeight="auto" style="width:268px">
            			<option value="0">已售</option>
            			<option value="1">未售</option>
          		 	 </select>
				</td>
            </tr>
            <tr>
                <td align="right">备注:</td>
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
					$("#add-yz_name").val('');
					$("#add-yz_phone").val('');
					$("#add-yz_email").val('');
					$("#add-idCard").val('');
					$("#add-yz_password").val('');
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
					$('#data-datagrid').datagrid('unselectAll');
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
					data:{park_id:item.park_id},
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
            title: "编辑停车场信息",
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
            	$("#edit-park_id").val(item.park_id);
            	$("#edit-yezhu_id").val(item.yezhu_id);
            	$("#edit-car_no").val(item.car_no);
            	$("#edit-park_no").val(item.park_no);
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
            title: "添加停车场信息",
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
		var option = {car_no:$("#search-car_no").val()};
		var status = $("#search-status").combobox('getValue');
		var yezhu_id = $("#search-yezhu_id").combobox('getValue');
		if(status != -2){
			option.status = status;
		}
		if(yezhu_id != -3){
			option.yezhu_id = yezhu_id;
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
			{ field:'park_no',title:'车位名称',width:100,sortable:true},
			{ field:'car_no',title:'车牌号',width:100,sortable:true},
			{ field:'yezhu_id',title:'所属业主',width:100,formatter:function(value,row,index){
				var yezhuList = $("#search-yezhu_id").combobox('getData');
				for(var i=0;i<yezhuList.length;i++){
					if(yezhuList[i].value == value)
						return yezhuList[i].text;
				}
				}},
				{ field:'status',title:'状态',width:100,formatter:function(value,row,index){
					switch(value){
						case 0:{
							return '已售';
						}
						case 1:{
							return '未售';
						}
					}
					return value;
				}},
			{ field:'remark',title:'备注',width:200,sortable:true},
		]]
	});
</script>