package com.chengxusheji.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;
import com.chengxusheji.po.Project;

public interface ProjectMapper {
	/*添加项目信息*/
	public void addProject(Project project) throws Exception;

	/*按照查询条件分页查询项目记录*/
	public ArrayList<Project> queryProject(@Param("where") String where,@Param("startIndex") int startIndex,@Param("pageSize") int pageSize) throws Exception;

	/*按照查询条件查询所有项目记录*/
	public ArrayList<Project> queryProjectList(@Param("where") String where) throws Exception;

	/*按照查询条件的项目记录数*/
	public int queryProjectCount(@Param("where") String where) throws Exception; 

	/*根据主键查询某条项目记录*/
	public Project getProject(int projectId) throws Exception;

	/*更新项目记录*/
	public void updateProject(Project project) throws Exception;

	/*删除项目记录*/
	public void deleteProject(int projectId) throws Exception;

}
