$(function () {
	//实例化编辑器
	//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	UE.delEditor('thesis_thesisDesc');
	var thesis_thesisDesc_editor = UE.getEditor('thesis_thesisDesc'); //论文介绍编辑框
	$("#thesis_xkml").validatebox({
		required : true, 
		missingMessage : '请输入学科门类',
	});

	$("#thesis_name").validatebox({
		required : true, 
		missingMessage : '请输入论文名称',
	});

	$("#thesis_author").validatebox({
		required : true, 
		missingMessage : '请输入作者',
	});

	$("#thesis_teacher").validatebox({
		required : true, 
		missingMessage : '请输入指导老师',
	});

	$("#thesis_publishDate").datebox({
	    required : true, 
	    showSeconds: true,
	    editable: false
	});

	$("#thesis_userObj_user_name").combobox({
	    url:'UserInfo/listAll',
	    valueField: "user_name",
	    textField: "name",
	    panelHeight: "auto",
        editable: false, //不允许手动输入
        required : true,
        onLoadSuccess: function () { //数据加载完毕事件
            var data = $("#thesis_userObj_user_name").combobox("getData"); 
            if (data.length > 0) {
                $("#thesis_userObj_user_name").combobox("select", data[0].user_name);
            }
        }
	});
	//单击添加按钮
	$("#thesisAddButton").click(function () {
		if(thesis_thesisDesc_editor.getContent() == "") {
			alert("请输入论文介绍");
			return;
		}
		//验证表单 
		if(!$("#thesisAddForm").form("validate")) {
			$.messager.alert("错误提示","你输入的信息还有错误！","warning");
			$(".messager-window").css("z-index",10000);
		} else {
			$("#thesisAddForm").form({
			    url:"Thesis/add",
			    onSubmit: function(){
					if($("#thesisAddForm").form("validate"))  { 
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
                        $("#thesisAddForm").form("clear");
                        thesis_thesisDesc_editor.setContent("");
                    }else{
                        $.messager.alert("消息",obj.message);
                        $(".messager-window").css("z-index",10000);
                    }
			    }
			});
			//提交表单
			$("#thesisAddForm").submit();
		}
	});

	//单击清空按钮
	$("#thesisClearButton").click(function () { 
		$("#thesisAddForm").form("clear"); 
	});
});
