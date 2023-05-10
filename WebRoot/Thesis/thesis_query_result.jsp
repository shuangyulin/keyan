<%@ page language="java"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/thesis.css" /> 

<div id="thesis_manage"></div>
<div id="thesis_manage_tool" style="padding:5px;">
	<div style="margin-bottom:5px;">
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit-new" plain="true" onclick="thesis_manage_tool.edit();">修改</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-delete-new" plain="true" onclick="thesis_manage_tool.remove();">删除</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true"  onclick="thesis_manage_tool.reload();">刷新</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onclick="thesis_manage_tool.redo();">取消选择</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-export" plain="true" onclick="thesis_manage_tool.exportExcel();">导出到excel</a>
	</div>
	<div style="padding:0 0 0 7px;color:#333;">
		<form id="thesisQueryForm" method="post">
			作者：<input type="text" class="textbox" id="author" name="author" style="width:110px" />
			指导老师：<input type="text" class="textbox" id="teacher" name="teacher" style="width:110px" />
			发布日期：<input type="text" id="publishDate" name="publishDate" class="easyui-datebox" editable="false" style="width:100px">
			提交用户：<input class="textbox" type="text" id="userObj_user_name_query" name="userObj.user_name" style="width: auto"/>
			学科门类：<input type="text" class="textbox" id="xkml" name="xkml" style="width:110px" />
			论文名称：<input type="text" class="textbox" id="name" name="name" style="width:110px" />
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="thesis_manage_tool.search();">查询</a>
		</form>	
	</div>
</div>

<div id="thesisEditDiv">
	<form id="thesisEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">论文id:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="thesis_thesisId_edit" name="thesis.thesisId" style="width:200px" />
			</span>
		</div>
		<div>
			<span class="label">学科门类:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="thesis_xkml_edit" name="thesis.xkml" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">论文名称:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="thesis_name_edit" name="thesis.name" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">论文封面图:</span>
			<span class="inputControl">
				<img id="thesis_lwfmImg" width="200px" border="0px"/><br/>
    			<input type="hidden" id="thesis_lwfm" name="thesis.lwfm"/>
				<input id="lwfmFile" name="lwfmFile" type="file" size="50" />
			</span>
		</div>
		<div>
			<span class="label">作者:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="thesis_author_edit" name="thesis.author" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">指导老师:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="thesis_teacher_edit" name="thesis.teacher" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">发布日期:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="thesis_publishDate_edit" name="thesis.publishDate" />

			</span>

		</div>
		<div>
			<span class="label">论文介绍:</span>
			<span class="inputControl">
				<script name="thesis.thesisDesc" id="thesis_thesisDesc_edit" type="text/plain"   style="width:100%;height:500px;"></script>

			</span>

		</div>
		<div>
			<span class="label">论文文件:</span>
			<span class="inputControl">
				<a id="thesis_thesisFileA" style="color:red;margin-bottom:5px;">查看</a>&nbsp;&nbsp;
    			<input type="hidden" id="thesis_thesisFile" name="thesis.thesisFile"/>
				<input id="thesisFileFile" name="thesisFileFile" value="重新选择文件" type="file" size="50" />
			</span>
		</div>
		<div>
			<span class="label">修改意见:</span>
			<span class="inputControl">
				<textarea id="thesis_xgyj_edit" name="thesis.xgyj" rows="8" cols="60"></textarea>

			</span>

		</div>
		<div>
			<span class="label">提交用户:</span>
			<span class="inputControl">
				<input class="textbox"  id="thesis_userObj_user_name_edit" name="thesis.userObj.user_name" style="width: auto"/>
			</span>
		</div>
	</form>
</div>
<script>
//实例化编辑器
//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
var thesis_thesisDesc_editor = UE.getEditor('thesis_thesisDesc_edit'); //论文介绍编辑器
</script>
<script type="text/javascript" src="Thesis/js/thesis_manage.js"></script> 
