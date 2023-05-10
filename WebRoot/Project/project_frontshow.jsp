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
  <TITLE>查看项目详情</TITLE>
  <link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/animate.css" rel="stylesheet"> 
</head>
<body style="margin-top:70px;"> 
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
	<ul class="breadcrumb">
  		<li><a href="<%=basePath %>index.jsp">首页</a></li>
  		<li><a href="<%=basePath %>Project/frontlist">项目信息</a></li>
  		<li class="active">详情查看</li>
	</ul>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">项目id:</div>
		<div class="col-md-10 col-xs-6"><%=project.getProjectId()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">项目类型:</div>
		<div class="col-md-10 col-xs-6"><%=project.getProjectTypeObj().getProjectTypeName() %></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">项目名称:</div>
		<div class="col-md-10 col-xs-6"><%=project.getProjectName()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">项目主图:</div>
		<div class="col-md-10 col-xs-6"><img class="img-responsive" src="<%=basePath %><%=project.getProjectPhoto() %>"  border="0px"/></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">负责人:</div>
		<div class="col-md-10 col-xs-6"><%=project.getMainPerson()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">项目来源:</div>
		<div class="col-md-10 col-xs-6"><%=project.getComeFrom()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">科研代号:</div>
		<div class="col-md-10 col-xs-6"><%=project.getKydh()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">开始日期:</div>
		<div class="col-md-10 col-xs-6"><%=project.getStartDate()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">结束日期:</div>
		<div class="col-md-10 col-xs-6"><%=project.getEndDate()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">科研资金:</div>
		<div class="col-md-10 col-xs-6"><%=project.getKyMoney()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">项目介绍:</div>
		<div class="col-md-10 col-xs-6"><%=project.getProjectDesc()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">提交用户:</div>
		<div class="col-md-10 col-xs-6"><%=project.getUserObj().getName() %></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">审核状态:</div>
		<div class="col-md-10 col-xs-6"><%=project.getShzt()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">审核人:</div>
		<div class="col-md-10 col-xs-6"><%=project.getShr()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">审核时间:</div>
		<div class="col-md-10 col-xs-6"><%=project.getShsj()%></div>
	</div>
	<div class="row bottom15">
		<div class="col-md-2 col-xs-4"></div>
		<div class="col-md-6 col-xs-6">
			<button onclick="history.back();" class="btn btn-primary">返回</button>
		</div>
	</div>
</div> 
<jsp:include page="../footer.jsp"></jsp:include>
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script>
var basePath = "<%=basePath%>";
$(function(){
        /*小屏幕导航点击关闭菜单*/
        $('.navbar-collapse a').click(function(){
            $('.navbar-collapse').collapse('hide');
        });
        new WOW().init();
 })
 </script> 
</body>
</html>

