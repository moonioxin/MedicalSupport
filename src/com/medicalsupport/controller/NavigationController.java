package com.medicalsupport.controller;

import java.text.SimpleDateFormat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NavigationController {
	
	private SimpleDateFormat timeFormat = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat( "yyyy-MM-dd" );
	
	@RequestMapping(value = "/introductionView")
	public ModelAndView about1() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("about/introduction");
		return mv;
	}
	
	@RequestMapping(value = "/notionView")
	public ModelAndView about2() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("about/notion");
		return mv;
	}
	
	@RequestMapping(value = "/organizationalStructureView")
	public ModelAndView about3() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("about/organizationalStructure");
		return mv;
	}
	
	@RequestMapping(value = "/honorView")
	public ModelAndView about4() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("about/honor");
		return mv;
	}
	
	@RequestMapping(value = "/contactUsView")
	public ModelAndView contactUs() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("contact/contactUs");
		return mv;
	}
	
	@RequestMapping(value = "/pointCheckView")
	public ModelAndView pointCheck() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("pointManager/pointCheck");
		return mv;
	}
	
	@RequestMapping(value = "/pointChangeView")
	public ModelAndView pointChange() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("pointManager/pointChange");
		return mv;
	}
	
	@RequestMapping(value = "/pointTransferenceView")
	public ModelAndView pointTransference() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("pointManager/pointTransference");
		return mv;
	}
}
