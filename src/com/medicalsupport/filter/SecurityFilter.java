package com.medicalsupport.filter;
/**
 * Copyright(C) 2011-2013 Clarion Corp. All rights reserved.
 * 
 * 登录验证filter,防止未登录用户�?�过url进入系统
 * 
 * @author guo_renpeng@clarion.com.cn
 * @create: 2012-11-30
 * @histroy:
 * 	2012-11-30 GuoRenPeng
 *  # 初版
 *   
 */
import java.io.IOException;

import com.medicalsupport.entity.Admin;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.*;


public class SecurityFilter implements Filter {

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		
		String sUrl=req.getRequestURI();
		
		if (sUrl.endsWith("login.do")){
			Admin admin = (Admin)session.getAttribute("admin");
			if (admin != null) {
				res.sendRedirect(req.getContextPath()+"/indexManager.do");
			} else {
				chain.doFilter(request, response);
			}
		}else if(sUrl.endsWith("index.do") || sUrl.endsWith("View.do")){
			chain.doFilter(request, response);
		}else{
			Admin admin = (Admin)session.getAttribute("admin");
			if (admin != null) {
				chain.doFilter(request, response);
			} else {
				res.sendRedirect(req.getContextPath()+"/login.do");
			}
		}
	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}
