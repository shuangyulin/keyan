package com.chengxusheji.service;

import java.util.ArrayList;
import javax.annotation.Resource; 
import org.springframework.stereotype.Service;
import com.chengxusheji.po.ProjectType;
import com.chengxusheji.po.UserInfo;
import com.chengxusheji.po.Project;

import com.chengxusheji.mapper.ProjectMapper;
@Service
public class ProjectService {

	@Resource ProjectMapper projectMapper;
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

    /*添加项目记录*/
    public void addProject(Project project) throws Exception {
    	projectMapper.addProject(project);
    }

    /*按照查询条件分页查询项目记录*/
    public ArrayList<Project> queryProject(ProjectType projectTypeObj,String projectName,String mainPerson,String startDate,UserInfo userObj,String shzt,String shr,int currentPage) throws Exception { 
     	String where = "where 1=1";
    	if(null != projectTypeObj && projectTypeObj.getProjectTypeId()!= null && projectTypeObj.getProjectTypeId()!= 0)  where += " and t_project.projectTypeObj=" + projectTypeObj.getProjectTypeId();
    	if(!projectName.equals("")) where = where + " and t_project.projectName like '%" + projectName + "%'";
    	if(!mainPerson.equals("")) where = where + " and t_project.mainPerson like '%" + mainPerson + "%'";
    	if(!startDate.equals("")) where = where + " and t_project.startDate like '%" + startDate + "%'";
    	if(null != userObj &&  userObj.getUser_name() != null  && !userObj.getUser_name().equals(""))  where += " and t_project.userObj='" + userObj.getUser_name() + "'";
    	if(!shzt.equals("")) where = where + " and t_project.shzt like '%" + shzt + "%'";
    	if(!shr.equals("")) where = where + " and t_project.shr like '%" + shr + "%'";
    	int startIndex = (currentPage-1) * this.rows;
    	return projectMapper.queryProject(where, startIndex, this.rows);
    }

    /*按照查询条件查询所有记录*/
    public ArrayList<Project> queryProject(ProjectType projectTypeObj,String projectName,String mainPerson,String startDate,UserInfo userObj,String shzt,String shr) throws Exception  { 
     	String where = "where 1=1";
    	if(null != projectTypeObj && projectTypeObj.getProjectTypeId()!= null && projectTypeObj.getProjectTypeId()!= 0)  where += " and t_project.projectTypeObj=" + projectTypeObj.getProjectTypeId();
    	if(!projectName.equals("")) where = where + " and t_project.projectName like '%" + projectName + "%'";
    	if(!mainPerson.equals("")) where = where + " and t_project.mainPerson like '%" + mainPerson + "%'";
    	if(!startDate.equals("")) where = where + " and t_project.startDate like '%" + startDate + "%'";
    	if(null != userObj &&  userObj.getUser_name() != null && !userObj.getUser_name().equals(""))  where += " and t_project.userObj='" + userObj.getUser_name() + "'";
    	if(!shzt.equals("")) where = where + " and t_project.shzt like '%" + shzt + "%'";
    	if(!shr.equals("")) where = where + " and t_project.shr like '%" + shr + "%'";
    	return projectMapper.queryProjectList(where);
    }

    /*查询所有项目记录*/
    public ArrayList<Project> queryAllProject()  throws Exception {
        return projectMapper.queryProjectList("where 1=1");
    }

    /*当前查询条件下计算总的页数和记录数*/
    public void queryTotalPageAndRecordNumber(ProjectType projectTypeObj,String projectName,String mainPerson,String startDate,UserInfo userObj,String shzt,String shr) throws Exception {
     	String where = "where 1=1";
    	if(null != projectTypeObj && projectTypeObj.getProjectTypeId()!= null && projectTypeObj.getProjectTypeId()!= 0)  where += " and t_project.projectTypeObj=" + projectTypeObj.getProjectTypeId();
    	if(!projectName.equals("")) where = where + " and t_project.projectName like '%" + projectName + "%'";
    	if(!mainPerson.equals("")) where = where + " and t_project.mainPerson like '%" + mainPerson + "%'";
    	if(!startDate.equals("")) where = where + " and t_project.startDate like '%" + startDate + "%'";
    	if(null != userObj &&  userObj.getUser_name() != null && !userObj.getUser_name().equals(""))  where += " and t_project.userObj='" + userObj.getUser_name() + "'";
    	if(!shzt.equals("")) where = where + " and t_project.shzt like '%" + shzt + "%'";
    	if(!shr.equals("")) where = where + " and t_project.shr like '%" + shr + "%'";
        recordNumber = projectMapper.queryProjectCount(where);
        int mod = recordNumber % this.rows;
        totalPage = recordNumber / this.rows;
        if(mod != 0) totalPage++;
    }

    /*根据主键获取项目记录*/
    public Project getProject(int projectId) throws Exception  {
        Project project = projectMapper.getProject(projectId);
        return project;
    }

    /*更新项目记录*/
    public void updateProject(Project project) throws Exception {
        projectMapper.updateProject(project);
    }

    /*删除一条项目记录*/
    public void deleteProject (int projectId) throws Exception {
        projectMapper.deleteProject(projectId);
    }

    /*删除多条项目信息*/
    public int deleteProjects (String projectIds) throws Exception {
    	String _projectIds[] = projectIds.split(",");
    	for(String _projectId: _projectIds) {
    		projectMapper.deleteProject(Integer.parseInt(_projectId));
    	}
    	return _projectIds.length;
    }
}
