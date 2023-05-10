$(function () {
	//实例化编辑器
	//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	UE.delEditor('project_projectDesc');
	var project_projectDesc_editor = UE.getEditor('project_projectDesc'); //项目介绍编辑框
	$("#project_projectTypeObj_projectTypeId").combobox({
	    url:'ProjectType/listAll',
	    valueField: "projectTypeId",
	    textField: "projectTypeName",
	    panelHeight: "auto",
        editable: false, //不允许手动输入
        required : true,
        onLoadSuccess: function () { //数据加载完毕事件
            var data = $("#project_projectTypeObj_projectTypeId").combobox("getData"); 
            if (data.length > 0) {
                $("#project_projectTypeObj_projectTypeId").combobox("select", data[0].projectTypeId);
            }
        }
	});
	$("#project_projectName").validatebox({
		required : true, 
		missingMessage : '请输入项目名称',
	});

	$("#project_mainPerson").validatebox({
		required : true, 
		missingMessage : '请输入负责人',
	});

	$("#project_kydh").validatebox({
		required : true, 
		missingMessage : '请输入科研代号',
	});

	$("#project_startDate").datebox({
	    required : true, 
	    showSeconds: true,
	    editable: false
	});

	$("#project_endDate").datebox({
	    required : true, 
	    showSeconds: true,
	    editable: false
	});

	$("#project_kyMoney").validatebox({
		required : true,
		validType : "number",
		missingMessage : '请输入科研资金',
		invalidMessage : '科研资金输入不对',
	});

	$("#project_userObj_user_name").combobox({
	    url:'UserInfo/listAll',
	    valueField: "user_name",
	    textField: "name",
	    panelHeight: "auto",
        editable: false, //不允许手动输入
        required : true,
        onLoadSuccess: function () { //数据加载完毕事件
            var data = $("#project_userObj_user_name").combobox("getData"); 
            if (data.length > 0) {
                $("#project_userObj_user_name").combobox("select", data[0].user_name);
            }
        }
	});
	$("#project_shzt").validatebox({
		required : true, 
		missingMessage : '请输入审核状态',
	});

	//单击添加按钮
	$("#projectAddButton").click(function () {
		if(project_projectDesc_editor.getContent() == "") {
			alert("请输入项目介绍");
			return;
		}
		//验证表单 
		if(!$("#projectAddForm").form("validate")) {
			$.messager.alert("错误提示","你输入的信息还有错误！","warning");
			$(".messager-window").css("z-index",10000);
		} else {
			$("#projectAddForm").form({
			    url:"Project/add",
			    onSubmit: function(){
					if($("#projectAddForm").form("validate"))  { 
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
                    //此处data={"Success":true}是字符串
                	var obj = jQuery.parseJSON(data); 
                    if(obj.success){ 
                        $.messager.alert("消息","保存成功！");
                        $(".messager-window").css("z-index",10000);
                        $("#projectAddForm").form("clear");
                        project_projectDesc_editor.setContent("");
                    }else{
                        $.messager.alert("消息",obj.message);
                        $(".messager-window").css("z-index",10000);
                    }
			    }
			});
			//提交表单
			$("#projectAddForm").submit();
		}
	});

	//单击清空按钮
	$("#projectClearButton").click(function () { 
		$("#projectAddForm").form("clear"); 
	});
});
