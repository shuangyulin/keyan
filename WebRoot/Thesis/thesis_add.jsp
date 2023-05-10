<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/thesis.css" />
<div id="thesisAddDiv">
	<form id="thesisAddForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">学科门类:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="thesis_xkml" name="thesis.xkml" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">论文名称:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="thesis_name" name="thesis.name" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">论文封面图:</span>
			<span class="inputControl">
				<input id="lwfmFile" name="lwfmFile" type="file" size="50" />
			</span>
		</div>
		<div>
			<span class="label">作者:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="thesis_author" name="thesis.author" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">指导老师:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="thesis_teacher" name="thesis.teacher" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">发布日期:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="thesis_publishDate" name="thesis.publishDate" />

			</span>

		</div>
		<div>
			<span class="label">论文介绍:</span>
			<span class="inputControl">
				<script name="thesis.thesisDesc" id="thesis_thesisDesc" type="text/plain"   style="width:750px;height:500px;"></script>
			</span>

		</div>
		<div>
			<span class="label">论文文件:</span>
			<span class="inputControl">
				<input id="thesisFileFile" name="thesisFileFile" type="file" size="50" />
			</span>
		</div>
		<div>
			<span class="label">修改意见:</span>
			<span class="inputControl">
				<textarea id="thesis_xgyj" name="thesis.xgyj" rows="6" cols="80"></textarea>

			</span>

		</div>
		<div>
			<span class="label">提交用户:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="thesis_userObj_user_name" name="thesis.userObj.user_name" style="width: auto"/>
			</span>
		</div>
		<div class="operation">
			<a id="thesisAddButton" class="easyui-linkbutton">添加</a>
			<a id="thesisClearButton" class="easyui-linkbutton">重填</a>
		</div> 
	</form>
</div>
<script src="${pageContext.request.contextPath}/Thesis/js/thesis_add.js"></script> 
