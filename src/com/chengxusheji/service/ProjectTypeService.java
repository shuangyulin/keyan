package com.chengxusheji.service;

import java.util.ArrayList;
import javax.annotation.Resource; 
import org.springframework.stereotype.Service;
import com.chengxusheji.po.ProjectType;

import com.chengxusheji.mapper.ProjectTypeMapper;
@Service
public class ProjectTypeService {

	@Resource ProjectTypeMapper projectTypeMapper;
    /*每页显示记录数目*/
    private int rows = 10;;
    public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}

    /*保存查询后总的页数*/
    private int totalPage;
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public int getTotalPage() {
        return totalPage;
    }

    /*保存查询到的总记录数*/
    private int recordNumber;
    public void setRecordNumber(int recordNumber) {
        this.recordNumber = recordNumber;
    }
    public int getRecordNumber() {
        return recordNumber;
    }

    /*添加项目性质记录*/
    public void addProjectType(ProjectType projectType) throws Exception {
    	projectTypeMapper.addProjectType(projectType);
    }

    /*按照查询条件分页查询项目性质记录*/
    public ArrayList<ProjectType> queryProjectType(int currentPage) throws Exception { 
     	String where = "where 1=1";
    	int startIndex = (currentPage-1) * this.rows;
    	return projectTypeMapper.queryProjectType(where, startIndex, this.rows);
    }

    /*按照查询条件查询所有记录*/
    public ArrayList<ProjectType> queryProjectType() throws Exception  { 
     	String where = "where 1=1";
    	return projectTypeMapper.queryProjectTypeList(where);
    }

    /*查询所有项目性质记录*/
    public ArrayList<ProjectType> queryAllProjectType()  throws Exception {
        return projectTypeMapper.queryProjectTypeList("where 1=1");
    }

    /*当前查询条件下计算总的页数和记录数*/
    public void queryTotalPageAndRecordNumber() throws Exception {
     	String where = "where 1=1";
        recordNumber = projectTypeMapper.queryProjectTypeCount(where);
        int mod = recordNumber % this.rows;
        totalPage = recordNumber / this.rows;
        if(mod != 0) totalPage++;
    }

    /*根据主键获取项目性质记录*/
    public ProjectType getProjectType(int projectTypeId) throws Exception  {
        ProjectType projectType = projectTypeMapper.getProjectType(projectTypeId);
        return projectType;
    }

    /*更新项目性质记录*/
    public void updateProjectType(ProjectType projectType) throws Exception {
        projectTypeMapper.updateProjectType(projectType);
    }

    /*删除一条项目性质记录*/
    public void deleteProjectType (int projectTypeId) throws Exception {
        projectTypeMapper.deleteProjectType(projectTypeId);
    }

    /*删除多条项目性质信息*/
    public int deleteProjectTypes (String projectTypeIds) throws Exception {
    	String _projectTypeIds[] = projectTypeIds.split(",");
    	for(String _projectTypeId: _projectTypeIds) {
    		projectTypeMapper.deleteProjectType(Integer.parseInt(_projectTypeId));
    	}
    	return _projectTypeIds.length;
    }
}
