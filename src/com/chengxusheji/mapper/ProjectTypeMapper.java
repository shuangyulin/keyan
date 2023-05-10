package com.chengxusheji.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;
import com.chengxusheji.po.ProjectType;

public interface ProjectTypeMapper {
	/*添加项目性质信息*/
	public void addProjectType(ProjectType projectType) throws Exception;

	/*按照查询条件分页查询项目性质记录*/
	public ArrayList<ProjectType> queryProjectType(@Param("where") String where,@Param("startIndex") int startIndex,@Param("pageSize") int pageSize) throws Exception;

	/*按照查询条件查询所有项目性质记录*/
	public ArrayList<ProjectType> queryProjectTypeList(@Param("where") String where) throws Exception;

	/*按照查询条件的项目性质记录数*/
	public int queryProjectTypeCount(@Param("where") String where) throws Exception; 

	/*根据主键查询某条项目性质记录*/
	public ProjectType getProjectType(int projectTypeId) throws Exception;

	/*更新项目性质记录*/
	public void updateProjectType(ProjectType projectType) throws Exception;

	/*删除项目性质记录*/
	public void deleteProjectType(int projectTypeId) throws Exception;

}
