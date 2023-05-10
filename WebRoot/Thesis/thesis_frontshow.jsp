<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.Thesis" %>
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //获取所有的userObj信息
    List<UserInfo> userInfoList = (List<UserInfo>)request.getAttribute("userInfoList");
    Thesis thesis = (Thesis)request.getAttribute("thesis");

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
  <TITLE>查看论文详情</TITLE>
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
  		<li><a href="<%=basePath %>Thesis/frontlist">论文信息</a></li>
  		<li class="active">详情查看</li>
	</ul>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">论文id:</div>
		<div class="col-md-10 col-xs-6"><%=thesis.getThesisId()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">学科门类:</div>
		<div class="col-md-10 col-xs-6"><%=thesis.getXkml()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">论文名称:</div>
		<div class="col-md-10 col-xs-6"><%=thesis.getName()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">论文封面图:</div>
		<div class="col-md-10 col-xs-6"><img class="img-responsive" src="<%=basePath %><%=thesis.getLwfm() %>"  border="0px"/></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">作者:</div>
		<div class="col-md-10 col-xs-6"><%=thesis.getAuthor()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">指导老师:</div>
		<div class="col-md-10 col-xs-6"><%=thesis.getTeacher()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">发布日期:</div>
		<div class="col-md-10 col-xs-6"><%=thesis.getPublishDate()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">论文介绍:</div>
		<div class="col-md-10 col-xs-6"><%=thesis.getThesisDesc()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">论文文件:</div>
		<div class="col-md-10 col-xs-6"><a href="<%=basePath%><%=thesis.getThesisFile()%>" target="_blank"><%=thesis.getThesisFile()%></a></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">修改意见:</div>
		<div class="col-md-10 col-xs-6"><%=thesis.getXgyj()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">提交用户:</div>
		<div class="col-md-10 col-xs-6"><%=thesis.getUserObj().getName() %></div>
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

