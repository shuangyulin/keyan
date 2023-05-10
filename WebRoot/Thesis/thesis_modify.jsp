<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/thesis.css" />
<div id="thesis_editDiv">
	<form id="thesisEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">论文id:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="thesis_thesisId_edit" name="thesis.thesisId" value="<%=request.getParameter("thesisId") %>" style="width:200px" />
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
				<script id="thesis_thesisDesc_edit" name="thesis.thesisDesc" type="text/plain"   style="width:750px;height:500px;"></script>

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
		<div class="operation">
			<a id="thesisModifyButton" class="easyui-linkbutton">更新</a> 
		</div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/Thesis/js/thesis_modify.js"></script> 
