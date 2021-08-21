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
            <label>公共设施名称:</label><input id="search-fac_name" class="wu-text" style="width:100px">
            <label>状态:</label>
            <select id="search-status" class="easyui-combobox" panelHeight="auto" style="width:120px">
                <option value="-1">全部</option>
                <option value="1">未投入</option>
                <option value="2">已投入</option>
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
                <td align="right">公共设施名称:</td>
                <td><input id="add-fac_name" name="comName" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写公共设施名称'"/></td>
            </tr>
            <tr>
                <td align="right">价格:</td>
                <td><input id="add-fac_count" name="comMoney" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写公共设施数量'"/></td>
            </tr>
            <tr>
                <td align="right">备注:</td>
                <td><input id="add-remark" name="comRemark" class="wu-text easyui-validatebox " /></td>
            </tr>
            <tr>
                <td align="right">状态:</td>
                <td>
                    <select id="add-state" name="comState" class="easyui-combobox" panelHeight="auto" style="width:268px">
                        <option value="1">未投入</option>
                        <option value="2">已投入</option>
                    </select>
                </td>
            </tr>
        </table>
    </form>
</div>
<!-- 修改窗口 -->
<div id="edit-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
    <form id="edit-form" method="post">
        <input type="hidden" name="comId" id="edit-fac_id">
        <table>
            <tr>
                <td align="right">公共设施名称:</td>
                <td><input id="edit-fac_name" name="comName" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写公共设施名称'"/></td>
            </tr>
            <tr>
                <td align="right">价格:</td>
                <td><input id="edit-fac_sal" name="comMoney" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写公共设施数量'"/></td>
            </tr>
            <tr>
                <td align="right">备注:</td>
                <td><input id="edit-remark" name="comRemark" class="wu-text easyui-validatebox"/></td>
            </tr>
            <tr>
                <td align="right">状态:</td>
                <td>
                    <select id="edit-state" name="comState" class="easyui-combobox" panelHeight="auto" style="width:268px">
                        <option value="1">未投入</option>
                        <option value="2">已投入</option>
                    </select>
                </td>
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
            url:'../facility/add',
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
     *  编辑记录
     */
    function edit(){
        var validate = $("#edit-form").form("validate");
        if(!validate){
            $.messager.alert("消息提醒","请检查你输入的数据!","warning");
            return;
        }
        var data = $("#edit-form").serialize();
        $.ajax({
            url:'../facility/update',
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
                var item = $('#data-datagrid').datagrid('getSelections');
                if(item == null || item.length == 0){
                    $.messager.alert('信息提示','请选择要删除的数据！','info');
                    return;
                }
                var ids = '';
                for(var i=0;i<item.length;i++){
                    ids += item[i].comId + ',';
                }
                $.ajax({
                    url:'../facility/delete',
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
     * Name 打开编辑窗口
     */
    function openEdit(){
        $('#add-form').form('clear');
        var item = $('#data-datagrid').datagrid('getSelected');
        if(item == null || item.length == 0){
            $.messager.alert('信息提示','请选择要编辑的数据！','info');
            return;
        }
        $('#edit-dialog').dialog({
            closed: false,
            modal:true,
            title: "编辑公共设施信息",
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
                $("#add-form input").val('');
                $("#edit-fac_id").val(item.comId);
                $("#edit-fac_name").val(item.comName);
                $("#edit-fac_sal").val(item.comMoney);
                $("#edit-remark").val(item.comRemark);
                $("#edit-state").combobox('setValue',item.comState);
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
            title: "添加公共设施信息",
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
        var option = {comName:$("#search-fac_name").val()};
        var status = $("#search-status").combobox('getValue');
        if(status != -1){
            option.comState = status;
        }
        $('#data-datagrid').datagrid('reload',option);
    });



    /**
     * 载入数据
     */
    $('#data-datagrid').datagrid({
        url:'../facility/list',
        rownumbers:true,
        singleSelect:false,
        pageSize:20,
        pagination:true,
        multiSort:true,
        fitColumns:true,
        idField:'comId',
        treeField:'name',
        fit:true,
        columns:[[
            { field:'chk',checkbox:true},
            { field:'comId',title:'comId',width:100,sortable:true,hidden:"true"},
            { field:'comName',title:'名称',width:100,sortable:true},
            { field:'comMoney',title:'价格',width:100,sortable:true},
            { field:'comRemark',title:'备注',width:100,sortable:true},
            { field:'comState',title:'状态',width:100,formatter:function(value,row,index){
                    switch(value){
                        case 1:{
                            return '未投入';
                        }
                        case 2:{
                            return '已投入';
                        }
                    }
                    return value;
                }},
        ]],
        onLoadSuccess:function(data){
            $('.authority-edit').linkbutton({text:'编辑权限',plain:true,iconCls:'icon-edit'});
        }
    });
</script>