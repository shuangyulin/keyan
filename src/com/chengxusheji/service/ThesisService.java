package com.chengxusheji.service;

import java.util.ArrayList;
import javax.annotation.Resource; 
import org.springframework.stereotype.Service;
import com.chengxusheji.po.UserInfo;
import com.chengxusheji.po.Thesis;

import com.chengxusheji.mapper.ThesisMapper;
@Service
public class ThesisService {

	@Resource ThesisMapper thesisMapper;
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

    /*添加论文记录*/
    public void addThesis(Thesis thesis) throws Exception {
    	thesisMapper.addThesis(thesis);
    }

    /*按照查询条件分页查询论文记录*/
    public ArrayList<Thesis> queryThesis(String author,String teacher,String publishDate,UserInfo userObj,String xkml,String name,int currentPage) throws Exception { 
     	String where = "where 1=1";
    	if(!author.equals("")) where = where + " and t_thesis.author like '%" + author + "%'";
    	if(!teacher.equals("")) where = where + " and t_thesis.teacher like '%" + teacher + "%'";
    	if(!publishDate.equals("")) where = where + " and t_thesis.publishDate like '%" + publishDate + "%'";
    	if(null != userObj &&  userObj.getUser_name() != null  && !userObj.getUser_name().equals(""))  where += " and t_thesis.userObj='" + userObj.getUser_name() + "'";
    	if(!xkml.equals("")) where = where + " and t_thesis.xkml like '%" + xkml + "%'";
    	if(!name.equals("")) where = where + " and t_thesis.name like '%" + name + "%'";
    	int startIndex = (currentPage-1) * this.rows;
    	return thesisMapper.queryThesis(where, startIndex, this.rows);
    }

    /*按照查询条件查询所有记录*/
    public ArrayList<Thesis> queryThesis(String author,String teacher,String publishDate,UserInfo userObj,String xkml,String name) throws Exception  { 
     	String where = "where 1=1";
    	if(!author.equals("")) where = where + " and t_thesis.author like '%" + author + "%'";
    	if(!teacher.equals("")) where = where + " and t_thesis.teacher like '%" + teacher + "%'";
    	if(!publishDate.equals("")) where = where + " and t_thesis.publishDate like '%" + publishDate + "%'";
    	if(null != userObj &&  userObj.getUser_name() != null && !userObj.getUser_name().equals(""))  where += " and t_thesis.userObj='" + userObj.getUser_name() + "'";
    	if(!xkml.equals("")) where = where + " and t_thesis.xkml like '%" + xkml + "%'";
    	if(!name.equals("")) where = where + " and t_thesis.name like '%" + name + "%'";
    	return thesisMapper.queryThesisList(where);
    }

    /*查询所有论文记录*/
    public ArrayList<Thesis> queryAllThesis()  throws Exception {
        return thesisMapper.queryThesisList("where 1=1");
    }

    /*当前查询条件下计算总的页数和记录数*/
    public void queryTotalPageAndRecordNumber(String author,String teacher,String publishDate,UserInfo userObj,String xkml,String name) throws Exception {
     	String where = "where 1=1";
    	if(!author.equals("")) where = where + " and t_thesis.author like '%" + author + "%'";
    	if(!teacher.equals("")) where = where + " and t_thesis.teacher like '%" + teacher + "%'";
    	if(!publishDate.equals("")) where = where + " and t_thesis.publishDate like '%" + publishDate + "%'";
    	if(null != userObj &&  userObj.getUser_name() != null && !userObj.getUser_name().equals(""))  where += " and t_thesis.userObj='" + userObj.getUser_name() + "'";
    	if(!xkml.equals("")) where = where + " and t_thesis.xkml like '%" + xkml + "%'";
    	if(!name.equals("")) where = where + " and t_thesis.name like '%" + name + "%'";
        recordNumber = thesisMapper.queryThesisCount(where);
        int mod = recordNumber % this.rows;
        totalPage = recordNumber / this.rows;
        if(mod != 0) totalPage++;
    }

    /*根据主键获取论文记录*/
    public Thesis getThesis(int thesisId) throws Exception  {
        Thesis thesis = thesisMapper.getThesis(thesisId);
        return thesis;
    }

    /*更新论文记录*/
    public void updateThesis(Thesis thesis) throws Exception {
        thesisMapper.updateThesis(thesis);
    }

    /*删除一条论文记录*/
    public void deleteThesis (int thesisId) throws Exception {
        thesisMapper.deleteThesis(thesisId);
    }

    /*删除多条论文信息*/
    public int deleteThesiss (String thesisIds) throws Exception {
    	String _thesisIds[] = thesisIds.split(",");
    	for(String _thesisId: _thesisIds) {
    		thesisMapper.deleteThesis(Integer.parseInt(_thesisId));
    	}
    	return _thesisIds.length;
    }
}
