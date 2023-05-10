<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/projectType.css" />
<div id="projectType_editDiv">
	<form id="projectTypeEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">项目性质id:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="projectType_projectTypeId_edit" name="projectType.projectTypeId" value="<%=request.getParameter("projectTypeId") %>" style="width:200px" />
			</span>
		</div>

		<div>
			<span class="label">项目性质名称:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="projectType_projectTypeName_edit" name="projectType.projectTypeName" style="width:200px" />

			</span>

		</div>
		<div class="operation">
			<a id="projectTypeModifyButton" class="easyui-linkbutton">更新</a> 
		</div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/ProjectType/js/projectType_modify.js"></script> 
