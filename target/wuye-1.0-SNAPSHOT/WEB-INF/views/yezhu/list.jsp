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
            <label>业主姓名:</label><input id="search-yz_name" class="wu-text" style="width:100px">
            <label>性别:</label>
            <select id="search-yz_sex" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value=""></option>
            	<option value="0">未知</option>
            	<option value="1">男</option>
            	<option value="2">女</option>
            </select>
            <label>所属房屋:</label>
            <select  id="search-house_id" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="">空空</option>
            	<c:forEach items="${houseList }" var="house">
            	<option value="${house.house_id }">${house.house_no }</option>
            	</c:forEach>
            </select>
            <label>业主电话:</label><input id="search-yz_phone" class="wu-text" style="width:100px">
            <label>身份证号码:</label><input id="search-idCard" class="wu-text" style="width:100px">
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
                <td align="right">用户名称:</td>
                <td><input type="text" id="add-name" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写业主用户名称'" /></td>
            </tr>
            <tr>
                <td align="right">密码:</td>
                <td><input type="password" id="add-yz_password" name="yz_password" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写密码'" /></td>
            </tr>
             <tr>
                <td align="right">业主姓名:</td>
                <td><input type="text" id="add-yz_name" name="yz_name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写业主姓名'" /></td>
            </tr>
            <tr>
                <td align="right">性别:</td>
                <td>
               		 <select id="add-yz_sex" name="yz_sex" class="easyui-combobox" panelHeight="auto" style="width:268px">
            			<option value="0">未知</option>
            			<option value="1">男</option>
            			<option value="2">女</option>
          		 	 </select>
				</td>
            </tr>
            <tr>
                <td align="right">身份证号码:</td>
                <td><input type="text" id="add-idCard" name="idCard" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写业主身份证号码'" /></td>
            </tr>
            <tr>
                <td align="right">电话:</td>
                 <td><input type="text" id="add-yz_phone" name="yz_phone" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写业主电话号码'" /></td>
            </tr>
            <tr>
                <td align="right">email:</td>
                 <td><input type="text" id="add-yz_email" name="yz_email" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写业主email'" /></td>
            </tr>
        </table>
    </form>
</div>
<!-- 修改窗口 -->
<div id="edit-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="edit-form" method="post">
        <input type="hidden" name="yezhu_id" id="edit-yezhu_id">
        <table>
           <tr>
                <td align="right">用户名称:</td>
                <td><input type="text" id="edit-name" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写业主用户名称'" /></td>
            </tr>
     
          
             <tr>
                <td align="right">业主姓名:</td>
                <td><input type="text" id="edit-yz_name" name="yz_name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写业主姓名'" /></td>
            </tr>
            <tr>
                <td align="right">性别:</td>
                <td>
               		 <select id="edit-yz_sex" name="yz_sex" class="easyui-combobox" panelHeight="auto" style="width:268px">
            			<option value="0">未知</option>
            			<option value="1">男</option>
            			<option value="2">女</option>
          		 	 </select>
				</td>
            </tr>
            <tr>
                <td align="right">身份证号码:</td>
                <td><input type="text" id="edit-idCard" name="idCard" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写业主身份证号码'" /></td>
            </tr>
            <tr>
                <td align="right">电话:</td>
                 <td><input type="text" id="edit-yz_phone" name="yz_phone" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写业主电话号码'" /></td>
            </tr>
            <tr>
                <td align="right">email:</td>
                 <td><input type="text" id="edit-yz_email" name="yz_email" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写业主email'" /></td>
            </tr>
        </table>
    </form>
</div>
<!-- 绑定房屋窗口 -->
<div id="edit_1-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="edit_1-form" method="post">
        <input type="hidden" name="yezhu_id" id="edit_1-yezhu_id">
        <table>
             <tr>
                <td align="right">业主姓名:</td>
                <td><input type="text" id="edit_1-yz_name" readonly="readonly"  class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写业主姓名'" /></td>
            </tr>
            <tr>
            	<td align="right">房屋编号：</td>
            	<td>
            		<select  id="edit-house_id" name="house_id" class="easyui-combobox" panelHeight="auto" style="width:120px">
            			<c:forEach items="${houseList }" var="house">
            			<option value="${house.house_id }">${house.house_no }</option>
            			</c:forEach>
            		</select>
            	</td>
            </tr>
        </table>
    </form>
</div>
<!-- 解除绑定窗口 -->
<div id="edit_2-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="edit_2-form" method="post">
        <input type="hidden" name="yezhu_id" id="edit_2-yezhu_id">
        <input type="hidden" name="house_id" id="edit_2-house_id">
        <table>
        	<tr>
        		<td>确定解除绑定吗？</td>
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
	function edit_1(){
		var validate = $("#edit_1-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","请检查你输入的数据!","warning");
			return;
		}
		var data = $("#edit_1-form").serialize();
		$.ajax({
			url:'edit_1',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.type == 'success'){
					$.messager.alert('信息提示','修改成功！','info');
					$('#edit_1-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
					$('#data-datagrid').datagrid('unselectAll');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	function edit_2(){
		var validate = $("#edit_2-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","请检查你输入的数据!","warning");
			return;
		}
		var data = $("#edit_2-form").serialize();
		$.ajax({
			url:'edit_2',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.type == 'success'){
					$.messager.alert('信息提示','修改成功！','info');
					$('#edit_2-dialog').dialog('close');
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
					data:{yezhu_id:item.yezhu_id},
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
            title: "编辑业主信息",
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
            	$("#edit-yezhu_id").val(item.yezhu_id);
            	$("#edit-name").val(item.name);
            	$("#edit-yz_name").val(item.yz_name);
            	$("#edit-yz_password").val(item.yz_password);
            	$("#edit-yz_sex").combobox('setValue',item.yz_sex);
            	$("#edit-yz_email").val(item.yz_email);
            	$("#edit-yz_phone").val(item.yz_phone);
            	$("#edit-idCard").val(item.idCard);
            }
        });
	}
	function openEdit_1(){
		//$('#add-form').form('clear');
		var item = $('#data-datagrid').datagrid('getSelected');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择要编辑的数据！','info');
			return;
		}
		$('#edit_1-dialog').dialog({
			closed: false,
			modal:true,
            title: "绑定房屋信息",
            buttons: [{
                text: '确定绑定',
                iconCls: 'icon-ok',
                handler: edit_1
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#edit_1-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	//$("#add-form input").val('');
            	$("#edit_1-yezhu_id").val(item.yezhu_id);
            	$("#edit_1-yz_name").val(item.yz_name);
            }
        });
	}
	
	function openEdit_2(){
		//$('#add-form').form('clear');
		var item = $('#data-datagrid').datagrid('getSelected');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择要编辑的数据！','info');
			return;
		}
		$('#edit_2-dialog').dialog({
			closed: false,
			modal:true,
            title: "解除绑定房屋",
            buttons: [{
                text: '确定解除绑定',
                iconCls: 'icon-ok',
                handler: edit_2
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#edit_2-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	
            	$("#edit_2-yezhu_id").val(item.yezhu_id);
            	$("#edit_2-house_id").val(item.house_id);
            	
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
            title: "添加业主信息",
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
		var option = {yz_name:$("#search-yz_name").val()};
		var yz_sex = $("#search-yz_sex").combobox('getValue');
		var house_id = $("#search-house_id").combobox('getValue');
		if(yz_sex != -2){
			option.yz_sex = yz_sex;
		}
		if(house_id != -3){
			option.house_id = house_id;
		}
		option.yz_phone = $("#search-yz_phone").val();
		option.idCard = $("#search-idCard").val();
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
			{ field:'name',title:'用户名',width:100,sortable:true},
			{ field:'yz_name',title:'业主姓名',width:100,sortable:true},
			{ field:'yz_sex',title:'性别',width:100,formatter:function(value,row,index){
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
			{ field:'house_id',title:'所属房屋',width:100,formatter:function(value,row,index){
				var houseList = $("#search-house_id").combobox('getData');
				for(var i=0;i<houseList.length;i++){
					if(houseList[i].value == value)
						return houseList[i].text;
				}
					console.warn(houseList);
				}},
			{ field:'idCard',title:'身份证号',width:130,sortable:true},
			{ field:'yz_phone',title:'电话',width:100,sortable:true},
			{ field:'yz_email',title:'email',width:200,sortable:true},
		]]
	});
</script>