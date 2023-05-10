package com.chengxusheji.po;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.json.JSONException;
import org.json.JSONObject;

public class ProjectType {
    /*项目性质id*/
    private Integer projectTypeId;
    public Integer getProjectTypeId(){
        return projectTypeId;
    }
    public void setProjectTypeId(Integer projectTypeId){
        this.projectTypeId = projectTypeId;
    }

    /*项目性质名称*/
    @NotEmpty(message="项目性质名称不能为空")
    private String projectTypeName;
    public String getProjectTypeName() {
        return projectTypeName;
    }
    public void setProjectTypeName(String projectTypeName) {
        this.projectTypeName = projectTypeName;
    }

    public JSONObject getJsonObject() throws JSONException {
    	JSONObject jsonProjectType=new JSONObject(); 
		jsonProjectType.accumulate("projectTypeId", this.getProjectTypeId());
		jsonProjectType.accumulate("projectTypeName", this.getProjectTypeName());
		return jsonProjectType;
    }}