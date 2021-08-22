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
            <label>栋数:</label>
            <select id="search-rid" class="easyui-combobox" panelHeight="auto" style="width:120px">
                <option value="0">全部</option>
                <c:forEach items="${requestScope.rid }" var="rid">
                    <option value="${rid.rudRidgepole }">${rid.rudRidgepole }</option>
                </c:forEach>
            </select>
            <label>单元:</label>
            <select id="search-un" class="easyui-combobox" panelHeight="auto" style="width:120px">
                <option value="0">全部</option>
                <c:forEach items="${requestScope.un }" var="un">
                    <option value="${un.rudUnit }">${un.rudUnit }</option>
                </c:forEach>
            </select>
            <label>门牌号:</label>
            <select id="search-dp" class="easyui-combobox" panelHeight="auto" style="width:120px">
                <option value="0">全部</option>
                <c:forEach items="${requestScope.dp }" var="dp">
                    <option value="${dp.rudDoorplate }">${dp.rudDoorplate }</option>
                </c:forEach>
            </select>
            <a href="#" id="search-btn" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<!-- Begin of easyui-dialog -->
<div id="add-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:420px; padding:10px;">
    <form id="add-form" method="post">
        <table>
            <tr>
                <td width="60" align="right">栋:</td>
                <td><input type="text"  name="rudRidgepole" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写用户名'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">单元名称:</td>
                <td><input type="text"  name="rudUnit" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写用户名'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">门牌号:</td>
                <td><input type="text"  name="rudDoorplate" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写用户名'" /></td>
            </tr>
        </table>
    </form>
</div>
<!-- 修改窗口 -->
<div id="edit-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
    <form id="edit-form" method="post">
        <input type="hidden" name="rudId" id="editRudId">
        <table>
            <tr>
                <td width="60" align="right">栋:</td>
                <td><input type="text" id="editrudRidgepole" name="rudRidgepole" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写用户名'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">单元名称:</td>
                <td><input type="text" id="editrudUnit" name="rudUnit" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写用户名'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">门牌号:</td>
                <td><input type="text" id="editrudDoorplate" name="rudDoorplate" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写用户名'" /></td>
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
            url:'../rud/add',
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
     * Name 修改记录
     */
    function edit(){
        var validate = $("#edit-form").form("validate");
        if(!validate){
            $.messager.alert("消息提醒","请检查你输入的数据!","warning");
            return;
        }
        var data = $("#edit-form").serialize();
        $.ajax({
            url:'../rud/edit',
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
                var item = $('#data-datagrid').datagrid('getSelections');
                if(item == null || item.length == 0){
                    $.messager.alert('信息提示','请选择要删除的数据！','info');
                    return;
                }
                var ids = '';
                for(var i=0;i<item.length;i++){
                    ids += item[i].rudId + ',';
                }
                $.ajax({
                    url:'../rud/delete',
                    dataType:'json',
                    type:'post',
                    data:{ids:ids},
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
     * Name 打开添加窗口
     */
    function openAdd(){
        //$('#add-form').form('clear');
        $('#add-dialog').dialog({
            closed: false,
            modal:true,
            title: "添加用户信息",
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

    /**
     * 打开修改窗口
     */
    function openEdit(){
        //$('#edit-form').form('clear');
        var item = $('#data-datagrid').datagrid('getSelections');
        if(item == null || item.length == 0){
            $.messager.alert('信息提示','请选择要修改的数据！','info');
            return;
        }
        if(item.length > 1){
            $.messager.alert('信息提示','请选择一条数据进行修改！','info');
            return;
        }
        item = item[0];
        $('#edit-dialog').dialog({
            closed: false,
            modal:true,
            title: "修改房屋信息",
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
                $("#editRudId").val(item.rudId);
                $("#editrudRidId").val(item.rudRidId);
                $("#editrudUnId").val(item.rudUnId);
                $("#editrudDpId").val(item.rudDpId);
                $("#editrudRidgepole").val(item.rudRidgepole);
                $("#editrudUnit").val(item.rudUnit);
                $("#editrudDoorplate").val(item.rudDoorplate);
            }
        });
    }


    //搜索按钮监听
    $("#search-btn").click(function(){
        var rid = $("#search-rid").combobox('getValue');
        var un = $("#search-un").combobox('getValue');
        var dp = $("#search-dp").combobox('getValue');
        var option = {};
        if(rid != 0){
            option.rudRidgepole = rid;
        }
        if(un != 0){
            option.rudUnit = un;
        }
        if(dp != 0){
            option.rudDoorplate = dp;
        }
        $('#data-datagrid').datagrid('reload',option);
    });

    /**
     * 载入数据
     */
    $('#data-datagrid').datagrid({
        url:'../rud/list',
        rownumbers:true,
        singleSelect:false,
        pageSize:20,
        pagination:true,
        multiSort:true,
        fitColumns:true,
        idField:'rudId',
        treeField:'name',
        fit:true,
        columns:[[
            { field:'chk',checkbox:true},
            { field:'rudId',title:'id',width:100,sortable:true,hidden:"true"},
            { field:'rudRidgepole',title:'栋',width:100,sortable:true},
            { field:'rudUnit',title:'单元',width:100,sortable:true},
            { field:'rudDoorplate',title:'门牌号',width:100},
        ]],
        onLoadSuccess:function(data){
            $('.authority-edit').linkbutton({text:'编辑权限',plain:true,iconCls:'icon-edit'});
        }
    });
</script>
    
