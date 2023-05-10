package com.chengxusheji.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;
import com.chengxusheji.po.Thesis;

public interface ThesisMapper {
	/*添加论文信息*/
	public void addThesis(Thesis thesis) throws Exception;

	/*按照查询条件分页查询论文记录*/
	public ArrayList<Thesis> queryThesis(@Param("where") String where,@Param("startIndex") int startIndex,@Param("pageSize") int pageSize) throws Exception;

	/*按照查询条件查询所有论文记录*/
	public ArrayList<Thesis> queryThesisList(@Param("where") String where) throws Exception;

	/*按照查询条件的论文记录数*/
	public int queryThesisCount(@Param("where") String where) throws Exception; 

	/*根据主键查询某条论文记录*/
	public Thesis getThesis(int thesisId) throws Exception;

	/*更新论文记录*/
	public void updateThesis(Thesis thesis) throws Exception;

	/*删除论文记录*/
	public void deleteThesis(int thesisId) throws Exception;

}
