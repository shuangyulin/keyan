<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/projectType.css" />
<div id="projectTypeAddDiv">
	<form id="projectTypeAddForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">项目性质名称:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="projectType_projectTypeName" name="projectType.projectTypeName" style="width:200px" />

			</span>

		</div>
		<div class="operation">
			<a id="projectTypeAddButton" class="easyui-linkbutton">添加</a>
			<a id="projectTypeClearButton" class="easyui-linkbutton">重填</a>
		</div> 
	</form>
</div>
<script src="${pageContext.request.contextPath}/ProjectType/js/projectType_add.js"></script> 
