<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师管理</title>
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
		
		
		<style type="text/css">
			input{
				width:80px;
			}
		</style>
		<script type="text/javascript">
			var url;
			function searchEmployee(){
				$('#dg').datagrid('load',{
					teacher_id:$('#teacher_id').val(),
					teacher_name:$('#teacher_name').val(),
					teacher_creattime:$('#teacher_creattime').datebox("getValue"),
					teacher_updatetime:$('#teacher_updatetime').datebox("getValue"),
					Tpost_id:$('#Tpost_id').combobox("getValue"),
					teach_office:$('#teach_office').combobox("getValue")
				});				
			}
			function openTeacherAddDialog(){
				$('#dlg').dialog('open').dialog("setTitle","教师信息");
				resetValue();
				url=("/TeamSchoolManage/InsertTeacherController.action");
			}
			
			function openTeacherModifyDialog(){
				var selectedRows=$("#dg").datagrid('getSelections');
				if(selectedRows.length!=1){
					$.messager.alert("系统提示","请选择一条要编辑的数据！");
					return;
				}
				var row=selectedRows[0];
				$("#dlg").dialog("open").dialog("setTitle","编辑教师信息");
				$("#teach_name").val(row.teach_name);
				$("#teach_office").combobox("setValue",row.teach_office);
				$('#teach_creattime').datebox("setValue",row.teach_creattime);
				$("#teach_id").val(row.teach_id);
				url="/TeamSchoolManage/UpdateTeacherController.action";
			}
			
			function closeTeacherDialog(){
				$('#dlg').dialog("close");
				resetValue();
			}
			
			function resetValue(){
				$('#teach_name').val("");
				$('#teach_creattime').datebox("setValue","");
				$('#teach_office').combobox("setValue","");
			}
			
			function saveTeacher(){
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
			function exportEmployee(){
				$('#search').form("submit",{
					url:"employee!ExportEmployee"
				});
			}
		</script>
</head>
<body>
	<table id="dg" title="" class="easyui-datagrid" style="width:700px;height:250px"
				fitColumns="true" rownumbers="true" fit="true" pagination="true" pageSize="20"  url="${pageContext.request.contextPath}/AllTeacherController.action" toolbar="#tb" >
			<thead>
				<tr>
					<th field="cb" checkbox="true" ></th>
					<th data-options="field:'teach_id'" width="5">教师编号</th>
					<th data-options="field:'teach_name'" width="10">教师姓名</th>
					<!-- <th data-options="field:'teach_creattime'" width="10">入职日期</th>
					<th data-options="field:'post_id'" width="10" hidden="true">职务ID</th> -->
					<th data-options="field:'post_name'" width="10" >职务</th>
					<th data-options="field:'teach_office'" width="10">是否在职任教</th>
					<th data-options="field:'teach_updatetime'" width="10" hidden="true">最后一次更新时间</th>
					<th data-options="field:'teach_comment'" width="10" >备注</th>
				</tr>
			</thead>
	</table>
	<div id="tb" >
		<div>
			<a href="javascript:openTeacherAddDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-add'" plain="true">添加</a>
			<a href="javascript:openTeacherModifyDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" plain="true">修改</a>
		</div>
		<div>
			<form id="search" method="post" >
				&nbsp;教师编号:&nbsp;<input type="text" name="teach_id" id="teacher_id" size="10" />
			    &nbsp;教师姓名:&nbsp;<input type="text" name="teach_name" id="teacher_name" size="10" />
				&nbsp;入职日期:&nbsp;<input type="text" class="easyui-datebox" name="teach_creattime" id="teacher_creattime" size="11" editable="false" />
									<input type="text" class="easyui-datebox" name="teach_updatetime" id="teacher_updatetime" size="11" editable="false" />
				&nbsp;职务:&nbsp;<input class="easyui-combobox" id="Tpost_id" name="post_id" size="8" panelHeight="auto" data-options="editable:false,valueField:'post_id',textField:'post_name',url:'${pageContext.request.contextPath}/AllPostController.action'" />
				&nbsp;是否在职任教:&nbsp;<select class="easyui-combobox" id="teacher_office" name="teach_office" editable="false" panelHeight="auto" >
									<option value="" >请选择</option>
									<option value="是" >是</option>
									<option value="否" >否</option>
								</select>
				<a href="javascript:searchEmployee()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'" plain="true">搜索</a>
			</form>
		</div>
		<br />
	</div>
	<div id="dlg" class="easyui-dialog" style="width:400px;height:250px;padding:20px 10px 0;" closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post" >
			<table>
				<!-- <tr>
					<td>&nbsp;教师编号:&nbsp;</td>
					<td><input type="text" name="teach_id" id="teach_id" class="easyui-validatebox" required="true" ></td>
				</tr> -->
				<tr>
					<input name="teach_id" id="teach_id" type="hidden" />
					<td>&nbsp;教师姓名:&nbsp;</td>
					<td><input type="text" name="teach_name" id="teach_name" class="easyui-validatebox" required="true" ></td>
				</tr>
				<tr>
					<td>&nbsp;入职日期:&nbsp;</td>
					<td><input type="text" class="easyui-datebox" name="teach_creattime" id="teach_creattime" editable="false" required="true" /></td>
				</tr>
				<%-- <tr>
					<td>&nbsp;职务:&nbsp;</td>
					<td>
						<input class="easyui-combobox" id="post_id" name="post_id" size="8" panelHeight="auto" data-options="editable:false,valueField:'post_id',textField:'post_name',url:'${pageContext.request.contextPath}/AllPostController.action'" />
					</td>
				</tr> --%>
				<tr>
					<td>&nbsp;是否在职任教:&nbsp;</td>
					<td><select class="easyui-combobox" name="teach_office" id="teach_office"  editable="false" panelHeight="auto" style="width:85px;">
								<option value="" >请选择</option>
								<option value="是" >是</option>
								<option value="否" >否</option>
						</select>
					</td>
				</tr>
			</table>			
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveTeacher()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
		<a href="javascript:closeTeacherDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
	</div>
</body>
</html>