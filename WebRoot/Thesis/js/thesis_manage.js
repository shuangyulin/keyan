var thesis_manage_tool = null; 
$(function () { 
	initThesisManageTool(); //建立Thesis管理对象
	thesis_manage_tool.init(); //如果需要通过下拉框查询，首先初始化下拉框的值
	$("#thesis_manage").datagrid({
		url : 'Thesis/list',
		fit : true,
		fitColumns : true,
		striped : true,
		rownumbers : true,
		border : false,
		pagination : true,
		pageSize : 5,
		pageList : [5, 10, 15, 20, 25],
		pageNumber : 1,
		sortName : "thesisId",
		sortOrder : "desc",
		toolbar : "#thesis_manage_tool",
		columns : [[
			{
				field : "thesisId",
				title : "论文id",
				width : 70,
			},
			{
				field : "xkml",
				title : "学科门类",
				width : 140,
			},
			{
				field : "name",
				title : "论文名称",
				width : 140,
			},
			{
				field : "lwfm",
				title : "论文封面图",
				width : "70px",
				height: "65px",
				formatter: function(val,row) {
					return "<img src='" + val + "' width='65px' height='55px' />";
				}
 			},
			{
				field : "author",
				title : "作者",
				width : 140,
			},
			{
				field : "teacher",
				title : "指导老师",
				width : 140,
			},
			{
				field : "publishDate",
				title : "发布日期",
				width : 140,
			},
			{
				field : "thesisFile",
				title : "论文文件",
				width : "350px",
				formatter: function(val,row) {
 					if(val == "") return "暂无文件";
					return "<a href='" + val + "' target='_blank' style='color:red;'>" + val + "</a>";
				}
 			},
			{
				field : "userObj",
				title : "提交用户",
				width : 140,
			},
		]],
	});

	$("#thesisEditDiv").dialog({
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
				if ($("#thesisEditForm").form("validate")) {
					//验证表单 
					if(!$("#thesisEditForm").form("validate")) {
						$.messager.alert("错误提示","你输入的信息还有错误！","warning");
					} else {
						$("#thesisEditForm").form({
						    url:"Thesis/" + $("#thesis_thesisId_edit").val() + "/update",
						    onSubmit: function(){
								if($("#thesisEditForm").form("validate"))  {
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
			                        $("#thesisEditDiv").dialog("close");
			                        thesis_manage_tool.reload();
			                    }else{
			                        $.messager.alert("消息",obj.message);
			                    } 
						    }
						});
						//提交表单
						$("#thesisEditForm").submit();
					}
				}
			},
		},{
			text : "取消",
			iconCls : "icon-redo",
			handler : function () {
				$("#thesisEditDiv").dialog("close");
				$("#thesisEditForm").form("reset"); 
			},
		}],
	});
});

function initThesisManageTool() {
	thesis_manage_tool = {
		init: function() {
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
			$("#thesis_manage").datagrid("reload");
		},
		redo : function () {
			$("#thesis_manage").datagrid("unselectAll");
		},
		search: function() {
			var queryParams = $("#thesis_manage").datagrid("options").queryParams;
			queryParams["author"] = $("#author").val();
			queryParams["teacher"] = $("#teacher").val();
			queryParams["publishDate"] = $("#publishDate").datebox("getValue"); 
			queryParams["userObj.user_name"] = $("#userObj_user_name_query").combobox("getValue");
			queryParams["xkml"] = $("#xkml").val();
			queryParams["name"] = $("#name").val();
			$("#thesis_manage").datagrid("options").queryParams=queryParams; 
			$("#thesis_manage").datagrid("load");
		},
		exportExcel: function() {
			$("#thesisQueryForm").form({
			    url:"Thesis/OutToExcel",
			});
			//提交表单
			$("#thesisQueryForm").submit();
		},
		remove : function () {
			var rows = $("#thesis_manage").datagrid("getSelections");
			if (rows.length > 0) {
				$.messager.confirm("确定操作", "您正在要删除所选的记录吗？", function (flag) {
					if (flag) {
						var thesisIds = [];
						for (var i = 0; i < rows.length; i ++) {
							thesisIds.push(rows[i].thesisId);
						}
						$.ajax({
							type : "POST",
							url : "Thesis/deletes",
							data : {
								thesisIds : thesisIds.join(","),
							},
							beforeSend : function () {
								$("#thesis_manage").datagrid("loading");
							},
							success : function (data) {
								if (data.success) {
									$("#thesis_manage").datagrid("loaded");
									$("#thesis_manage").datagrid("load");
									$("#thesis_manage").datagrid("unselectAll");
									$.messager.show({
										title : "提示",
										msg : data.message
									});
								} else {
									$("#thesis_manage").datagrid("loaded");
									$("#thesis_manage").datagrid("load");
									$("#thesis_manage").datagrid("unselectAll");
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
			var rows = $("#thesis_manage").datagrid("getSelections");
			if (rows.length > 1) {
				$.messager.alert("警告操作！", "编辑记录只能选定一条数据！", "warning");
			} else if (rows.length == 1) {
				$.ajax({
					url : "Thesis/" + rows[0].thesisId +  "/update",
					type : "get",
					data : {
						//thesisId : rows[0].thesisId,
					},
					beforeSend : function () {
						$.messager.progress({
							text : "正在获取中...",
						});
					},
					success : function (thesis, response, status) {
						$.messager.progress("close");
						if (thesis) { 
							$("#thesisEditDiv").dialog("open");
							$("#thesis_thesisId_edit").val(thesis.thesisId);
							$("#thesis_thesisId_edit").validatebox({
								required : true,
								missingMessage : "请输入论文id",
								editable: false
							});
							$("#thesis_xkml_edit").val(thesis.xkml);
							$("#thesis_xkml_edit").validatebox({
								required : true,
								missingMessage : "请输入学科门类",
							});
							$("#thesis_name_edit").val(thesis.name);
							$("#thesis_name_edit").validatebox({
								required : true,
								missingMessage : "请输入论文名称",
							});
							$("#thesis_lwfm").val(thesis.lwfm);
							$("#thesis_lwfmImg").attr("src", thesis.lwfm);
							$("#thesis_author_edit").val(thesis.author);
							$("#thesis_author_edit").validatebox({
								required : true,
								missingMessage : "请输入作者",
							});
							$("#thesis_teacher_edit").val(thesis.teacher);
							$("#thesis_teacher_edit").validatebox({
								required : true,
								missingMessage : "请输入指导老师",
							});
							$("#thesis_publishDate_edit").datebox({
								value: thesis.publishDate,
							    required: true,
							    showSeconds: true,
							});
							thesis_thesisDesc_editor.setContent(thesis.thesisDesc, false);
							$("#thesis_thesisFile").val(thesis.thesisFile);
							if(thesis.thesisFile == "") $("#thesis_thesisFileA").html("暂无文件");
							else $("#thesis_thesisFileA").html(thesis.thesisFile);
							$("#thesis_thesisFileA").attr("href", thesis.thesisFile);
							$("#thesis_xgyj_edit").val(thesis.xgyj);
							$("#thesis_userObj_user_name_edit").combobox({
								url:"UserInfo/listAll",
							    valueField:"user_name",
							    textField:"name",
							    panelHeight: "auto",
						        editable: false, //不允许手动输入 
						        onLoadSuccess: function () { //数据加载完毕事件
									$("#thesis_userObj_user_name_edit").combobox("select", thesis.userObjPri);
									//var data = $("#thesis_userObj_user_name_edit").combobox("getData"); 
						            //if (data.length > 0) {
						                //$("#thesis_userObj_user_name_edit").combobox("select", data[0].user_name);
						            //}
								}
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
