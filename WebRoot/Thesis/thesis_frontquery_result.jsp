<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.Thesis" %>
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    List<Thesis> thesisList = (List<Thesis>)request.getAttribute("thesisList");
    //获取所有的userObj信息
    List<UserInfo> userInfoList = (List<UserInfo>)request.getAttribute("userInfoList");
    int currentPage =  (Integer)request.getAttribute("currentPage"); //当前页
    int totalPage =   (Integer)request.getAttribute("totalPage");  //一共多少页
    int recordNumber =   (Integer)request.getAttribute("recordNumber");  //一共多少记录
    String author = (String)request.getAttribute("author"); //作者查询关键字
    String teacher = (String)request.getAttribute("teacher"); //指导老师查询关键字
    String publishDate = (String)request.getAttribute("publishDate"); //发布日期查询关键字
    UserInfo userObj = (UserInfo)request.getAttribute("userObj");
    String xkml = (String)request.getAttribute("xkml"); //学科门类查询关键字
    String name = (String)request.getAttribute("name"); //论文名称查询关键字
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
<title>论文查询</title>
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
  			<li><a href="<%=basePath %>Thesis/frontlist">论文信息列表</a></li>
  			<li class="active">查询结果显示</li>
  			<a class="pull-right" href="<%=basePath %>Thesis/thesis_frontAdd.jsp" style="display:none;">添加论文</a>
		</ul>
		<div class="row">
			<%
				/*计算起始序号*/
				int startIndex = (currentPage -1) * 5;
				/*遍历记录*/
				for(int i=0;i<thesisList.size();i++) {
            		int currentIndex = startIndex + i + 1; //当前记录的序号
            		Thesis thesis = thesisList.get(i); //获取到论文对象
            		String clearLeft = "";
            		if(i%4 == 0) clearLeft = "style=\"clear:left;\"";
			%>
			<div class="col-md-3 bottom15" <%=clearLeft %>>
			  <a  href="<%=basePath  %>Thesis/<%=thesis.getThesisId() %>/frontshow"><img class="img-responsive" src="<%=basePath%><%=thesis.getLwfm()%>" /></a>
			     <div class="showFields">
			     	<div class="field">
	            		论文id:<%=thesis.getThesisId() %>
			     	</div>
			     	<div class="field">
	            		学科门类:<%=thesis.getXkml() %>
			     	</div>
			     	<div class="field">
	            		论文名称:<%=thesis.getName() %>
			     	</div>
			     	<div class="field">
	            		作者:<%=thesis.getAuthor() %>
			     	</div>
			     	<div class="field">
	            		指导老师:<%=thesis.getTeacher() %>
			     	</div>
			     	<div class="field">
	            		发布日期:<%=thesis.getPublishDate() %>
			     	</div>
			     	<div class="field">
	            		论文文件:<%=thesis.getThesisFile().equals("")?"暂无文件":"<a href='" + basePath + thesis.getThesisFile() + "' target='_blank'>" + thesis.getThesisFile() + "</a>"%>
			     	</div>
			     	<div class="field">
	            		提交用户:<%=thesis.getUserObj().getName() %>
			     	</div>
			        <a class="btn btn-primary top5" href="<%=basePath %>Thesis/<%=thesis.getThesisId() %>/frontshow">详情</a>
			        <a class="btn btn-primary top5" onclick="thesisEdit('<%=thesis.getThesisId() %>');" style="display:none;">修改</a>
			        <a class="btn btn-primary top5" onclick="thesisDelete('<%=thesis.getThesisId() %>');" style="display:none;">删除</a>
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
    		<h1>论文查询</h1>
		</div>
		<form name="thesisQueryForm" id="thesisQueryForm" action="<%=basePath %>Thesis/frontlist" class="mar_t15" method="post">
			<div class="form-group">
				<label for="author">作者:</label>
				<input type="text" id="author" name="author" value="<%=author %>" class="form-control" placeholder="请输入作者">
			</div>
			<div class="form-group">
				<label for="teacher">指导老师:</label>
				<input type="text" id="teacher" name="teacher" value="<%=teacher %>" class="form-control" placeholder="请输入指导老师">
			</div>
			<div class="form-group">
				<label for="publishDate">发布日期:</label>
				<input type="text" id="publishDate" name="publishDate" class="form-control"  placeholder="请选择发布日期" value="<%=publishDate %>" onclick="SelectDate(this,'yyyy-MM-dd')" />
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
				<label for="xkml">学科门类:</label>
				<input type="text" id="xkml" name="xkml" value="<%=xkml %>" class="form-control" placeholder="请输入学科门类">
			</div>
			<div class="form-group">
				<label for="name">论文名称:</label>
				<input type="text" id="name" name="name" value="<%=name %>" class="form-control" placeholder="请输入论文名称">
			</div>
            <input type=hidden name=currentPage value="<%=currentPage %>" />
            <button type="submit" class="btn btn-primary">查询</button>
        </form>
	</div>

		</div>
</div>
<div id="thesisEditDialog" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" style="width:900px;" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><i class="fa fa-edit"></i>&nbsp;论文信息编辑</h4>
      </div>
      <div class="modal-body" style="height:450px; overflow: scroll;">
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
			 	<textarea name="thesis.thesisDesc" id="thesis_thesisDesc_edit" style="width:100%;height:500px;"></textarea>
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="thesis_thesisFile_edit" class="col-md-3 text-right">论文文件:</label>
		  	 <div class="col-md-9">
			    <a id="thesis_thesisFileA" target="_blank"></a><br/>
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
		</form> 
	    <style>#thesisEditForm .form-group {margin-bottom:5px;}  </style>
      </div>
      <div class="modal-footer"> 
      	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      	<button type="button" class="btn btn-primary" onclick="ajaxThesisModify();">提交</button>
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
var thesis_thesisDesc_edit = UE.getEditor('thesis_thesisDesc_edit'); //论文介绍编辑器
var basePath = "<%=basePath%>";
/*跳转到查询结果的某页*/
function GoToPage(currentPage,totalPage) {
    if(currentPage==0) return;
    if(currentPage>totalPage) return;
    document.thesisQueryForm.currentPage.value = currentPage;
    document.thesisQueryForm.submit();
}

/*可以直接跳转到某页*/
function changepage(totalPage)
{
    var pageValue=document.thesisQueryForm.pageValue.value;
    if(pageValue>totalPage) {
        alert('你输入的页码超出了总页数!');
        return ;
    }
    document.thesisQueryForm.currentPage.value = pageValue;
    documentthesisQueryForm.submit();
}

/*弹出修改论文界面并初始化数据*/
function thesisEdit(thesisId) {
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
				thesis_thesisDesc_edit.setContent(thesis.thesisDesc, false);
				$("#thesis_thesisFile").val(thesis.thesisFile);
				$("#thesis_thesisFileA").text(thesis.thesisFile);
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
				$('#thesisEditDialog').modal('show');
			} else {
				alert("获取信息失败！");
			}
		}
	});
}

/*删除论文信息*/
function thesisDelete(thesisId) {
	if(confirm("确认删除这个记录")) {
		$.ajax({
			type : "POST",
			url : basePath + "Thesis/deletes",
			data : {
				thesisIds : thesisId,
			},
			success : function (obj) {
				if (obj.success) {
					alert("删除成功");
					$("#thesisQueryForm").submit();
					//location.href= basePath + "Thesis/frontlist";
				}
				else 
					alert(obj.message);
			},
		});
	}
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
})
</script>
</body>
</html>

