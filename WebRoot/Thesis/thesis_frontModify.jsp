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
  <TITLE>修改论文信息</TITLE>
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
  		<li class="active">论文信息修改</li>
	</ul>
		<div class="row"> 
      	<form class="form-horizontal" name="thesisEditForm" id="thesisEditForm" enctype="multipart/form-data" method="post"  class="mar_t15">
		  <div class="form-group">
			 <label for="thesis_thesisId_edit" class="col-md-3 text-right">论文id:</label>
			 <div class="col-md-9"> 
			 	<input type="text" id="thesis_thesisId_edit" name="thesis.thesisId" class="form-control" placeholder="请输入论文id" readOnly>
			 </div>
		  </div> 
		  <div class="form-group">
		  	 <label for="thesis_xkml_edit" class="col-md-3 text-right">学科门类:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="thesis_xkml_edit" name="thesis.xkml" class="form-control" placeholder="请输入学科门类">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="thesis_name_edit" class="col-md-3 text-right">论文名称:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="thesis_name_edit" name="thesis.name" class="form-control" placeholder="请输入论文名称">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="thesis_lwfm_edit" class="col-md-3 text-right">论文封面图:</label>
		  	 <div class="col-md-9">
			    <img  class="img-responsive" id="thesis_lwfmImg" border="0px"/><br/>
			    <input type="hidden" id="thesis_lwfm" name="thesis.lwfm"/>
			    <input id="lwfmFile" name="lwfmFile" type="file" size="50" />
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="thesis_author_edit" class="col-md-3 text-right">作者:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="thesis_author_edit" name="thesis.author" class="form-control" placeholder="请输入作者">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="thesis_teacher_edit" class="col-md-3 text-right">指导老师:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="thesis_teacher_edit" name="thesis.teacher" class="form-control" placeholder="请输入指导老师">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="thesis_publishDate_edit" class="col-md-3 text-right">发布日期:</label>
		  	 <div class="col-md-9">
                <div class="input-group date thesis_publishDate_edit col-md-12" data-link-field="thesis_publishDate_edit" data-link-format="yyyy-mm-dd">
                    <input class="form-control" id="thesis_publishDate_edit" name="thesis.publishDate" size="16" type="text" value="" placeholder="请选择发布日期" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="thesis_thesisDesc_edit" class="col-md-3 text-right">论文介绍:</label>
		  	 <div class="col-md-9">
			    <script name="thesis.thesisDesc" id="thesis_thesisDesc_edit" type="text/plain"   style="width:100%;height:500px;"></script>
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="thesis_thesisFile_edit" class="col-md-3 text-right">论文文件:</label>
		  	 <div class="col-md-9">
			    <a id="thesis_thesisFileImg" width="200px" border="0px"></a><br/>
			    <input type="hidden" id="thesis_thesisFile" name="thesis.thesisFile"/>
			    <input id="thesisFileFile" name="thesisFileFile" type="file" size="50" />
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="thesis_xgyj_edit" class="col-md-3 text-right">修改意见:</label>
		  	 <div class="col-md-9">
			    <textarea id="thesis_xgyj_edit" name="thesis.xgyj" rows="8" class="form-control" placeholder="请输入修改意见"></textarea>
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="thesis_userObj_user_name_edit" class="col-md-3 text-right">提交用户:</label>
		  	 <div class="col-md-9">
			    <select id="thesis_userObj_user_name_edit" name="thesis.userObj.user_name" class="form-control">
			    </select>
		  	 </div>
		  </div>
			  <div class="form-group">
			  	<span class="col-md-3""></span>
			  	<span onclick="ajaxThesisModify();" class="btn btn-primary bottom5 top5">修改</span>
			  </div>
		</form> 
	    <style>#thesisEditForm .form-group {margin-bottom:5px;}  </style>
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
var thesis_thesisDesc_editor = UE.getEditor('thesis_thesisDesc_edit'); //论文介绍编辑框
var basePath = "<%=basePath%>";
/*弹出修改论文界面并初始化数据*/
function thesisEdit(thesisId) {
  thesis_thesisDesc_editor.addListener("ready", function () {
    // editor准备好之后才可以使用 
    ajaxModifyQuery(thesisId);
  });
}
 function ajaxModifyQuery(thesisId) {
	$.ajax({
		url :  basePath + "Thesis/" + thesisId + "/update",
		type : "get",
		dataType: "json",
		success : function (thesis, response, status) {
			if (thesis) {
				$("#thesis_thesisId_edit").val(thesis.thesisId);
				$("#thesis_xkml_edit").val(thesis.xkml);
				$("#thesis_name_edit").val(thesis.name);
				$("#thesis_lwfm").val(thesis.lwfm);
				$("#thesis_lwfmImg").attr("src", basePath +　thesis.lwfm);
				$("#thesis_author_edit").val(thesis.author);
				$("#thesis_teacher_edit").val(thesis.teacher);
				$("#thesis_publishDate_edit").val(thesis.publishDate);
				thesis_thesisDesc_editor.setContent(thesis.thesisDesc, false);
				$("#thesis_thesisFileA").val(thesis.thesisFile);
				$("#thesis_thesisFileA").attr("href", basePath +　thesis.thesisFile);
				$("#thesis_xgyj_edit").val(thesis.xgyj);
				$.ajax({
					url: basePath + "UserInfo/listAll",
					type: "get",
					success: function(userInfos,response,status) { 
						$("#thesis_userObj_user_name_edit").empty();
						var html="";
		        		$(userInfos).each(function(i,userInfo){
		        			html += "<option value='" + userInfo.user_name + "'>" + userInfo.name + "</option>";
		        		});
		        		$("#thesis_userObj_user_name_edit").html(html);
		        		$("#thesis_userObj_user_name_edit").val(thesis.userObjPri);
					}
				});
			} else {
				alert("获取信息失败！");
			}
		}
	});
}

/*ajax方式提交论文信息表单给服务器端修改*/
function ajaxThesisModify() {
	$.ajax({
		url :  basePath + "Thesis/" + $("#thesis_thesisId_edit").val() + "/update",
		type : "post",
		dataType: "json",
		data: new FormData($("#thesisEditForm")[0]),
		success : function (obj, response, status) {
            if(obj.success){
                alert("信息修改成功！");
                location.reload(true);
                $("#thesisQueryForm").submit();
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
    /*发布日期组件*/
    $('.thesis_publishDate_edit').datetimepicker({
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
    thesisEdit("<%=request.getParameter("thesisId")%>");
 })
 </script> 
</body>
</html>

