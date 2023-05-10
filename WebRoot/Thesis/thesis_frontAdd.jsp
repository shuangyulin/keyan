<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
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
<title>论文添加</title>
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
  			<li><a href="<%=basePath %>Thesis/frontlist">论文管理</a></li>
  			<li class="active">添加论文</li>
		</ul>
		<div class="row">
			<div class="col-md-10">
		      	<form class="form-horizontal" name="thesisAddForm" id="thesisAddForm" enctype="multipart/form-data" method="post"  class="mar_t15">
				  <div class="form-group">
				  	 <label for="thesis_xkml" class="col-md-2 text-right">学科门类:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="thesis_xkml" name="thesis.xkml" class="form-control" placeholder="请输入学科门类">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="thesis_name" class="col-md-2 text-right">论文名称:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="thesis_name" name="thesis.name" class="form-control" placeholder="请输入论文名称">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="thesis_lwfm" class="col-md-2 text-right">论文封面图:</label>
				  	 <div class="col-md-8">
					    <img  class="img-responsive" id="thesis_lwfmImg" border="0px"/><br/>
					    <input type="hidden" id="thesis_lwfm" name="thesis.lwfm"/>
					    <input id="lwfmFile" name="lwfmFile" type="file" size="50" />
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="thesis_author" class="col-md-2 text-right">作者:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="thesis_author" name="thesis.author" class="form-control" placeholder="请输入作者">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="thesis_teacher" class="col-md-2 text-right">指导老师:</label>
				  	 <div class="col-md-8">
					    <input type="text" id="thesis_teacher" name="thesis.teacher" class="form-control" placeholder="请输入指导老师">
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="thesis_publishDateDiv" class="col-md-2 text-right">发布日期:</label>
				  	 <div class="col-md-8">
		                <div id="thesis_publishDateDiv" class="input-group date thesis_publishDate col-md-12" data-link-field="thesis_publishDate" data-link-format="yyyy-mm-dd">
		                    <input class="form-control" id="thesis_publishDate" name="thesis.publishDate" size="16" type="text" value="" placeholder="请选择发布日期" readonly>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
		                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		                </div>
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="thesis_thesisDesc" class="col-md-2 text-right">论文介绍:</label>
				  	 <div class="col-md-8">
							    <textarea name="thesis.thesisDesc" id="thesis_thesisDesc" style="width:100%;height:500px;"></textarea>
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="thesis_thesisFile" class="col-md-2 text-right">论文文件:</label>
				  	 <div class="col-md-8">
					    <a id="thesis_thesisFileImg" border="0px"></a><br/>
					    <input type="hidden" id="thesis_thesisFile" name="thesis.thesisFile"/>
					    <input id="thesisFileFile" name="thesisFileFile" type="file" size="50" />
				  	 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="thesis_xgyj" class="col-md-2 text-right">修改意见:</label>
				  	 <div class="col-md-8">
					    <textarea id="thesis_xgyj" name="thesis.xgyj" rows="8" class="form-control" placeholder="请输入修改意见"></textarea>
					 </div>
				  </div>
				  <div class="form-group">
				  	 <label for="thesis_userObj_user_name" class="col-md-2 text-right">提交用户:</label>
				  	 <div class="col-md-8">
					    <select id="thesis_userObj_user_name" name="thesis.userObj.user_name" class="form-control">
					    </select>
				  	 </div>
				  </div>
		          <div class="form-group">
		             <span class="col-md-2""></span>
		             <span onclick="ajaxThesisAdd();" class="btn btn-primary bottom5 top5">添加</span>
		          </div> 
		          <style>#thesisAddForm .form-group {margin:5px;}  </style>  
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
var thesis_thesisDesc_editor = UE.getEditor('thesis_thesisDesc'); //论文介绍编辑器
var basePath = "<%=basePath%>";
	//提交添加论文信息
	function ajaxThesisAdd() { 
		//提交之前先验证表单
		$("#thesisAddForm").data('bootstrapValidator').validate();
		if(!$("#thesisAddForm").data('bootstrapValidator').isValid()){
			return;
		}
		if(thesis_thesisDesc_editor.getContent() == "") {
			alert('论文介绍不能为空');
			return;
		}
		jQuery.ajax({
			type : "post",
			url : basePath + "Thesis/add",
			dataType : "json" , 
			data: new FormData($("#thesisAddForm")[0]),
			success : function(obj) {
				if(obj.success){ 
					alert("保存成功！");
					$("#thesisAddForm").find("input").val("");
					$("#thesisAddForm").find("textarea").val("");
					thesis_thesisDesc_editor.setContent("");
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
	//验证论文添加表单字段
	$('#thesisAddForm').bootstrapValidator({
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			"thesis.xkml": {
				validators: {
					notEmpty: {
						message: "学科门类不能为空",
					}
				}
			},
			"thesis.name": {
				validators: {
					notEmpty: {
						message: "论文名称不能为空",
					}
				}
			},
			"thesis.author": {
				validators: {
					notEmpty: {
						message: "作者不能为空",
					}
				}
			},
			"thesis.teacher": {
				validators: {
					notEmpty: {
						message: "指导老师不能为空",
					}
				}
			},
			"thesis.publishDate": {
				validators: {
					notEmpty: {
						message: "发布日期不能为空",
					}
				}
			},
		}
	}); 
	//初始化提交用户下拉框值 
	$.ajax({
		url: basePath + "UserInfo/listAll",
		type: "get",
		success: function(userInfos,response,status) { 
			$("#thesis_userObj_user_name").empty();
			var html="";
    		$(userInfos).each(function(i,userInfo){
    			html += "<option value='" + userInfo.user_name + "'>" + userInfo.name + "</option>";
    		});
    		$("#thesis_userObj_user_name").html(html);
    	}
	});
	//发布日期组件
	$('#thesis_publishDateDiv').datetimepicker({
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
		$('#thesisAddForm').data('bootstrapValidator').updateStatus('thesis.publishDate', 'NOT_VALIDATED',null).validateField('thesis.publishDate');
	});
})
</script>
</body>
</html>
