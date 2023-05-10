$(function () {
	//实例化编辑器
	//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	UE.delEditor('thesis_thesisDesc_edit');
	var thesis_thesisDesc_edit = UE.getEditor('thesis_thesisDesc_edit'); //论文介绍编辑器
	thesis_thesisDesc_edit.addListener("ready", function () {
		 // editor准备好之后才可以使用 
		 ajaxModifyQuery();
	}); 
  function ajaxModifyQuery() {	
	$.ajax({
		url : "Thesis/" + $("#thesis_thesisId_edit").val() + "/update",
		type : "get",
		data : {
			//thesisId : $("#thesis_thesisId_edit").val(),
		},
		beforeSend : function () {
			$.messager.progress({
				text : "正在获取中...",
			});
		},
		success : function (thesis, response, status) {
			$.messager.progress("close");
			if (thesis) { 
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
				thesis_thesisDesc_edit.setContent(thesis.thesisDesc);
				$("#thesis_thesisFile").val(thesis.thesisFile);
				if(thesis.thesisFile == "") $("#thesis_thesisFileA").html("暂无文件");
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
				$(".messager-window").css("z-index",10000);
			}
		}
	});

  }

	$("#thesisModifyButton").click(function(){ 
		if ($("#thesisEditForm").form("validate")) {
			$("#thesisEditForm").form({
			    url:"Thesis/" +  $("#thesis_thesisId_edit").val() + "/update",
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
			$("#thesisEditForm").submit();
		} else {
			$.messager.alert("错误提示","你输入的信息还有错误！","warning");
			$(".messager-window").css("z-index",10000);
		}
	});
});
