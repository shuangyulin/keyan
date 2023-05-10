package com.chengxusheji.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.chengxusheji.utils.ExportExcelUtil;
import com.chengxusheji.utils.UserException;
import com.chengxusheji.service.ThesisService;
import com.chengxusheji.po.Thesis;
import com.chengxusheji.service.UserInfoService;
import com.chengxusheji.po.UserInfo;

//Thesis管理控制层
@Controller
@RequestMapping("/Thesis")
public class ThesisController extends BaseController {

    /*业务层对象*/
    @Resource ThesisService thesisService;

    @Resource UserInfoService userInfoService;
	@InitBinder("userObj")
	public void initBinderuserObj(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("userObj.");
	}
	@InitBinder("thesis")
	public void initBinderThesis(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("thesis.");
	}
	/*跳转到添加Thesis视图*/
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(Model model,HttpServletRequest request) throws Exception {
		model.addAttribute(new Thesis());
		/*查询所有的UserInfo信息*/
		List<UserInfo> userInfoList = userInfoService.queryAllUserInfo();
		request.setAttribute("userInfoList", userInfoList);
		return "Thesis_add";
	}

	/*客户端ajax方式提交添加论文信息*/
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public void add(@Validated Thesis thesis, BindingResult br,
			Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		String message = "";
		boolean success = false;
		if (br.hasErrors()) {
			message = "输入信息不符合要求！";
			writeJsonResponse(response, success, message);
			return ;
		}
		try {
			thesis.setLwfm(this.handlePhotoUpload(request, "lwfmFile"));
		} catch(UserException ex) {
			message = "图片格式不正确！";
			writeJsonResponse(response, success, message);
			return ;
		}
		thesis.setThesisFile(this.handleFileUpload(request, "thesisFileFile"));
        thesisService.addThesis(thesis);
        message = "论文添加成功!";
        success = true;
        writeJsonResponse(response, success, message);
	}
	/*ajax方式按照查询条件分页查询论文信息*/
	@RequestMapping(value = { "/list" }, method = {RequestMethod.GET,RequestMethod.POST})
	public void list(String author,String teacher,String publishDate,@ModelAttribute("userObj") UserInfo userObj,String xkml,String name,Integer page,Integer rows, Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		if (page==null || page == 0) page = 1;
		if (author == null) author = "";
		if (teacher == null) teacher = "";
		if (publishDate == null) publishDate = "";
		if (xkml == null) xkml = "";
		if (name == null) name = "";
		if(rows != 0)thesisService.setRows(rows);
		List<Thesis> thesisList = thesisService.queryThesis(author, teacher, publishDate, userObj, xkml, name, page);
	    /*计算总的页数和总的记录数*/
	    thesisService.queryTotalPageAndRecordNumber(author, teacher, publishDate, userObj, xkml, name);
	    /*获取到总的页码数目*/
	    int totalPage = thesisService.getTotalPage();
	    /*当前查询条件下总记录数*/
	    int recordNumber = thesisService.getRecordNumber();
        response.setContentType("text/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		//将要被返回到客户端的对象
		JSONObject jsonObj=new JSONObject();
		jsonObj.accumulate("total", recordNumber);
		JSONArray jsonArray = new JSONArray();
		for(Thesis thesis:thesisList) {
			JSONObject jsonThesis = thesis.getJsonObject();
			jsonArray.put(jsonThesis);
		}
		jsonObj.accumulate("rows", jsonArray);
		out.println(jsonObj.toString());
		out.flush();
		out.close();
	}

	/*ajax方式按照查询条件分页查询论文信息*/
	@RequestMapping(value = { "/listAll" }, method = {RequestMethod.GET,RequestMethod.POST})
	public void listAll(HttpServletResponse response) throws Exception {
		List<Thesis> thesisList = thesisService.queryAllThesis();
        response.setContentType("text/json;charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		JSONArray jsonArray = new JSONArray();
		for(Thesis thesis:thesisList) {
			JSONObject jsonThesis = new JSONObject();
			jsonThesis.accumulate("thesisId", thesis.getThesisId());
			jsonThesis.accumulate("name", thesis.getName());
			jsonArray.put(jsonThesis);
		}
		out.println(jsonArray.toString());
		out.flush();
		out.close();
	}

	/*前台按照查询条件分页查询论文信息*/
	@RequestMapping(value = { "/frontlist" }, method = {RequestMethod.GET,RequestMethod.POST})
	public String frontlist(String author,String teacher,String publishDate,@ModelAttribute("userObj") UserInfo userObj,String xkml,String name,Integer currentPage, Model model, HttpServletRequest request) throws Exception  {
		if (currentPage==null || currentPage == 0) currentPage = 1;
		if (author == null) author = "";
		if (teacher == null) teacher = "";
		if (publishDate == null) publishDate = "";
		if (xkml == null) xkml = "";
		if (name == null) name = "";
		List<Thesis> thesisList = thesisService.queryThesis(author, teacher, publishDate, userObj, xkml, name, currentPage);
	    /*计算总的页数和总的记录数*/
	    thesisService.queryTotalPageAndRecordNumber(author, teacher, publishDate, userObj, xkml, name);
	    /*获取到总的页码数目*/
	    int totalPage = thesisService.getTotalPage();
	    /*当前查询条件下总记录数*/
	    int recordNumber = thesisService.getRecordNumber();
	    request.setAttribute("thesisList",  thesisList);
	    request.setAttribute("totalPage", totalPage);
	    request.setAttribute("recordNumber", recordNumber);
	    request.setAttribute("currentPage", currentPage);
	    request.setAttribute("author", author);
	    request.setAttribute("teacher", teacher);
	    request.setAttribute("publishDate", publishDate);
	    request.setAttribute("userObj", userObj);
	    request.setAttribute("xkml", xkml);
	    request.setAttribute("name", name);
	    List<UserInfo> userInfoList = userInfoService.queryAllUserInfo();
	    request.setAttribute("userInfoList", userInfoList);
		return "Thesis/thesis_frontquery_result"; 
	}

     /*前台查询Thesis信息*/
	@RequestMapping(value="/{thesisId}/frontshow",method=RequestMethod.GET)
	public String frontshow(@PathVariable Integer thesisId,Model model,HttpServletRequest request) throws Exception {
		/*根据主键thesisId获取Thesis对象*/
        Thesis thesis = thesisService.getThesis(thesisId);

        List<UserInfo> userInfoList = userInfoService.queryAllUserInfo();
        request.setAttribute("userInfoList", userInfoList);
        request.setAttribute("thesis",  thesis);
        return "Thesis/thesis_frontshow";
	}

	/*ajax方式显示论文修改jsp视图页*/
	@RequestMapping(value="/{thesisId}/update",method=RequestMethod.GET)
	public void update(@PathVariable Integer thesisId,Model model,HttpServletRequest request,HttpServletResponse response) throws Exception {
        /*根据主键thesisId获取Thesis对象*/
        Thesis thesis = thesisService.getThesis(thesisId);

        response.setContentType("text/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
		//将要被返回到客户端的对象 
		JSONObject jsonThesis = thesis.getJsonObject();
		out.println(jsonThesis.toString());
		out.flush();
		out.close();
	}

	/*ajax方式更新论文信息*/
	@RequestMapping(value = "/{thesisId}/update", method = RequestMethod.POST)
	public void update(@Validated Thesis thesis, BindingResult br,
			Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		String message = "";
    	boolean success = false;
		if (br.hasErrors()) { 
			message = "输入的信息有错误！";
			writeJsonResponse(response, success, message);
			return;
		}
		String lwfmFileName = this.handlePhotoUpload(request, "lwfmFile");
		if(!lwfmFileName.equals("upload/NoImage.jpg"))thesis.setLwfm(lwfmFileName); 


		String thesisFileFileName = this.handleFileUpload(request, "thesisFileFile");
		if(!thesisFileFileName.equals(""))thesis.setThesisFile(thesisFileFileName);
		try {
			thesisService.updateThesis(thesis);
			message = "论文更新成功!";
			success = true;
			writeJsonResponse(response, success, message);
		} catch (Exception e) {
			e.printStackTrace();
			message = "论文更新失败!";
			writeJsonResponse(response, success, message); 
		}
	}
    /*删除论文信息*/
	@RequestMapping(value="/{thesisId}/delete",method=RequestMethod.GET)
	public String delete(@PathVariable Integer thesisId,HttpServletRequest request) throws UnsupportedEncodingException {
		  try {
			  thesisService.deleteThesis(thesisId);
	            request.setAttribute("message", "论文删除成功!");
	            return "message";
	        } catch (Exception e) { 
	            e.printStackTrace();
	            request.setAttribute("error", "论文删除失败!");
				return "error";

	        }

	}

	/*ajax方式删除多条论文记录*/
	@RequestMapping(value="/deletes",method=RequestMethod.POST)
	public void delete(String thesisIds,HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException {
		String message = "";
    	boolean success = false;
        try { 
        	int count = thesisService.deleteThesiss(thesisIds);
        	success = true;
        	message = count + "条记录删除成功";
        	writeJsonResponse(response, success, message);
        } catch (Exception e) { 
            //e.printStackTrace();
            message = "有记录存在外键约束,删除失败";
            writeJsonResponse(response, success, message);
        }
	}

	/*按照查询条件导出论文信息到Excel*/
	@RequestMapping(value = { "/OutToExcel" }, method = {RequestMethod.GET,RequestMethod.POST})
	public void OutToExcel(String author,String teacher,String publishDate,@ModelAttribute("userObj") UserInfo userObj,String xkml,String name, Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
        if(author == null) author = "";
        if(teacher == null) teacher = "";
        if(publishDate == null) publishDate = "";
        if(xkml == null) xkml = "";
        if(name == null) name = "";
        List<Thesis> thesisList = thesisService.queryThesis(author,teacher,publishDate,userObj,xkml,name);
        ExportExcelUtil ex = new ExportExcelUtil();
        String _title = "Thesis信息记录"; 
        String[] headers = { "论文id","学科门类","论文名称","论文封面图","作者","指导老师","发布日期","提交用户"};
        List<String[]> dataset = new ArrayList<String[]>(); 
        for(int i=0;i<thesisList.size();i++) {
        	Thesis thesis = thesisList.get(i); 
        	dataset.add(new String[]{thesis.getThesisId() + "",thesis.getXkml(),thesis.getName(),thesis.getLwfm(),thesis.getAuthor(),thesis.getTeacher(),thesis.getPublishDate(),thesis.getUserObj().getName()});
        }
        /*
        OutputStream out = null;
		try {
			out = new FileOutputStream("C://output.xls");
			ex.exportExcel(title,headers, dataset, out);
		    out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		*/
		OutputStream out = null;//创建一个输出流对象 
		try { 
			out = response.getOutputStream();//
			response.setHeader("Content-disposition","attachment; filename="+"Thesis.xls");//filename是下载的xls的名，建议最好用英文 
			response.setContentType("application/msexcel;charset=UTF-8");//设置类型 
			response.setHeader("Pragma","No-cache");//设置头 
			response.setHeader("Cache-Control","no-cache");//设置头 
			response.setDateHeader("Expires", 0);//设置日期头  
			String rootPath = request.getSession().getServletContext().getRealPath("/");
			ex.exportExcel(rootPath,_title,headers, dataset, out);
			out.flush();
		} catch (IOException e) { 
			e.printStackTrace(); 
		}finally{
			try{
				if(out!=null){ 
					out.close(); 
				}
			}catch(IOException e){ 
				e.printStackTrace(); 
			} 
		}
    }
}
