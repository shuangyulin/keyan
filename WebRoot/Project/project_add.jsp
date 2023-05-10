<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/project.css" />
<div id="projectAddDiv">
	<form id="projectAddForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">项目类型:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_projectTypeObj_projectTypeId" name="project.projectTypeObj.projectTypeId" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">项目名称:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_projectName" name="project.projectName" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">项目主图:</span>
			<span class="inputControl">
				<input id="projectPhotoFile" name="projectPhotoFile" type="file" size="50" />
			</span>
		</div>
		<div>
			<span class="label">负责人:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_mainPerson" name="project.mainPerson" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">项目来源:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_comeFrom" name="project.comeFrom" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">科研代号:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_kydh" name="project.kydh" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">开始日期:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_startDate" name="project.startDate" />

			</span>

		</div>
		<div>
			<span class="label">结束日期:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_endDate" name="project.endDate" />

			</span>

		</div>
		<div>
			<span class="label">科研资金:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_kyMoney" name="project.kyMoney" style="width:80px" />

			</span>

		</div>
		<div>
			<span class="label">项目介绍:</span>
			<span class="inputControl">
				<script name="project.projectDesc" id="project_projectDesc" type="text/plain"   style="width:750px;height:500px;"></script>
			</span>

		</div>
		<div>
			<span class="label">提交用户:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_userObj_user_name" name="project.userObj.user_name" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">审核状态:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_shzt" name="project.shzt" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">审核人:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_shr" name="project.shr" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">审核时间:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_shsj" name="project.shsj" style="width:200px" />

			</span>

		</div>
		<div class="operation">
			<a id="projectAddButton" class="easyui-linkbutton">添加</a>
			<a id="projectClearButton" class="easyui-linkbutton">重填</a>
		</div> 
	</form>
</div>
<script src="${pageContext.request.contextPath}/Project/js/project_add.js"></script> 
