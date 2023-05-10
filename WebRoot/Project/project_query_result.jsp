<%@ page language="java"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/project.css" /> 

<div id="project_manage"></div>
<div id="project_manage_tool" style="padding:5px;">
	<div style="margin-bottom:5px;">
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit-new" plain="true" onclick="project_manage_tool.edit();">修改</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-delete-new" plain="true" onclick="project_manage_tool.remove();">删除</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true"  onclick="project_manage_tool.reload();">刷新</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onclick="project_manage_tool.redo();">取消选择</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-export" plain="true" onclick="project_manage_tool.exportExcel();">导出到excel</a>
	</div>
	<div style="padding:0 0 0 7px;color:#333;">
		<form id="projectQueryForm" method="post">
			项目类型：<input class="textbox" type="text" id="projectTypeObj_projectTypeId_query" name="projectTypeObj.projectTypeId" style="width: auto"/>
			项目名称：<input type="text" class="textbox" id="projectName" name="projectName" style="width:110px" />
			负责人：<input type="text" class="textbox" id="mainPerson" name="mainPerson" style="width:110px" />
			开始日期：<input type="text" id="startDate" name="startDate" class="easyui-datebox" editable="false" style="width:100px">
			提交用户：<input class="textbox" type="text" id="userObj_user_name_query" name="userObj.user_name" style="width: auto"/>
			审核状态：<input type="text" class="textbox" id="shzt" name="shzt" style="width:110px" />
			审核人：<input type="text" class="textbox" id="shr" name="shr" style="width:110px" />
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="project_manage_tool.search();">查询</a>
		</form>	
	</div>
</div>

<div id="projectEditDiv">
	<form id="projectEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">项目id:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="project_projectId_edit" name="project.projectId" style="width:200px" />
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
				<script name="project.projectDesc" id="project_projectDesc_edit" type="text/plain"   style="width:100%;height:500px;"></script>

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
	</form>
</div>
<script>
//实例化编辑器
//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
var project_projectDesc_editor = UE.getEditor('project_projectDesc_edit'); //项目介绍编辑器
</script>
<script type="text/javascript" src="Project/js/project_manage.js"></script> 
