package com.chengxusheji.po;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.json.JSONException;
import org.json.JSONObject;

public class Thesis {
    /*论文id*/
    private Integer thesisId;
    public Integer getThesisId(){
        return thesisId;
    }
    public void setThesisId(Integer thesisId){
        this.thesisId = thesisId;
    }

    /*学科门类*/
    @NotEmpty(message="学科门类不能为空")
    private String xkml;
    public String getXkml() {
        return xkml;
    }
    public void setXkml(String xkml) {
        this.xkml = xkml;
    }

    /*论文名称*/
    @NotEmpty(message="论文名称不能为空")
    private String name;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    /*论文封面图*/
    private String lwfm;
    public String getLwfm() {
        return lwfm;
    }
    public void setLwfm(String lwfm) {
        this.lwfm = lwfm;
    }

    /*作者*/
    @NotEmpty(message="作者不能为空")
    private String author;
    public String getAuthor() {
        return author;
    }
    public void setAuthor(String author) {
        this.author = author;
    }

    /*指导老师*/
    @NotEmpty(message="指导老师不能为空")
    private String teacher;
    public String getTeacher() {
        return teacher;
    }
    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    /*发布日期*/
    @NotEmpty(message="发布日期不能为空")
    private String publishDate;
    public String getPublishDate() {
        return publishDate;
    }
    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    /*论文介绍*/
    @NotEmpty(message="论文介绍不能为空")
    private String thesisDesc;
    public String getThesisDesc() {
        return thesisDesc;
    }
    public void setThesisDesc(String thesisDesc) {
        this.thesisDesc = thesisDesc;
    }

    /*论文文件*/
    private String thesisFile;
    public String getThesisFile() {
        return thesisFile;
    }
    public void setThesisFile(String thesisFile) {
        this.thesisFile = thesisFile;
    }

    /*修改意见*/
    private String xgyj;
    public String getXgyj() {
        return xgyj;
    }
    public void setXgyj(String xgyj) {
        this.xgyj = xgyj;
    }

    /*提交用户*/
    private UserInfo userObj;
    public UserInfo getUserObj() {
        return userObj;
    }
    public void setUserObj(UserInfo userObj) {
        this.userObj = userObj;
    }

    public JSONObject getJsonObject() throws JSONException {
    	JSONObject jsonThesis=new JSONObject(); 
		jsonThesis.accumulate("thesisId", this.getThesisId());
		jsonThesis.accumulate("xkml", this.getXkml());
		jsonThesis.accumulate("name", this.getName());
		jsonThesis.accumulate("lwfm", this.getLwfm());
		jsonThesis.accumulate("author", this.getAuthor());
		jsonThesis.accumulate("teacher", this.getTeacher());
		jsonThesis.accumulate("publishDate", this.getPublishDate().length()>19?this.getPublishDate().substring(0,19):this.getPublishDate());
		jsonThesis.accumulate("thesisDesc", this.getThesisDesc());
		jsonThesis.accumulate("thesisFile", this.getThesisFile());
		jsonThesis.accumulate("xgyj", this.getXgyj());
		jsonThesis.accumulate("userObj", this.getUserObj().getName());
		jsonThesis.accumulate("userObjPri", this.getUserObj().getUser_name());
		return jsonThesis;
    }}