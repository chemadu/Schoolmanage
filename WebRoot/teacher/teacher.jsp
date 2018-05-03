<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>科帮网员工管理</title>
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
					s_employeeNo:$('#s_employeeNo').val(),
					s_name:$('#s_name').val(),
					s_sex:$('#s_sex').combobox("getValue"),
					s_bbirthday:$('#s_bbirthday').datebox("getValue"),
					s_ebirthday:$('#s_ebirthday').datebox("getValue"),
					s_nationality:$('#s_nationality').val(),
					s_education:$('#s_education').val(),
					s_departmentId:$('#s_departmentId').combobox("getValue"),
					s_position:$('#s_position').val()					
				});				
			}
			function openTeacherAddDialog(){
				$('#dlg').dialog('open').dialog("setTitle","员工信息");
				resetValue();
				url=("employee!save");
			}
			
			function openTeacherModifyDialog(){
				var selectedRows=$("#dg").datagrid('getSelections');
				if(selectedRows.length!=1){
					$.messager.alert("系统提示","请选择一条要编辑的数据！");
					return;
				}
				var row=selectedRows[0];
				$("#dlg").dialog("open").dialog("setTitle","编辑员工信息");
				$("#employeeNo").val(row.employeeNo);
				$("#name").val(row.name);
				$("#sex").combobox("setValue",row.sex);
				$('#birthday').datebox("setValue",row.birthday);
				$("#departmentId").combobox("setValue",row.departmentId);
				$("#nationality").val(row.nationality);
				$("#education").val(row.education);
				$("#profession").val(row.profession);
				$("#position").val(row.position);
				$("#baseMoney").val(row.baseMoney);
				$("#overtime").val(row.overtime);
				$("#age").val(row.age);
				$("#check1").val(row.check1);
				$("#absent").val(row.absent);
				$("#safety").val(row.safety);
				url="employee!save?employeeId="+row.employeeId;
			}
			
			function closeTeacherDialog(){
				$('#dlg').dialog("close");
				resetValue();
			}
			
			function resetValue(){
				$('#employeeNo').val("");
				$('#name').val("");
				$('#sex').combobox("setValue","");
				$('#bbirthday').datebox("setValue","");
				$('#departmentId').combobox("setValue","");
				$('#nationality').val("");
				$('#education').val("");
				$('#profession').val("");
				$('#position').val("");
				$("#baseMoney").val("");
				$("#overtime").val("");
				$("#age").val("");
				$("#check1").val("");
				$("#absent").val("");
				$("#safety").val("");
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
				})
				//window.location.href="employee!ExportEmployee";
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
					<th data-options="field:'teach_creattime'" width="10">入职日期</th>
					<th data-options="field:'post_id'" width="10" hidden="true">职务ID</th>
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
				&nbsp;教师编号:&nbsp;<input type="text" name="teach_id" id="s_employeeNo" size="10" />
			    &nbsp;教师姓名:&nbsp;<input type="text" name="teach_name" id="s_name" size="10" />
				&nbsp;入职日期:&nbsp;<input type="text" class="easyui-datebox" name="teach_creattime" id="s_bbirthday" size="11" editable="false" />
									<input type="text" class="easyui-datebox" name="teach_updatetime" id="s_ebirthday" size="11" editable="false" />
				&nbsp;职务:&nbsp;<input class="easyui-combobox" id="post_id" name="post_id" size="8" panelHeight="auto" data-options="editable:false,valueField:'departmentId',textField:'departmentName',url:'department!departmentComboList'" />
				&nbsp;是否在职任教:&nbsp;<select class="easyui-combobox" id="teach_office" name="teach_office" editable="false" panelHeight="auto" >
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
				<tr>
					<td>&nbsp;教师编号:&nbsp;</td>
					<td><input type="text" name="employee.employeeNo" id="employeeNo" class="easyui-validatebox" required="true" ></td>
					<td></td>
					<td></td>
				</tr>			
				<tr>
					<td>&nbsp;教师姓名:&nbsp;</td>
					<td><input type="text" name="employee.name" id="name" class="easyui-validatebox" required="true" ></td>
				</tr>
				<tr>
					<td>&nbsp;入职日期:&nbsp;</td>
					<td><input type="text" class="easyui-datebox" name="employee.birthday" id="birthday" editable="false" required="true" /></td>
				</tr>
				<tr>
					<td>&nbsp;职务:&nbsp;</td>
					<td>
						<input class="easyui-combobox" id="departmentId" name="employee.departmentId" size="8" panelHeight="auto" data-options="editable:false,valueField:'departmentId',textField:'departmentName',url:'department!departmentComboList'" />
					</td>
				</tr>
				<tr>
					<td>&nbsp;是否在职任教:&nbsp;</td>
					<td><select class="easyui-combobox" name="employee.sex" id="sex"  editable="false" panelHeight="auto" style="width:85px;">
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