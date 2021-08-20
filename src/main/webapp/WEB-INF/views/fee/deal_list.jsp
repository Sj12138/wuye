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
            <label>收费类型:</label>
            <select id="search-feetype_id" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="">全部</option>
            	<c:forEach items="${feetypeList }" var="feetype">
            	<option value="${feetype.feetype_id }">${feetype.feetype_name }</option>
            	</c:forEach>
            </select>
            <label>状态:</label>
            <select  id="search-status" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="">全部</option>
            	<option value="0">已处理</option>
            	<option value="1">缴费中</option>
            	<option value="2">已缴费</option>
            </select>
            <a href="#" id="search-btn" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<!-- 修改窗口 -->
<div id="edit-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="edit-form" method="post">
        <input type="hidden" name="fee_id" id="edit-fee_id">
        <table>
       		 <tr>
                <td width="60" align="right">图片预览:</td>
                <td valign="middle">
                	<img id="edit-preview-photo" style="float:left;" src="/xq/resources/admin/easyui/images/user_photo.jpg" width="100px">
                	<a style="float:left;margin-top:40px;" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-upload" onclick="uploadPhoto()" plain="true">上传图片</a>
                </td>
            </tr>
           <tr>
                <td align="right">上传支付凭证:</td>
                <td><input type="text" id="edit-fee_photo" name="fee_photo" value="/xq/resources/admin/easyui/images/user_photo.jpg" readonly="readonly" class="wu-text"  /></td>
            </tr>
           
        </table>
    </form>
</div>
<div id="process-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-upload',title:'正在上传图片'" style="width:450px; padding:10px;">
<div id="p" class="easyui-progressbar" style="width:400px;" data-options="text:'正在上传中...'"></div>
</div>
<input type="file" id="photo-file" style="display:none;" onchange="upload()">
<%@include file="../common/footer.jsp"%>
<!-- End of easyui-dialog -->
<script type="text/javascript">
//上传图片
function start(){
		var value = $('#p').progressbar('getValue');
		if (value < 100){
			value += Math.floor(Math.random() * 10);
			$('#p').progressbar('setValue', value);
		}else{
			$('#p').progressbar('setValue',0)
		}
};
function upload(){
	if($("#photo-file").val() == '')return;
	var formData = new FormData();
	formData.append('photo',document.getElementById('photo-file').files[0]);
	$("#process-dialog").dialog('open');
	var interval = setInterval(start,200);
	$.ajax({
		url:'../user/upload_photo',
		type:'post',
		data:formData,
		contentType:false,
		processData:false,
		success:function(data){
			clearInterval(interval);
			$("#process-dialog").dialog('close');
			if(data.type == 'success'){
				$("#add-preview-photo").attr('src',data.filepath);
				$("#add-photo").val(data.filepath);
				$("#edit-preview-photo").attr('src',data.filepath);
				$("#edit-fee_photo").val(data.filepath);
			}else{
				$.messager.alert("消息提醒",data.msg,"warning");
			}
		},
		error:function(data){
			clearInterval(interval);
			$("#process-dialog").dialog('close');
			$.messager.alert("消息提醒","上传失败!","warning");
		}
	});
}

function uploadPhoto(){
	$("#photo-file").click();
	
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
					$.messager.alert('信息提示','提交成功！','info');
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
	* Name 打开编辑窗口
	*/
	function openEdit(){
		//$('#add-form').form('clear');
		var item = $('#data-datagrid').datagrid('getSelected');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择账单数据！','info');
			return;
		}
		if(item.status==0){
			$.messager.alert('信息提示','该账单已经处理完成，请选择未处理账单！','info');
			return;
		}
		$('#edit-dialog').dialog({
			closed: false,
			modal:true,
            title: "处理账单",
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
            	$("#edit-fee_id").val(item.fee_id);
            }
        });
	}
	//搜索按钮监听
	$("#search-btn").click(function(){
		var option= {feetype_id:$("#search-feetype_id").combobox('getValue')};
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
		url:'deal_list',
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
			{ field:'start_date',title:'开始日期',width:100,sortable:true},
			{ field:'final_date',title:'结束日期',width:100,sortable:true},
			{ field:'feetype_id',title:'收费类型',width:100,formatter:function(value,row,index){
				var feetypeList = $("#search-feetype_id").combobox('getData');
				for(var i=0;i<feetypeList.length;i++){
					if(feetypeList[i].value == value)
						return feetypeList[i].text;
				}
				}},
			{ field:'fee_money',title:'缴费金额',width:130,sortable:true},
			{ field:'fee_photo',title:'支付凭证',width:130,align:'center',formatter:function(value,row,index){
				var img = '<img src="'+value+'" width="50px" style="margintop:5px" />';
				return img;
				}
			},
			{ field:'status',title:'状态',width:100,formatter:function(value,row,index){
				switch(value){
					case 0:{
						return '已处理';
					}
					case 1:{
						return '缴费中';
					}
					case 2:{
						return '已缴费';
					}
				}
				return value;
			}},
			{ field:'remark',title:'备注',width:200,sortable:true},
		]]
	});
</script>