<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.Project" %>
<%@ page import="com.chengxusheji.po.ProjectType" %>
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    List<Project> projectList = (List<Project>)request.getAttribute("projectList");
    //获取所有的projectTypeObj信息
    List<ProjectType> projectTypeList = (List<ProjectType>)request.getAttribute("projectTypeList");
    //获取所有的userObj信息
    List<UserInfo> userInfoList = (List<UserInfo>)request.getAttribute("userInfoList");
    int currentPage =  (Integer)request.getAttribute("currentPage"); //当前页
    int totalPage =   (Integer)request.getAttribute("totalPage");  //一共多少页
    int recordNumber =   (Integer)request.getAttribute("recordNumber");  //一共多少记录
    ProjectType projectTypeObj = (ProjectType)request.getAttribute("projectTypeObj");
    String projectName = (String)request.getAttribute("projectName"); //项目名称查询关键字
    String mainPerson = (String)request.getAttribute("mainPerson"); //负责人查询关键字
    String startDate = (String)request.getAttribute("startDate"); //开始日期查询关键字
    UserInfo userObj = (UserInfo)request.getAttribute("userObj");
    String shzt = (String)request.getAttribute("shzt"); //审核状态查询关键字
    String shr = (String)request.getAttribute("shr"); //审核人查询关键字
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>项目查询</title>
<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="col-md-9 wow fadeInLeft">
		<ul class="breadcrumb">
  			<li><a href="<%=basePath %>index.jsp">首页</a></li>
  			<li><a href="<%=basePath %>Project/frontlist">项目信息列表</a></li>
  			<li class="active">查询结果显示</li>
  			<a class="pull-right" href="<%=basePath %>Project/project_frontAdd.jsp" style="display:none;">添加项目</a>
		</ul>
		<div class="row">
			<%
				/*计算起始序号*/
				int startIndex = (currentPage -1) * 5;
				/*遍历记录*/
				for(int i=0;i<projectList.size();i++) {
            		int currentIndex = startIndex + i + 1; //当前记录的序号
            		Project project = projectList.get(i); //获取到项目对象
            		String clearLeft = "";
            		if(i%4 == 0) clearLeft = "style=\"clear:left;\"";
			%>
			<div class="col-md-3 bottom15" <%=clearLeft %>>
			  <a  href="<%=basePath  %>Project/<%=project.getProjectId() %>/frontshow"><img class="img-responsive" src="<%=basePath%><%=project.getProjectPhoto()%>" /></a>
			     <div class="showFields">
			     	<div class="field">
	            		项目id:<%=project.getProjectId() %>
			     	</div>
			     	<div class="field">
	            		项目类型:<%=project.getProjectTypeObj().getProjectTypeName() %>
			     	</div>
			     	<div class="field">
	            		项目名称:<%=project.getProjectName() %>
			     	</div>
			     	<div class="field">
	            		负责人:<%=project.getMainPerson() %>
			     	</div>
			     	<div class="field">
	            		项目来源:<%=project.getComeFrom() %>
			     	</div>
			     	<div class="field">
	            		科研代号:<%=project.getKydh() %>
			     	</div>
			     	<div class="field">
	            		开始日期:<%=project.getStartDate() %>
			     	</div>
			     	<div class="field">
	            		结束日期:<%=project.getEndDate() %>
			     	</div>
			     	<div class="field">
	            		科研资金:<%=project.getKyMoney() %>
			     	</div>
			     	<div class="field">
	            		提交用户:<%=project.getUserObj().getName() %>
			     	</div>
			     	<div class="field">
	            		审核状态:<%=project.getShzt() %>
			     	</div>
			        <a class="btn btn-primary top5" href="<%=basePath %>Project/<%=project.getProjectId() %>/frontshow">详情</a>
			        <a class="btn btn-primary top5" onclick="projectEdit('<%=project.getProjectId() %>');" style="display:none;">修改</a>
			        <a class="btn btn-primary top5" onclick="projectDelete('<%=project.getProjectId() %>');" style="display:none;">删除</a>
			     </div>
			</div>
			<%  } %>

			<div class="row">
				<div class="col-md-12">
					<nav class="pull-left">
						<ul class="pagination">
							<li><a href="#" onclick="GoToPage(<%=currentPage-1 %>,<%=totalPage %>);" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
							<%
								int startPage = currentPage - 5;
								int endPage = currentPage + 5;
								if(startPage < 1) startPage=1;
								if(endPage > totalPage) endPage = totalPage;
								for(int i=startPage;i<=endPage;i++) {
							%>
							<li class="<%= currentPage==i?"active":"" %>"><a href="#"  onclick="GoToPage(<%=i %>,<%=totalPage %>);"><%=i %></a></li>
							<%  } %> 
							<li><a href="#" onclick="GoToPage(<%=currentPage+1 %>,<%=totalPage %>);"><span aria-hidden="true">&raquo;</span></a></li>
						</ul>
					</nav>
					<div class="pull-right" style="line-height:75px;" >共有<%=recordNumber %>条记录，当前第 <%=currentPage %>/<%=totalPage %> 页</div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-md-3 wow fadeInRight">
		<div class="page-header">
    		<h1>项目查询</h1>
		</div>
		<form name="projectQueryForm" id="projectQueryForm" action="<%=basePath %>Project/frontlist" class="mar_t15" method="post">
            <div class="form-group">
            	<label for="projectTypeObj_projectTypeId">项目类型：</label>
                <select id="projectTypeObj_projectTypeId" name="projectTypeObj.projectTypeId" class="form-control">
                	<option value="0">不限制</option>
	 				<%
	 				for(ProjectType projectTypeTemp:projectTypeList) {
	 					String selected = "";
 					if(projectTypeObj!=null && projectTypeObj.getProjectTypeId()!=null && projectTypeObj.getProjectTypeId().intValue()==projectTypeTemp.getProjectTypeId().intValue())
 						selected = "selected";
	 				%>
 				 <option value="<%=projectTypeTemp.getProjectTypeId() %>" <%=selected %>><%=projectTypeTemp.getProjectTypeName() %></option>
	 				<%
	 				}
	 				%>
 			</select>
            </div>
			<div class="form-group">
				<label for="projectName">项目名称:</label>
				<input type="text" id="projectName" name="projectName" value="<%=projectName %>" class="form-control" placeholder="请输入项目名称">
			</div>
			<div class="form-group">
				<label for="mainPerson">负责人:</label>
				<input type="text" id="mainPerson" name="mainPerson" value="<%=mainPerson %>" class="form-control" placeholder="请输入负责人">
			</div>
			<div class="form-group">
				<label for="startDate">开始日期:</label>
				<input type="text" id="startDate" name="startDate" class="form-control"  placeholder="请选择开始日期" value="<%=startDate %>" onclick="SelectDate(this,'yyyy-MM-dd')" />
			</div>
            <div class="form-group">
            	<label for="userObj_user_name">提交用户：</label>
                <select id="userObj_user_name" name="userObj.user_name" class="form-control">
                	<option value="">不限制</option>
	 				<%
	 				for(UserInfo userInfoTemp:userInfoList) {
	 					String selected = "";
 					if(userObj!=null && userObj.getUser_name()!=null && userObj.getUser_name().equals(userInfoTemp.getUser_name()))
 						selected = "selected";
	 				%>
 				 <option value="<%=userInfoTemp.getUser_name() %>" <%=selected %>><%=userInfoTemp.getName() %></option>
	 				<%
	 				}
	 				%>
 			</select>
            </div>
			<div class="form-group">
				<label for="shzt">审核状态:</label>
				<input type="text" id="shzt" name="shzt" value="<%=shzt %>" class="form-control" placeholder="请输入审核状态">
			</div>
			<div class="form-group">
				<label for="shr">审核人:</label>
				<input type="text" id="shr" name="shr" value="<%=shr %>" class="form-control" placeholder="请输入审核人">
			</div>
            <input type=hidden name=currentPage value="<%=currentPage %>" />
            <button type="submit" class="btn btn-primary">查询</button>
        </form>
	</div>

		</div>
</div>
<div id="projectEditDialog" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" style="width:900px;" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><i class="fa fa-edit"></i>&nbsp;项目信息编辑</h4>
      </div>
      <div class="modal-body" style="height:450px; overflow: scroll;">
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
			 	<textarea name="project.projectDesc" id="project_projectDesc_edit" style="width:100%;height:500px;"></textarea>
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
		</form> 
	    <style>#projectEditForm .form-group {margin-bottom:5px;}  </style>
      </div>
      <div class="modal-footer"> 
      	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      	<button type="button" class="btn btn-primary" onclick="ajaxProjectModify();">提交</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
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
//实例化编辑器
var project_projectDesc_edit = UE.getEditor('project_projectDesc_edit'); //项目介绍编辑器
var basePath = "<%=basePath%>";
/*跳转到查询结果的某页*/
function GoToPage(currentPage,totalPage) {
    if(currentPage==0) return;
    if(currentPage>totalPage) return;
    document.projectQueryForm.currentPage.value = currentPage;
    document.projectQueryForm.submit();
}

/*可以直接跳转到某页*/
function changepage(totalPage)
{
    var pageValue=document.projectQueryForm.pageValue.value;
    if(pageValue>totalPage) {
        alert('你输入的页码超出了总页数!');
        return ;
    }
    document.projectQueryForm.currentPage.value = pageValue;
    documentprojectQueryForm.submit();
}

/*弹出修改项目界面并初始化数据*/
function projectEdit(projectId) {
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
				project_projectDesc_edit.setContent(project.projectDesc, false);
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
				$('#projectEditDialog').modal('show');
			} else {
				alert("获取信息失败！");
			}
		}
	});
}

/*删除项目信息*/
function projectDelete(projectId) {
	if(confirm("确认删除这个记录")) {
		$.ajax({
			type : "POST",
			url : basePath + "Project/deletes",
			data : {
				projectIds : projectId,
			},
			success : function (obj) {
				if (obj.success) {
					alert("删除成功");
					$("#projectQueryForm").submit();
					//location.href= basePath + "Project/frontlist";
				}
				else 
					alert(obj.message);
			},
		});
	}
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
})
</script>
</body>
</html>

