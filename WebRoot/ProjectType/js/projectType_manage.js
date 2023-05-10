var projectType_manage_tool = null; 
$(function () { 
	initProjectTypeManageTool(); //建立ProjectType管理对象
	projectType_manage_tool.init(); //如果需要通过下拉框查询，首先初始化下拉框的值
	$("#projectType_manage").datagrid({
		url : 'ProjectType/list',
		fit : true,
		fitColumns : true,
		striped : true,
		rownumbers : true,
		border : false,
		pagination : true,
		pageSize : 5,
		pageList : [5, 10, 15, 20, 25],
		pageNumber : 1,
		sortName : "projectTypeId",
		sortOrder : "desc",
		toolbar : "#projectType_manage_tool",
		columns : [[
			{
				field : "projectTypeId",
				title : "项目性质id",
				width : 70,
			},
			{
				field : "projectTypeName",
				title : "项目性质名称",
				width : 140,
			},
		]],
	});

	$("#projectTypeEditDiv").dialog({
		title : "修改管理",
		top: "50px",
		width : 700,
		height : 515,
		modal : true,
		closed : true,
		iconCls : "icon-edit-new",
		buttons : [{
			text : "提交",
			iconCls : "icon-edit-new",
			handler : function () {
				if ($("#projectTypeEditForm").form("validate")) {
					//验证表单 
					if(!$("#projectTypeEditForm").form("validate")) {
						$.messager.alert("错误提示","你输入的信息还有错误！","warning");
					} else {
						$("#projectTypeEditForm").form({
						    url:"ProjectType/" + $("#projectType_projectTypeId_edit").val() + "/update",
						    onSubmit: function(){
								if($("#projectTypeEditForm").form("validate"))  {
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
			                        $("#projectTypeEditDiv").dialog("close");
			                        projectType_manage_tool.reload();
			                    }else{
			                        $.messager.alert("消息",obj.message);
			                    } 
						    }
						});
						//提交表单
						$("#projectTypeEditForm").submit();
					}
				}
			},
		},{
			text : "取消",
			iconCls : "icon-redo",
			handler : function () {
				$("#projectTypeEditDiv").dialog("close");
				$("#projectTypeEditForm").form("reset"); 
			},
		}],
	});
});

function initProjectTypeManageTool() {
	projectType_manage_tool = {
		init: function() {
		},
		reload : function () {
			$("#projectType_manage").datagrid("reload");
		},
		redo : function () {
			$("#projectType_manage").datagrid("unselectAll");
		},
		search: function() {
			$("#projectType_manage").datagrid("load");
		},
		exportExcel: function() {
			$("#projectTypeQueryForm").form({
			    url:"ProjectType/OutToExcel",
			});
			//提交表单
			$("#projectTypeQueryForm").submit();
		},
		remove : function () {
			var rows = $("#projectType_manage").datagrid("getSelections");
			if (rows.length > 0) {
				$.messager.confirm("确定操作", "您正在要删除所选的记录吗？", function (flag) {
					if (flag) {
						var projectTypeIds = [];
						for (var i = 0; i < rows.length; i ++) {
							projectTypeIds.push(rows[i].projectTypeId);
						}
						$.ajax({
							type : "POST",
							url : "ProjectType/deletes",
							data : {
								projectTypeIds : projectTypeIds.join(","),
							},
							beforeSend : function () {
								$("#projectType_manage").datagrid("loading");
							},
							success : function (data) {
								if (data.success) {
									$("#projectType_manage").datagrid("loaded");
									$("#projectType_manage").datagrid("load");
									$("#projectType_manage").datagrid("unselectAll");
									$.messager.show({
										title : "提示",
										msg : data.message
									});
								} else {
									$("#projectType_manage").datagrid("loaded");
									$("#projectType_manage").datagrid("load");
									$("#projectType_manage").datagrid("unselectAll");
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
			var rows = $("#projectType_manage").datagrid("getSelections");
			if (rows.length > 1) {
				$.messager.alert("警告操作！", "编辑记录只能选定一条数据！", "warning");
			} else if (rows.length == 1) {
				$.ajax({
					url : "ProjectType/" + rows[0].projectTypeId +  "/update",
					type : "get",
					data : {
						//projectTypeId : rows[0].projectTypeId,
					},
					beforeSend : function () {
						$.messager.progress({
							text : "正在获取中...",
						});
					},
					success : function (projectType, response, status) {
						$.messager.progress("close");
						if (projectType) { 
							$("#projectTypeEditDiv").dialog("open");
							$("#projectType_projectTypeId_edit").val(projectType.projectTypeId);
							$("#projectType_projectTypeId_edit").validatebox({
								required : true,
								missingMessage : "请输入项目性质id",
								editable: false
							});
							$("#projectType_projectTypeName_edit").val(projectType.projectTypeName);
							$("#projectType_projectTypeName_edit").validatebox({
								required : true,
								missingMessage : "请输入项目性质名称",
							});
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
