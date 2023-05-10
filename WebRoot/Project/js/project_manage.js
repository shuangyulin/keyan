var project_manage_tool = null; 
$(function () { 
	initProjectManageTool(); //建立Project管理对象
	project_manage_tool.init(); //如果需要通过下拉框查询，首先初始化下拉框的值
	$("#project_manage").datagrid({
		url : 'Project/list',
		fit : true,
		fitColumns : true,
		striped : true,
		rownumbers : true,
		border : false,
		pagination : true,
		pageSize : 5,
		pageList : [5, 10, 15, 20, 25],
		pageNumber : 1,
		sortName : "projectId",
		sortOrder : "desc",
		toolbar : "#project_manage_tool",
		columns : [[
			{
				field : "projectId",
				title : "项目id",
				width : 70,
			},
			{
				field : "projectTypeObj",
				title : "项目类型",
				width : 140,
			},
			{
				field : "projectName",
				title : "项目名称",
				width : 140,
			},
			{
				field : "projectPhoto",
				title : "项目主图",
				width : "70px",
				height: "65px",
				formatter: function(val,row) {
					return "<img src='" + val + "' width='65px' height='55px' />";
				}
 			},
			{
				field : "mainPerson",
				title : "负责人",
				width : 140,
			},
			{
				field : "comeFrom",
				title : "项目来源",
				width : 140,
			},
			{
				field : "kydh",
				title : "科研代号",
				width : 140,
			},
			{
				field : "startDate",
				title : "开始日期",
				width : 140,
			},
			{
				field : "endDate",
				title : "结束日期",
				width : 140,
			},
			{
				field : "kyMoney",
				title : "科研资金",
				width : 70,
			},
			{
				field : "userObj",
				title : "提交用户",
				width : 140,
			},
			{
				field : "shzt",
				title : "审核状态",
				width : 140,
			},
		]],
	});

	$("#projectEditDiv").dialog({
		title : "修改管理",
		top: "10px",
		width : 1000,
		height : 600,
		modal : true,
		closed : true,
		iconCls : "icon-edit-new",
		buttons : [{
			text : "提交",
			iconCls : "icon-edit-new",
			handler : function () {
				if ($("#projectEditForm").form("validate")) {
					//验证表单 
					if(!$("#projectEditForm").form("validate")) {
						$.messager.alert("错误提示","你输入的信息还有错误！","warning");
					} else {
						$("#projectEditForm").form({
						    url:"Project/" + $("#project_projectId_edit").val() + "/update",
						    onSubmit: function(){
								if($("#projectEditForm").form("validate"))  {
				                	$.messager.progress({
										text : "正在提交数据中...",
									});
				                	return true;
				                } else { 
				                    return false; 
				                }
						    },
						    success:function(data){
						    	$.messager.progress("close");
						    	console.log(data);
			                	var obj = jQuery.parseJSON(data);
			                    if(obj.success){
			                        $.messager.alert("消息","信息修改成功！");
			                        $("#projectEditDiv").dialog("close");
			                        project_manage_tool.reload();
			                    }else{
			                        $.messager.alert("消息",obj.message);
			                    } 
						    }
						});
						//提交表单
						$("#projectEditForm").submit();
					}
				}
			},
		},{
			text : "取消",
			iconCls : "icon-redo",
			handler : function () {
				$("#projectEditDiv").dialog("close");
				$("#projectEditForm").form("reset"); 
			},
		}],
	});
});

function initProjectManageTool() {
	project_manage_tool = {
		init: function() {
			$.ajax({
				url : "ProjectType/listAll",
				type : "post",
				success : function (data, response, status) {
					$("#projectTypeObj_projectTypeId_query").combobox({ 
					    valueField:"projectTypeId",
					    textField:"projectTypeName",
					    panelHeight: "200px",
				        editable: false, //不允许手动输入 
					});
					data.splice(0,0,{projectTypeId:0,projectTypeName:"不限制"});
					$("#projectTypeObj_projectTypeId_query").combobox("loadData",data); 
				}
			});
			$.ajax({
				url : "UserInfo/listAll",
				type : "post",
				success : function (data, response, status) {
					$("#userObj_user_name_query").combobox({ 
					    valueField:"user_name",
					    textField:"name",
					    panelHeight: "200px",
				        editable: false, //不允许手动输入 
					});
					data.splice(0,0,{user_name:"",name:"不限制"});
					$("#userObj_user_name_query").combobox("loadData",data); 
				}
			});
		},
		reload : function () {
			$("#project_manage").datagrid("reload");
		},
		redo : function () {
			$("#project_manage").datagrid("unselectAll");
		},
		search: function() {
			var queryParams = $("#project_manage").datagrid("options").queryParams;
			queryParams["projectTypeObj.projectTypeId"] = $("#projectTypeObj_projectTypeId_query").combobox("getValue");
			queryParams["projectName"] = $("#projectName").val();
			queryParams["mainPerson"] = $("#mainPerson").val();
			queryParams["startDate"] = $("#startDate").datebox("getValue"); 
			queryParams["userObj.user_name"] = $("#userObj_user_name_query").combobox("getValue");
			queryParams["shzt"] = $("#shzt").val();
			queryParams["shr"] = $("#shr").val();
			$("#project_manage").datagrid("options").queryParams=queryParams; 
			$("#project_manage").datagrid("load");
		},
		exportExcel: function() {
			$("#projectQueryForm").form({
			    url:"Project/OutToExcel",
			});
			//提交表单
			$("#projectQueryForm").submit();
		},
		remove : function () {
			var rows = $("#project_manage").datagrid("getSelections");
			if (rows.length > 0) {
				$.messager.confirm("确定操作", "您正在要删除所选的记录吗？", function (flag) {
					if (flag) {
						var projectIds = [];
						for (var i = 0; i < rows.length; i ++) {
							projectIds.push(rows[i].projectId);
						}
						$.ajax({
							type : "POST",
							url : "Project/deletes",
							data : {
								projectIds : projectIds.join(","),
							},
							beforeSend : function () {
								$("#project_manage").datagrid("loading");
							},
							success : function (data) {
								if (data.success) {
									$("#project_manage").datagrid("loaded");
									$("#project_manage").datagrid("load");
									$("#project_manage").datagrid("unselectAll");
									$.messager.show({
										title : "提示",
										msg : data.message
									});
								} else {
									$("#project_manage").datagrid("loaded");
									$("#project_manage").datagrid("load");
									$("#project_manage").datagrid("unselectAll");
									$.messager.alert("消息",data.message);
								}
							},
						});
					}
				});
			} else {
				$.messager.alert("提示", "请选择要删除的记录！", "info");
			}
		},
		edit : function () {
			var rows = $("#project_manage").datagrid("getSelections");
			if (rows.length > 1) {
				$.messager.alert("警告操作！", "编辑记录只能选定一条数据！", "warning");
			} else if (rows.length == 1) {
				$.ajax({
					url : "Project/" + rows[0].projectId +  "/update",
					type : "get",
					data : {
						//projectId : rows[0].projectId,
					},
					beforeSend : function () {
						$.messager.progress({
							text : "正在获取中...",
						});
					},
					success : function (project, response, status) {
						$.messager.progress("close");
						if (project) { 
							$("#projectEditDiv").dialog("open");
							$("#project_projectId_edit").val(project.projectId);
							$("#project_projectId_edit").validatebox({
								required : true,
								missingMessage : "请输入项目id",
								editable: false
							});
							$("#project_projectTypeObj_projectTypeId_edit").combobox({
								url:"ProjectType/listAll",
							    valueField:"projectTypeId",
							    textField:"projectTypeName",
							    panelHeight: "auto",
						        editable: false, //不允许手动输入 
						        onLoadSuccess: function () { //数据加载完毕事件
									$("#project_projectTypeObj_projectTypeId_edit").combobox("select", project.projectTypeObjPri);
									//var data = $("#project_projectTypeObj_projectTypeId_edit").combobox("getData"); 
						            //if (data.length > 0) {
						                //$("#project_projectTypeObj_projectTypeId_edit").combobox("select", data[0].projectTypeId);
						            //}
								}
							});
							$("#project_projectName_edit").val(project.projectName);
							$("#project_projectName_edit").validatebox({
								required : true,
								missingMessage : "请输入项目名称",
							});
							$("#project_projectPhoto").val(project.projectPhoto);
							$("#project_projectPhotoImg").attr("src", project.projectPhoto);
							$("#project_mainPerson_edit").val(project.mainPerson);
							$("#project_mainPerson_edit").validatebox({
								required : true,
								missingMessage : "请输入负责人",
							});
							$("#project_comeFrom_edit").val(project.comeFrom);
							$("#project_kydh_edit").val(project.kydh);
							$("#project_kydh_edit").validatebox({
								required : true,
								missingMessage : "请输入科研代号",
							});
							$("#project_startDate_edit").datebox({
								value: project.startDate,
							    required: true,
							    showSeconds: true,
							});
							$("#project_endDate_edit").datebox({
								value: project.endDate,
							    required: true,
							    showSeconds: true,
							});
							$("#project_kyMoney_edit").val(project.kyMoney);
							$("#project_kyMoney_edit").validatebox({
								required : true,
								validType : "number",
								missingMessage : "请输入科研资金",
								invalidMessage : "科研资金输入不对",
							});
							project_projectDesc_editor.setContent(project.projectDesc, false);
							$("#project_userObj_user_name_edit").combobox({
								url:"UserInfo/listAll",
							    valueField:"user_name",
							    textField:"name",
							    panelHeight: "auto",
						        editable: false, //不允许手动输入 
						        onLoadSuccess: function () { //数据加载完毕事件
									$("#project_userObj_user_name_edit").combobox("select", project.userObjPri);
									//var data = $("#project_userObj_user_name_edit").combobox("getData"); 
						            //if (data.length > 0) {
						                //$("#project_userObj_user_name_edit").combobox("select", data[0].user_name);
						            //}
								}
							});
							$("#project_shzt_edit").val(project.shzt);
							$("#project_shzt_edit").validatebox({
								required : true,
								missingMessage : "请输入审核状态",
							});
							$("#project_shr_edit").val(project.shr);
							$("#project_shsj_edit").val(project.shsj);
						} else {
							$.messager.alert("获取失败！", "未知错误导致失败，请重试！", "warning");
						}
					}
				});
			} else if (rows.length == 0) {
				$.messager.alert("警告操作！", "编辑记录至少选定一条数据！", "warning");
			}
		},
	};
}
