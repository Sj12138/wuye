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
            <label>业主名称:</label>
            <select id="search-yezhu_id" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="">全部</option>
            	<c:forEach items="${yezhuList }" var="yezhu">
            	<option value="${yezhu.yezhu_id }">${yezhu.yz_name }</option>
            	</c:forEach>
            </select>
            <label>状态:</label>
            <select id="search-status" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="">全部</option>
            	<option value="0">已处理</option>
            	<option value="1">处理中</option>
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
        <input type="hidden" name="rep_id" id="edit-rep_id">
        <table>
           <tr>
                <td align="right">业主姓名:</td>
                <td><input type="text" id="edit-yezhu_name" name="yezhu_name" readonly="readonly" class="wu-text easyui-validatebox"  />
                <input type="hidden" id="edit-yezhu_id" name="yezhu_id" readonly="readonly" class="wu-text easyui-validatebox"  /></td>
            </tr>
            <tr>
                <td align="right">报修日期:</td>
                <td><input type="text" id="edit-repairDate" readonly="readonly" name="repairDate" class="wu-text easyui-validatebox"  /></td>
            </tr>
            
            <tr>
                <td align="right">报修问题:</td>
                <td><textarea id="edit-rep_question" readonly="readonly" name="rep_question" rows="6" class="wu-textarea" style="width:260px"></textarea></td>
            </tr>
            <tr>
                <td align="right">处理结果:</td>
                <td><textarea id="edit-rep_result" name="rep_result" rows="6" class="wu-textarea" style="width:260px"></textarea></td>
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
            title: "处理报修申请",
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
            	var yz_name = $("#search-yezhu_id").combobox('getData');
            	for(var i=0;i<yz_name.length;i++){
            	if(yz_name[i].value==item.yezhu_id){
            		$("#edit-yezhu_name").val(yz_name[i].text);
            		$("#edit-yezhu_id").val(item.yezhu_id);
            	  }
            	}
            	$("#edit-rep_id").val(item.rep_id);
            	$("#edit-repairDate").val(item.repairDate);
            	$("#edit-status").combobox('setValue',item.status);
            	$("#edit-rep_question").val(item.rep_question);
            	$("#edit-rep_result").val(item.rep_result);
            	$("#edit-remark").val(item.remark);
            }
        });
	}
	//搜索按钮监听
	$("#search-btn").click(function(){
		var  option= {repairDate:$("#search-repairDate").val()};
		var status = $("#search-status").combobox('getValue');
		var yezhu_id = $("#search-yezhu_id").combobox('getValue');
		if(status != -1){
			option.status = status;
		}
		option.yezhu_id = yezhu_id;
		$('#data-datagrid').datagrid('reload',option);
		$('#data-datagrid').datagrid('unselectAll');
	});
	

	function add0(m){return m<10?'0'+m:m }
	function format(shijianchuo){
	//shijianchuo是整数，否则要parseInt转换
		var time = new Date(shijianchuo);
		var y = time.getFullYear();
		var m = time.getMonth()+1;
		var d = time.getDate();
		var h = time.getHours();
		var mm = time.getMinutes();
		var s = time.getSeconds();
		return y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
	}
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
			{ field:'yezhu_id',title:'业主姓名',width:100,formatter:function(value,row,index){
				var yezhuList = $("#search-yezhu_id").combobox('getData');
				for(var i=0;i<yezhuList.length;i++){
					if(yezhuList[i].value == value)
						return yezhuList[i].text;
				}
				}},
			{ field:'repairDate',title:'报修日期',width:100,sortable:true},
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
			{ field:'rep_question',title:'报修内容',width:130,sortable:true},
			{ field:'rep_result',title:'报修结果',width:130,sortable:true},
			{ field:'remark',title:'备注',width:200,sortable:true},
		]]
	});
</script>