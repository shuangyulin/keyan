<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.ProjectType" %>
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>项目添加</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="col-md-12 wow fadeInLeft">
		<ul class="breadcrumb">
  			<li><a href="<%=basePath %>index.jsp">首页</a></li>
  			<li><a href="<%=basePath %>Project/frontlist">项目管理</a></li>
  			<li class="active">添加项目</li>
		</ul>
		<div class="row">
			<div class="col-md-10">
		      	<form class="form-horizontal" name="projectAddForm" id="projectAddForm" enctype="multipart/form-data" method="post"  class="mar_t15">
				  <div class="form-group">
				  	 <label for="project_projectTypeObj_projectTypeId" class="col-md-2 text-right">项目类型:</label>
				  	 <div class="col-md-8">
					    <select id="project_projectTypeObj_projectTypeId" name="project.projectTypeObj.projectTypeId" class="form-control">
					    </select>
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="project_projectName" class="col-md-2 text-right">项目名称:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="project_projectName" name="project.projectName" class="form-control" placeholder="请输入项目名称">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="project_projectPhoto" class="col-md-2 text-right">项目主图:</label>
				  	 <div class="col-md-8">
					    <img  class="img-responsive" id="project_projectPhotoImg" border="0px"/><br/>
					    <input type="hidden" id="project_projectPhoto" name="project.projectPhoto"/>
					    <input id="projectPhotoFile" name="projectPhotoFile" type="file" size="50" />
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="project_mainPerson" class="col-md-2 text-right">负责人:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="project_mainPerson" name="project.mainPerson" class="form-control" placeholder="请输入负责人">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="project_comeFrom" class="col-md-2 text-right">项目来源:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="project_comeFrom" name="project.comeFrom" class="form-control" placeholder="请输入项目来源">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="project_kydh" class="col-md-2 text-right">科研代号:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="project_kydh" name="project.kydh" class="form-control" placeholder="请输入科研代号">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="project_startDateDiv" class="col-md-2 text-right">开始日期:</label>
				  	 <div class="col-md-8">
		                <div id="project_startDateDiv" class="input-group date project_startDate col-md-12" data-link-field="project_startDate" data-link-format="yyyy-mm-dd">
		                    <input class="form-control" id="project_startDate" name="project.startDate" size="16" type="text" value="" placeholder="请选择开始日期" readonly>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                </div>
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="project_endDateDiv" class="col-md-2 text-right">结束日期:</label>
				  	 <div class="col-md-8">
		                <div id="project_endDateDiv" class="input-group date project_endDate col-md-12" data-link-field="project_endDate" data-link-format="yyyy-mm-dd">
		                    <input class="form-control" id="project_endDate" name="project.endDate" size="16" type="text" value="" placeholder="请选择结束日期" readonly>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                </div>
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="project_kyMoney" class="col-md-2 text-right">科研资金:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="project_kyMoney" name="project.kyMoney" class="form-control" placeholder="请输入科研资金">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="project_projectDesc" class="col-md-2 text-right">项目介绍:</label>
				  	 <div class="col-md-8">
							    <textarea name="project.projectDesc" id="project_projectDesc" style="width:100%;height:500px;"></textarea>
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="project_userObj_user_name" class="col-md-2 text-right">提交用户:</label>
				  	 <div class="col-md-8">
					    <select id="project_userObj_user_name" name="project.userObj.user_name" class="form-control">
					    </select>
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="project_shzt" class="col-md-2 text-right">审核状态:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="project_shzt" name="project.shzt" class="form-control" placeholder="请输入审核状态">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="project_shr" class="col-md-2 text-right">审核人:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="project_shr" name="project.shr" class="form-control" placeholder="请输入审核人">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="project_shsj" class="col-md-2 text-right">审核时间:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="project_shsj" name="project.shsj" class="form-control" placeholder="请输入审核时间">
					 </div>
				  </div>
		          <div class="form-group">
		             <span class="col-md-2""></span>
		             <span onclick="ajaxProjectAdd();" class="btn btn-primary bottom5 top5">添加</span>
		          </div> 
		          <style>#projectAddForm .form-group {margin:5px;}  </style>  
				</form> 
			</div>
			<div class="col-md-2"></div> 
	    </div>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include> 
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>
<script>
//实例化编辑器
var project_projectDesc_editor = UE.getEditor('project_projectDesc'); //项目介绍编辑器
var basePath = "<%=basePath%>";
	//提交添加项目信息
	function ajaxProjectAdd() { 
		//提交之前先验证表单
		$("#projectAddForm").data('bootstrapValidator').validate();
		if(!$("#projectAddForm").data('bootstrapValidator').isValid()){
			return;
		}
		if(project_projectDesc_editor.getContent() == "") {
			alert('项目介绍不能为空');
			return;
		}
		jQuery.ajax({
			type : "post",
			url : basePath + "Project/add",
			dataType : "json" , 
			data: new FormData($("#projectAddForm")[0]),
			success : function(obj) {
				if(obj.success){ 
					alert("保存成功！");
					$("#projectAddForm").find("input").val("");
					$("#projectAddForm").find("textarea").val("");
					project_projectDesc_editor.setContent("");
				} else {
					alert(obj.message);
				}
			},
			processData: false, 
			contentType: false, 
		});
	} 
$(function(){
	/*小屏幕导航点击关闭菜单*/
    $('.navbar-collapse a').click(function(){
        $('.navbar-collapse').collapse('hide');
    });
    new WOW().init();
	//验证项目添加表单字段
	$('#projectAddForm').bootstrapValidator({
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			"project.projectName": {
				validators: {
					notEmpty: {
						message: "项目名称不能为空",
					}
				}
			},
			"project.mainPerson": {
				validators: {
					notEmpty: {
						message: "负责人不能为空",
					}
				}
			},
			"project.kydh": {
				validators: {
					notEmpty: {
						message: "科研代号不能为空",
					}
				}
			},
			"project.startDate": {
				validators: {
					notEmpty: {
						message: "开始日期不能为空",
					}
				}
			},
			"project.endDate": {
				validators: {
					notEmpty: {
						message: "结束日期不能为空",
					}
				}
			},
			"project.kyMoney": {
				validators: {
					notEmpty: {
						message: "科研资金不能为空",
					},
					numeric: {
						message: "科研资金不正确"
					}
				}
			},
			"project.shzt": {
				validators: {
					notEmpty: {
						message: "审核状态不能为空",
					}
				}
			},
		}
	}); 
	//初始化项目类型下拉框值 
	$.ajax({
		url: basePath + "ProjectType/listAll",
		type: "get",
		success: function(projectTypes,response,status) { 
			$("#project_projectTypeObj_projectTypeId").empty();
			var html="";
    		$(projectTypes).each(function(i,projectType){
    			html += "<option value='" + projectType.projectTypeId + "'>" + projectType.projectTypeName + "</option>";
    		});
    		$("#project_projectTypeObj_projectTypeId").html(html);
    	}
	});
	//初始化提交用户下拉框值 
	$.ajax({
		url: basePath + "UserInfo/listAll",
		type: "get",
		success: function(userInfos,response,status) { 
			$("#project_userObj_user_name").empty();
			var html="";
    		$(userInfos).each(function(i,userInfo){
    			html += "<option value='" + userInfo.user_name + "'>" + userInfo.name + "</option>";
    		});
    		$("#project_userObj_user_name").html(html);
    	}
	});
	//开始日期组件
	$('#project_startDateDiv').datetimepicker({
		language:  'zh-CN',  //显示语言
		format: 'yyyy-mm-dd',
		minView: 2,
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		minuteStep: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0
	}).on('hide',function(e) {
		//下面这行代码解决日期组件改变日期后不验证的问题
		$('#projectAddForm').data('bootstrapValidator').updateStatus('project.startDate', 'NOT_VALIDATED',null).validateField('project.startDate');
	});
	//结束日期组件
	$('#project_endDateDiv').datetimepicker({
		language:  'zh-CN',  //显示语言
		format: 'yyyy-mm-dd',
		minView: 2,
		weekStart: 1,
		todayBtn:  1,
		autoclose: 1,
		minuteStep: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0
	}).on('hide',function(e) {
		//下面这行代码解决日期组件改变日期后不验证的问题
		$('#projectAddForm').data('bootstrapValidator').updateStatus('project.endDate', 'NOT_VALIDATED',null).validateField('project.endDate');
	});
})
</script>
</body>
</html>
