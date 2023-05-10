$(function () {
	//实例化编辑器
	//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	UE.delEditor('project_projectDesc_edit');
	var project_projectDesc_edit = UE.getEditor('project_projectDesc_edit'); //项目介绍编辑器
	project_projectDesc_edit.addListener("ready", function () {
		 // editor准备好之后才可以使用 
		 ajaxModifyQuery();
	}); 
  function ajaxModifyQuery() {	
	$.ajax({
		url : "Project/" + $("#project_projectId_edit").val() + "/update",
		type : "get",
		data : {
			//projectId : $("#project_projectId_edit").val(),
		},
		beforeSend : function () {
			$.messager.progress({
				text : "正在获取中...",
			});
		},
		success : function (project, response, status) {
			$.messager.progress("close");
			if (project) { 
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
				project_projectDesc_edit.setContent(project.projectDesc);
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
				$(".messager-window").css("z-index",10000);
			}
		}
	});

  }

	$("#projectModifyButton").click(function(){ 
		if ($("#projectEditForm").form("validate")) {
			$("#projectEditForm").form({
			    url:"Project/" +  $("#project_projectId_edit").val() + "/update",
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
                	var obj = jQuery.parseJSON(data);
                    if(obj.success){
                        $.messager.alert("消息","信息修改成功！");
                        $(".messager-window").css("z-index",10000);
                        //location.href="frontlist";
                    }else{
                        $.messager.alert("消息",obj.message);
                        $(".messager-window").css("z-index",10000);
                    } 
			    }
			});
			//提交表单
			$("#projectEditForm").submit();
		} else {
			$.messager.alert("错误提示","你输入的信息还有错误！","warning");
			$(".messager-window").css("z-index",10000);
		}
	});
});
