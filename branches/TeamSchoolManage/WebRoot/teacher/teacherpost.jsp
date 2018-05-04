<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>职务管理</title>
 				
		<!--
	    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
		<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
		<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
		-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.4.4/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.4.4/themes/icon.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.4.4/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
		
<script type="text/javascript">
			var url;
			function searchDepartment(){
				$('#dg').datagrid('load',{
					s_post_name:$('#s_post_name').val()
				});				
			}
			function deleteDepartment(){
				var selectedRows=$("#dg").datagrid('getSelections');
				if(selectedRows.length==0){
					$.messager.alert("系统提示","请选择要删除的数据！");
					return;
				}
				var strIds=[];
				for(var i=0;i<selectedRows.length;i++){
					strIds.push(selectedRows[i].post_id);
				}
				var ids=strIds.join(",");
				$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
					if(r){
						$.post("../dep?method=deleteDep",{delIds:ids},function(result){
							if(result.success){
								$.messager.alert("系统提示","您已成功删除<font color=red>"+result.message+"</font>条数据!");
								$("#dg").datagrid("reload");
							}else{
								$.messager.alert("系统提示",'<font color=red>'+selectedRows[result.errorIndex].post_name+'</font>'+result.errorMsg);
							}
						},"json");
					}
				});
			}
			//打开添加
			function openDepartmentAddDialog(){
				$('#dlg').dialog('open').dialog("setTitle","职务信息");
				url=("/TeamSchoolManage/AddPost.action");
			}
			
			//修改
			function openDepartmentModifyDialog(){
				var selectedRows=$("#dg").datagrid('getSelections');
				if(selectedRows.length!=1){
					$.messager.alert("系统提示","请选择一条要编辑的数据！");
					return;
				}
				var row=selectedRows[0];
				$("#dlg").dialog("open").dialog("setTitle","编辑职务信息");
				
//				$('#fm').form('load',row);
				$("#post_name").val(row.post_name);
				$("#post_remark").val(row.post_remark);
				url="/TeamSchoolManage/UpdatePost.action?post_id="+row.post_id;
			}
			
			function closeDepartmentDialog(){
				$('#dlg').dialog("close");
				resetValue();
			}
			
			function resetValue(){
				$('#post_name').val("");
				$('#post_remark').val("");
			}
			//添加
			function saveDepartment(){
				$('#fm').form("submit",{
					url:url,
					onSubmit:function(){
						return $(this).form("validate");
					},
					success:function(result){
						if(result.errorMsg){
							$.messager.alert("系统提示",result.errorMsg);
							return;
						}else{
							$.messager.alert("系统提示","保存成功");
							resetValue();
							$("#dlg").dialog("close");
							$("#dg").datagrid("reload");
						}
					}
				});
			}
		</script>
</head>
<body>
	<table id="dg" title="" class="easyui-datagrid" style="width:700px;height:250px"
				fitColumns="true" rownumbers="true" fit="true" pagination="true" pageSize="20"  url="/TeamSchoolManage/AllPost.action" toolbar="#tb" >
			<thead>
				<tr>
					<th field="cb" checkbox="true" ></th>
					<th data-options="field:'post_id'" width="20">编号</th>
					<th data-options="field:'post_name'" width="40">职务名称</th>
				</tr>
			</thead>
	</table>
	<div style="padding:5px;" id="tb" >
		<a href="javascript:openDepartmentAddDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">添加</a>
		<a href="javascript:openDepartmentModifyDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" plain="true">修改</a>
		<a href="javascript:deleteDepartment()" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" plain="true">删除</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职务名称：&nbsp;<input type="text" name="s_post_name" id="s_post_name" />&nbsp;
		<a href="javascript:searchDepartment()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'" plain="true">搜索</a>
	</div>
	<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px;" closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post" >
			<table>
				<tr>
					<td>职务名称：</td><!-- department.post_name -->
					<td><input type="text" name="post_name" id="post_name" class="easyui-validatebox" required="true" ></td>
				</tr>
				<tr>
					<td valign="top">职务描述：</td>
					<td><textarea rows="7" cols="30" name="post_remark" id="post_remark" ></textarea></td>
				</tr>
			</table>			
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveDepartment()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
		<a href="javascript:closeDepartmentDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
	</div>
</body>
</html>