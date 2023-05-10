<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/project.css" />
<div id="project_editDiv">
	<form id="projectEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">项目id:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_projectId_edit" name="project.projectId" value="<%=request.getParameter("projectId") %>" style="width:200px" />
			</span>
		</div>

		<div>
			<span class="label">项目类型:</span>
			<span class="inputControl">
				<input class="textbox"  id="project_projectTypeObj_projectTypeId_edit" name="project.projectTypeObj.projectTypeId" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">项目名称:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_projectName_edit" name="project.projectName" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">项目主图:</span>
			<span class="inputControl">
				<img id="project_projectPhotoImg" width="200px" border="0px"/><br/>
    			<input type="hidden" id="project_projectPhoto" name="project.projectPhoto"/>
				<input id="projectPhotoFile" name="projectPhotoFile" type="file" size="50" />
			</span>
		</div>
		<div>
			<span class="label">负责人:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_mainPerson_edit" name="project.mainPerson" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">项目来源:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_comeFrom_edit" name="project.comeFrom" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">科研代号:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_kydh_edit" name="project.kydh" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">开始日期:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_startDate_edit" name="project.startDate" />

			</span>

		</div>
		<div>
			<span class="label">结束日期:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_endDate_edit" name="project.endDate" />

			</span>

		</div>
		<div>
			<span class="label">科研资金:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_kyMoney_edit" name="project.kyMoney" style="width:80px" />

			</span>

		</div>
		<div>
			<span class="label">项目介绍:</span>
			<span class="inputControl">
				<script id="project_projectDesc_edit" name="project.projectDesc" type="text/plain"   style="width:750px;height:500px;"></script>

			</span>

		</div>
		<div>
			<span class="label">提交用户:</span>
			<span class="inputControl">
				<input class="textbox"  id="project_userObj_user_name_edit" name="project.userObj.user_name" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">审核状态:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_shzt_edit" name="project.shzt" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">审核人:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_shr_edit" name="project.shr" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">审核时间:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_shsj_edit" name="project.shsj" style="width:200px" />

			</span>

		</div>
		<div class="operation">
			<a id="projectModifyButton" class="easyui-linkbutton">更新</a> 
		</div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/Project/js/project_modify.js"></script> 
