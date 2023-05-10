<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.Project" %>
<%@ page import="com.chengxusheji.po.ProjectType" %>
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //获取所有的projectTypeObj信息
    List<ProjectType> projectTypeList = (List<ProjectType>)request.getAttribute("projectTypeList");
    //获取所有的userObj信息
    List<UserInfo> userInfoList = (List<UserInfo>)request.getAttribute("userInfoList");
    Project project = (Project)request.getAttribute("project");

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
  <TITLE>修改项目信息</TITLE>
  <link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/animate.css" rel="stylesheet"> 
</head>
<body style="margin-top:70px;"> 
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="col-md-9 wow fadeInLeft">
	<ul class="breadcrumb">
  		<li><a href="<%=basePath %>index.jsp">首页</a></li>
  		<li class="active">项目信息修改</li>
	</ul>
		<div class="row"> 
      	<form class="form-horizontal" name="projectEditForm" id="projectEditForm" enctype="multipart/form-data" method="post"  class="mar_t15">
		  <div class="form-group">
			 <label for="project_projectId_edit" class="col-md-3 text-right">项目id:</label>
			 <div class="col-md-9"> 
			 	<input type="text" id="project_projectId_edit" name="project.projectId" class="form-control" placeholder="请输入项目id" readOnly>
			 </div>
		  </div> 
		  <div class="form-group">
		  	 <label for="project_projectTypeObj_projectTypeId_edit" class="col-md-3 text-right">项目类型:</label>
		  	 <div class="col-md-9">
			    <select id="project_projectTypeObj_projectTypeId_edit" name="project.projectTypeObj.projectTypeId" class="form-control">
			    </select>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="project_projectName_edit" class="col-md-3 text-right">项目名称:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="project_projectName_edit" name="project.projectName" class="form-control" placeholder="请输入项目名称">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="project_projectPhoto_edit" class="col-md-3 text-right">项目主图:</label>
		  	 <div class="col-md-9">
			    <img  class="img-responsive" id="project_projectPhotoImg" border="0px"/><br/>
			    <input type="hidden" id="project_projectPhoto" name="project.projectPhoto"/>
			    <input id="projectPhotoFile" name="projectPhotoFile" type="file" size="50" />
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="project_mainPerson_edit" class="col-md-3 text-right">负责人:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="project_mainPerson_edit" name="project.mainPerson" class="form-control" placeholder="请输入负责人">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="project_comeFrom_edit" class="col-md-3 text-right">项目来源:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="project_comeFrom_edit" name="project.comeFrom" class="form-control" placeholder="请输入项目来源">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="project_kydh_edit" class="col-md-3 text-right">科研代号:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="project_kydh_edit" name="project.kydh" class="form-control" placeholder="请输入科研代号">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="project_startDate_edit" class="col-md-3 text-right">开始日期:</label>
		  	 <div class="col-md-9">
                <div class="input-group date project_startDate_edit col-md-12" data-link-field="project_startDate_edit" data-link-format="yyyy-mm-dd">
                    <input class="form-control" id="project_startDate_edit" name="project.startDate" size="16" type="text" value="" placeholder="请选择开始日期" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="project_endDate_edit" class="col-md-3 text-right">结束日期:</label>
		  	 <div class="col-md-9">
                <div class="input-group date project_endDate_edit col-md-12" data-link-field="project_endDate_edit" data-link-format="yyyy-mm-dd">
                    <input class="form-control" id="project_endDate_edit" name="project.endDate" size="16" type="text" value="" placeholder="请选择结束日期" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="project_kyMoney_edit" class="col-md-3 text-right">科研资金:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="project_kyMoney_edit" name="project.kyMoney" class="form-control" placeholder="请输入科研资金">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="project_projectDesc_edit" class="col-md-3 text-right">项目介绍:</label>
		  	 <div class="col-md-9">
			    <script name="project.projectDesc" id="project_projectDesc_edit" type="text/plain"   style="width:100%;height:500px;"></script>
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="project_userObj_user_name_edit" class="col-md-3 text-right">提交用户:</label>
		  	 <div class="col-md-9">
			    <select id="project_userObj_user_name_edit" name="project.userObj.user_name" class="form-control">
			    </select>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="project_shzt_edit" class="col-md-3 text-right">审核状态:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="project_shzt_edit" name="project.shzt" class="form-control" placeholder="请输入审核状态">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="project_shr_edit" class="col-md-3 text-right">审核人:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="project_shr_edit" name="project.shr" class="form-control" placeholder="请输入审核人">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="project_shsj_edit" class="col-md-3 text-right">审核时间:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="project_shsj_edit" name="project.shsj" class="form-control" placeholder="请输入审核时间">
			 </div>
		  </div>
			  <div class="form-group">
			  	<span class="col-md-3""></span>
			  	<span onclick="ajaxProjectModify();" class="btn btn-primary bottom5 top5">修改</span>
			  </div>
		</form> 
	    <style>#projectEditForm .form-group {margin-bottom:5px;}  </style>
      </div>
   </div>
</div>


<jsp:include page="../footer.jsp"></jsp:include>
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jsdate.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor1_4_3/lang/zh-cn/zh-cn.js"></script>
<script>
var project_projectDesc_editor = UE.getEditor('project_projectDesc_edit'); //项目介绍编辑框
var basePath = "<%=basePath%>";
/*弹出修改项目界面并初始化数据*/
function projectEdit(projectId) {
  project_projectDesc_editor.addListener("ready", function () {
    // editor准备好之后才可以使用 
    ajaxModifyQuery(projectId);
  });
}
 function ajaxModifyQuery(projectId) {
	$.ajax({
		url :  basePath + "Project/" + projectId + "/update",
		type : "get",
		dataType: "json",
		success : function (project, response, status) {
			if (project) {
				$("#project_projectId_edit").val(project.projectId);
				$.ajax({
					url: basePath + "ProjectType/listAll",
					type: "get",
					success: function(projectTypes,response,status) { 
						$("#project_projectTypeObj_projectTypeId_edit").empty();
						var html="";
		        		$(projectTypes).each(function(i,projectType){
		        			html += "<option value='" + projectType.projectTypeId + "'>" + projectType.projectTypeName + "</option>";
		        		});
		        		$("#project_projectTypeObj_projectTypeId_edit").html(html);
		        		$("#project_projectTypeObj_projectTypeId_edit").val(project.projectTypeObjPri);
					}
				});
				$("#project_projectName_edit").val(project.projectName);
				$("#project_projectPhoto").val(project.projectPhoto);
				$("#project_projectPhotoImg").attr("src", basePath +　project.projectPhoto);
				$("#project_mainPerson_edit").val(project.mainPerson);
				$("#project_comeFrom_edit").val(project.comeFrom);
				$("#project_kydh_edit").val(project.kydh);
				$("#project_startDate_edit").val(project.startDate);
				$("#project_endDate_edit").val(project.endDate);
				$("#project_kyMoney_edit").val(project.kyMoney);
				project_projectDesc_editor.setContent(project.projectDesc, false);
				$.ajax({
					url: basePath + "UserInfo/listAll",
					type: "get",
					success: function(userInfos,response,status) { 
						$("#project_userObj_user_name_edit").empty();
						var html="";
		        		$(userInfos).each(function(i,userInfo){
		        			html += "<option value='" + userInfo.user_name + "'>" + userInfo.name + "</option>";
		        		});
		        		$("#project_userObj_user_name_edit").html(html);
		        		$("#project_userObj_user_name_edit").val(project.userObjPri);
					}
				});
				$("#project_shzt_edit").val(project.shzt);
				$("#project_shr_edit").val(project.shr);
				$("#project_shsj_edit").val(project.shsj);
			} else {
				alert("获取信息失败！");
			}
		}
	});
}

/*ajax方式提交项目信息表单给服务器端修改*/
function ajaxProjectModify() {
	$.ajax({
		url :  basePath + "Project/" + $("#project_projectId_edit").val() + "/update",
		type : "post",
		dataType: "json",
		data: new FormData($("#projectEditForm")[0]),
		success : function (obj, response, status) {
            if(obj.success){
                alert("信息修改成功！");
                location.reload(true);
                $("#projectQueryForm").submit();
            }else{
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
    /*开始日期组件*/
    $('.project_startDate_edit').datetimepicker({
    	language:  'zh-CN',  //语言
    	format: 'yyyy-mm-dd',
    	minView: 2,
    	weekStart: 1,
    	todayBtn:  1,
    	autoclose: 1,
    	minuteStep: 1,
    	todayHighlight: 1,
    	startView: 2,
    	forceParse: 0
    });
    /*结束日期组件*/
    $('.project_endDate_edit').datetimepicker({
    	language:  'zh-CN',  //语言
    	format: 'yyyy-mm-dd',
    	minView: 2,
    	weekStart: 1,
    	todayBtn:  1,
    	autoclose: 1,
    	minuteStep: 1,
    	todayHighlight: 1,
    	startView: 2,
    	forceParse: 0
    });
    projectEdit("<%=request.getParameter("projectId")%>");
 })
 </script> 
</body>
</html>

