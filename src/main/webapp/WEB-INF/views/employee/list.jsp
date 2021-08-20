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
            <label>员工姓名:</label><input id="search-name" class="wu-text" style="width:100px">
            <label>性别:</label>
            <select id="search-sex" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="">全部</option>
            	<option value="1">男</option>
            	<option value="2">女</option>
            </select>
            <label>工作类型:</label><input id="search-work_type" class="wu-text" style="width:100px">
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
                <td align="right">员工姓名:</td>
                <td><input type="text" id="add-name" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写员工姓名'" /></td>
            </tr>
            <tr>
                <td align="right">工作类型:</td>
                <td><input type="text" id="add-work_type" name="work_type" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写工作类型'" /></td>
            </tr>
            <tr>
                <td align="right">性别:</td>
                <td>
               		 <select id="add-sex" name="sex" class="easyui-combobox" panelHeight="auto" style="width:268px">
            			<option value="0">未知</option>
            			<option value="1">男</option>
            			<option value="2">女</option>
          		 	 </select>
				</td>
            </tr>
            <tr>
                <td align="right">工资:</td>
                <td><input type="text" id="add-salary" name="salary" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写员工工资'" /></td>
            </tr>
            <tr>
                <td align="right">电话:</td>
                 <td><input type="text" id="add-employee_phone" name="employee_phone" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写员工电话号码'" /></td>
            </tr>
            <tr>
                <td align="right">年龄:</td>
                 <td><input type="text" id="add-age" name="age" class="wu-text easyui-validatebox"  /></td>
            </tr>
             <tr>
                <td align="right">地址:</td>
                 <td><input type="text" id="add-address" name="address" class="wu-text easyui-validatebox" /></td>
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
        <input type="hidden" name="employee_id" id="edit-employee_id">
        <table>
           <tr>
                <td align="right">员工姓名:</td>
                <td><input type="text" id="edit-name" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写员工姓名'" /></td>
            </tr>
            <tr>
                <td align="right">工作类型:</td>
                <td><input type="text" id="edit-work_type" name="work_type" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写工作类型'" /></td>
            </tr>
            <tr>
                <td align="right">性别:</td>
                <td>
               		 <select id="edit-sex" name="sex" class="easyui-combobox" panelHeight="auto" style="width:268px">
            			<option value="0">未知</option>
            			<option value="1">男</option>
            			<option value="2">女</option>
          		 	 </select>
				</td>
            </tr>
            <tr>
                <td align="right">工资:</td>
                <td><input type="text" id="edit-salary" name="salary" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写员工工资'" /></td>
            </tr>
            <tr>
                <td align="right">电话:</td>
                 <td><input type="text" id="edit-employee_phone" name="employee_phone" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写员工电话号码'" /></td>
            </tr>
            <tr>
                <td align="right">年龄:</td>
                 <td><input type="text" id="edit-age" name="age" class="wu-text easyui-validatebox"  /></td>
            </tr>
             <tr>
                <td align="right">地址:</td>
                 <td><input type="text" id="edit-address" name="address" class="wu-text easyui-validatebox" /></td>
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
					data:{employee_id:item.employee_id},
					success:function(data){
						if(data.type == 'success'){
							$.messager.alert('信息提示','删除成功！','info');
							$('#data-datagrid').datagrid('reload');
							$('#data-datagrid').datagrid('unselectAll');
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
            title: "编辑员工信息",
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
            	$("#edit-employee_id").val(item.employee_id);
            	$("#edit-name").val(item.name);
            	$("#edit-age").val(item.age);
            	$("#edit-address").val(item.address);
            	$("#edit-work_type").val(item.work_type);
            	$("#edit-salary").val(item.salary);
            	$("#edit-sex").combobox('setValue',item.sex);
            	$("#edit-yz_email").val(item.yz_email);
            	$("#edit-employee_phone").val(item.employee_phone);
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
            title: "添加员工信息",
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
		var option = {name:$("#search-name").val()};
		var sex = $("#search-sex").combobox('getValue');
		var work_type = {work_type:$("#search-work_type").val()};
		if(sex != -2){
			option.sex = sex;
		}
		option.work_type = $("#search-work_type").val();
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
			{ field:'name',title:'员工姓名',width:100,sortable:true},
			{ field:'age',title:'年龄(岁)',width:100,sortable:true},
			{ field:'sex',title:'性别',width:100,formatter:function(value,row,index){
				switch(value){
					case 0:{
						return '未知';
					}
					case 1:{
						return '男';
					}
					case 2:{
						return '女';
					}
				}
				return value;
			}},
			{ field:'work_type',title:'职位',width:130,sortable:true},
			{ field:'salary',title:'工资(元/月)',width:130,sortable:true},
			{ field:'employee_phone',title:'电话',width:100,sortable:true},
			{ field:'address',title:'家庭住址',width:130,sortable:true},
			{ field:'remark',title:'备注',width:200,sortable:true},
		]]
	});
</script>