package com.chengxusheji.po;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.json.JSONException;
import org.json.JSONObject;

public class Project {
    /*项目id*/
    private Integer projectId;
    public Integer getProjectId(){
        return projectId;
    }
    public void setProjectId(Integer projectId){
        this.projectId = projectId;
    }

    /*项目类型*/
    private ProjectType projectTypeObj;
    public ProjectType getProjectTypeObj() {
        return projectTypeObj;
    }
    public void setProjectTypeObj(ProjectType projectTypeObj) {
        this.projectTypeObj = projectTypeObj;
    }

    /*项目名称*/
    @NotEmpty(message="项目名称不能为空")
    private String projectName;
    public String getProjectName() {
        return projectName;
    }
    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    /*项目主图*/
    private String projectPhoto;
    public String getProjectPhoto() {
        return projectPhoto;
    }
    public void setProjectPhoto(String projectPhoto) {
        this.projectPhoto = projectPhoto;
    }

    /*负责人*/
    @NotEmpty(message="负责人不能为空")
    private String mainPerson;
    public String getMainPerson() {
        return mainPerson;
    }
    public void setMainPerson(String mainPerson) {
        this.mainPerson = mainPerson;
    }

    /*项目来源*/
    private String comeFrom;
    public String getComeFrom() {
        return comeFrom;
    }
    public void setComeFrom(String comeFrom) {
        this.comeFrom = comeFrom;
    }

    /*科研代号*/
    @NotEmpty(message="科研代号不能为空")
    private String kydh;
    public String getKydh() {
        return kydh;
    }
    public void setKydh(String kydh) {
        this.kydh = kydh;
    }

    /*开始日期*/
    @NotEmpty(message="开始日期不能为空")
    private String startDate;
    public String getStartDate() {
        return startDate;
    }
    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    /*结束日期*/
    @NotEmpty(message="结束日期不能为空")
    private String endDate;
    public String getEndDate() {
        return endDate;
    }
    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    /*科研资金*/
    @NotNull(message="必须输入科研资金")
    private Float kyMoney;
    public Float getKyMoney() {
        return kyMoney;
    }
    public void setKyMoney(Float kyMoney) {
        this.kyMoney = kyMoney;
    }

    /*项目介绍*/
    @NotEmpty(message="项目介绍不能为空")
    private String projectDesc;
    public String getProjectDesc() {
        return projectDesc;
    }
    public void setProjectDesc(String projectDesc) {
        this.projectDesc = projectDesc;
    }

    /*提交用户*/
    private UserInfo userObj;
    public UserInfo getUserObj() {
        return userObj;
    }
    public void setUserObj(UserInfo userObj) {
        this.userObj = userObj;
    }

    /*审核状态*/
    @NotEmpty(message="审核状态不能为空")
    private String shzt;
    public String getShzt() {
        return shzt;
    }
    public void setShzt(String shzt) {
        this.shzt = shzt;
    }

    /*审核人*/
    private String shr;
    public String getShr() {
        return shr;
    }
    public void setShr(String shr) {
        this.shr = shr;
    }

    /*审核时间*/
    private String shsj;
    public String getShsj() {
        return shsj;
    }
    public void setShsj(String shsj) {
        this.shsj = shsj;
    }

    public JSONObject getJsonObject() throws JSONException {
    	JSONObject jsonProject=new JSONObject(); 
		jsonProject.accumulate("projectId", this.getProjectId());
		jsonProject.accumulate("projectTypeObj", this.getProjectTypeObj().getProjectTypeName());
		jsonProject.accumulate("projectTypeObjPri", this.getProjectTypeObj().getProjectTypeId());
		jsonProject.accumulate("projectName", this.getProjectName());
		jsonProject.accumulate("projectPhoto", this.getProjectPhoto());
		jsonProject.accumulate("mainPerson", this.getMainPerson());
		jsonProject.accumulate("comeFrom", this.getComeFrom());
		jsonProject.accumulate("kydh", this.getKydh());
		jsonProject.accumulate("startDate", this.getStartDate().length()>19?this.getStartDate().substring(0,19):this.getStartDate());
		jsonProject.accumulate("endDate", this.getEndDate().length()>19?this.getEndDate().substring(0,19):this.getEndDate());
		jsonProject.accumulate("kyMoney", this.getKyMoney());
		jsonProject.accumulate("projectDesc", this.getProjectDesc());
		jsonProject.accumulate("userObj", this.getUserObj().getName());
		jsonProject.accumulate("userObjPri", this.getUserObj().getUser_name());
		jsonProject.accumulate("shzt", this.getShzt());
		jsonProject.accumulate("shr", this.getShr());
		jsonProject.accumulate("shsj", this.getShsj());
		return jsonProject;
    }}