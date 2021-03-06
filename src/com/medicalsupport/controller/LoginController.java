package com.medicalsupport.controller;
/**
 * Copyright(C) 2011-2013 Clarion Corp. All rights reserved.
 * 
 * 鐢ㄦ埛鐧诲綍Controller
 * 
 * @author guo_renpeng@clarion.com.cn
 * @create: 2012-11-09
 * @histroy:
 * 	2012-11-09 GuoRenPeng
 *  # 鍒濈増
 *  
 *  2013-02-21 GuoRenPeng
 *  # 鍙栨秷楠岃瘉鐮�
 *  
 *  2013-04-09 GuoRenPeng
 *  # 鐣岄潰澧炲姞閭鍦板潃閫夋嫨
 */

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

import com.medicalsupport.entity.*;
import com.medicalsupport.service.AdminService;


@Controller
public class LoginController {
	@Autowired
	private AdminService adminService;
	
	private SimpleDateFormat timeFormat = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat( "yyyy-MM-dd" );
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet() {
		return "login";
	}

	/**
	 * 
	 * 
	 * @param session     Session:
	 * @param username    :E-mail
	 * @param password    
	 * @return
	 * @throws BusinessException 
	 */
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginPost(HttpSession session,
			@RequestParam String username, @RequestParam String password)
	{
		ModelAndView mv = new ModelAndView();
		Admin admin = new Admin();
		admin=adminService.getAdminByNameAndPwd(username, password);
		
		String errInfo = "";
		//ModelAndView mv = new ModelAndView();
		if(admin != null)
		{
		    mv.setViewName("redirect:indexManager.do");
		    session.setAttribute("admin", admin);
		}
		else
		{
			errInfo = "E0003";
			mv.addObject("errInfo",errInfo);
			mv.setViewName("login");
		}
		return mv;
	}
	
	/**
	 * 访问系统首页
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index(HttpSession session, Model model) {
		Admin admin = (Admin) session.getAttribute("admin");
		ModelAndView mv=new ModelAndView();
		mv.addObject("admin", admin);
		mv.setViewName("index");
		return mv;
	}
    
	/**
	 * 访问后台系统
	 */
	@RequestMapping(value = "/indexManager")
	public ModelAndView indexManager(HttpSession session, Model model) {
		Admin admin = (Admin) session.getAttribute("admin");
		ModelAndView mv=new ModelAndView();
		mv.addObject("admin", admin);
		mv.setViewName("admin/indexManager");
		return mv;
	}
	
	/**
	 * 退出登录
	 * @return
	 */
	@RequestMapping(value = "/logout", method = {RequestMethod.GET, RequestMethod.POST})
	public String Loginout() {
		return "login";
	}
}
