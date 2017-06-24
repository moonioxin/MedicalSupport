package com.medicalsupport.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.CannotAcquireLockException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import com.medicalsupport.entity.Admin;
import com.medicalsupport.service.AdminService;
import com.medicalsupport.service.DepartmentService;
import com.medicalsupport.httpentity.AdminReqParam;
import com.medicalsupport.httpentity.AdminResponseRow;
import com.medicalsupport.httpentity.ShowListInfo;
import com.medicalsupport.httpentity.AdminResponse;

@Controller
public class AdminManageController {
	@Autowired
	private AdminService adminService;
	
	private SimpleDateFormat timeFormat = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat( "yyyy-MM-dd" );
	
	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping(value = "/adminManage")
	public String adminManage() {
		return "admin/staff";
	}
	
	@RequestMapping(value = "/default")
	public String defaultPage()
	{
		return "admin/default";
	}

	@RequestMapping(value = "/listAdmin")
	public void listAdmin(HttpServletResponse response,AdminReqParam adminReqParam) throws IOException, ParseException{
		List<Admin> adminList = adminService.listAdmin(adminReqParam);
		int totalPageCount = adminService.totalPageCount(adminReqParam);
		List<AdminResponseRow> adminResponseList = new ArrayList<AdminResponseRow>();
		
		for (int i=0;i<adminList.size();i++) {
			if(adminList.get(i).getAdminType()==1) {
				adminList.get(i).setAdminTypeName("��������Ա");
			} else {
				adminList.get(i).setAdminTypeName("Ա������Ա");
			}
			
			if(adminList.get(i).getDepartmentName() == null || adminList.get(i).getDepartmentName() == "") {
				adminList.get(i).setDepartmentName("�¶�������");
			}
			
			if(adminList.get(i).getDepartmentName()==null) {
				adminList.get(i).setDepartmentName("");
			}
			AdminResponseRow adminResponseRow = new AdminResponseRow(i, adminList.get(i));
			adminResponseList.add(adminResponseRow);
		}
		
		AdminResponse adminResponse=new AdminResponse();
		adminResponse.setPage(adminReqParam.getPage());        //����
		adminResponse.setTotal(totalPageCount);
		adminResponse.setRows(adminResponseList);
		Gson gson = new Gson();
		String resultString = gson.toJson(adminResponse);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(resultString);
		out.close();
	}
	
	@RequestMapping(value = "/addAdmin")
	public ModelAndView toAdd() {
		
		ShowListInfo listInfo = new ShowListInfo();
		List<Map<String, Object>> departmentList = departmentService.getDepartmentList();
		listInfo.setDepartmentList(departmentList);
		ModelAndView mv = new ModelAndView();
		mv.addObject("listInfo",listInfo);
		mv.setViewName("admin/staffInfo");
		return mv;
	}
	
	@RequestMapping(value = "/saveAdmin", method = RequestMethod.POST)
	public ModelAndView toSave(Admin staff) {
		ModelAndView mv = new ModelAndView();
		
		if(staff.getAdminID() == null || staff.getAdminID().intValue() == 0)
		{
		    staff.setPurview(staff.getAdminType());
			if(adminService.insertAdmin(staff) == false)
			{
				mv.addObject("msg", "����ʧ��!");
			}
			else
			{
				mv.addObject("msg", "����ɹ�!");
			}
		}
		else
		{
			staff.setPurview(staff.getAdminType());
			if(adminService.updateAdmin(staff) == false)
			{
				mv.addObject("msg", "����ʧ��!");
			}
			else
			{
				mv.addObject("msg", "����ɹ�!");
			}
		}
		mv.setViewName("admin/save_result");
		return mv;
	}
	
	@RequestMapping(value = "/editAdmin")
	public ModelAndView toEdit(@RequestParam int id) {
		ModelAndView mv = new ModelAndView();
		Admin admin = adminService.getAdminByID(id);
		mv.addObject("editStaff",admin);
		ShowListInfo listInfo = new ShowListInfo();
		List<Map<String, Object>> departmentList = departmentService.getDepartmentList();
		listInfo.setDepartmentList(departmentList);
		mv.addObject("listInfo",listInfo);
		mv.setViewName("admin/staffInfo");
		return mv;
	}
	
	@RequestMapping(value = "/deleteAdmins")
	public void toDelete(@RequestParam String ids, PrintWriter out) {
		String[] allId = ids.split(",");
		adminService.deleteAdmins(allId);
		String msg ="{\"result\":\"success\"}";
		out.write(msg);
		out.close();
	}
}