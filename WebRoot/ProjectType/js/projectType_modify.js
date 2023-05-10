$(function () {
	$.ajax({
		url : "ProjectType/" + $("#projectType_projectTypeId_edit").val() + "/update",
		type : "get",
		data : {
			//projectTypeId : $("#projectType_projectTypeId_edit").val(),
		},
		beforeSend : function () {
			$.messager.progress({
				text : "正在获取中...",
			});
		},
		success : function (projectType, response, status) {
			$.messager.progress("close");
			if (projectType) { 
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
				$(".messager-window").css("z-index",10000);
			}
		}
	});

	$("#projectTypeModifyButton").click(function(){ 
		if ($("#projectTypeEditForm").form("validate")) {
			$("#projectTypeEditForm").form({
			    url:"ProjectType/" +  $("#projectType_projectTypeId_edit").val() + "/update",
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
			$("#projectTypeEditForm").submit();
		} else {
			$.messager.alert("错误提示","你输入的信息还有错误！","warning");
			$(".messager-window").css("z-index",10000);
		}
	});
});
