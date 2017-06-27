package com.medicalsupport.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.CannotAcquireLockException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.medicalsupport.entity.Admin;
import com.medicalsupport.entity.Member;
import com.medicalsupport.entity.PointExchange;
import com.medicalsupport.entity.PointInfo;
import com.medicalsupport.entity.Product;
import com.medicalsupport.entity.RechargeRecord;
import com.medicalsupport.service.MemberService;
import com.medicalsupport.service.PointService;
import com.medicalsupport.service.ProductService;
import com.medicalsupport.httpentity.MemberReqParam;
import com.medicalsupport.httpentity.MemberResponseRow;
import com.medicalsupport.httpentity.PointExchangeReqParam;
import com.medicalsupport.httpentity.PointExchangeResponse;
import com.medicalsupport.httpentity.PointExchangeResponseRow;
import com.medicalsupport.httpentity.MemberResponse;

@Controller
public class MemberPointsController {
	@Autowired
	PointService pointService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	MemberService memberService;
	
	private SimpleDateFormat timeFormat = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat( "yyyy-MM-dd" );
	
	@RequestMapping(value = "/selectPointInfo")
	public void selectPointInfo(@RequestParam String cardNo,@RequestParam Integer productId,HttpServletResponse response)throws IOException {
		PointInfo pointInfo = new PointInfo();
//		if(cardNo!=null && cardNo!="") {
		pointInfo = pointService.queryPointInfo(cardNo);
		if(pointInfo != null) {
			BigDecimal extraCash = BigDecimal.ZERO;
			if(productId!=null) {
				Product product = productService.getProductByID(productId);
//				}else if(idNumber!=null && idNumber!=""){
//					pointInfo = pointService.queryPointInfoByIdNumber(idNumber);
//				}
				extraCash = product.getNeedCash().subtract(pointInfo.getLeftAmount());
			}
			if(extraCash.compareTo(BigDecimal.ZERO)==1) {
				pointInfo.setExtraCash(extraCash);
			} else {
				pointInfo.setExtraCash(BigDecimal.ZERO);
			}
		}
		Gson gson = new Gson();
		String resultString = gson.toJson(pointInfo);
		String result = "{\"result\":"+resultString+"}";
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(result);
		//out.close();
	}
	
	@Transactional
	@RequestMapping(value = "/saveRecharge", method = {RequestMethod.POST,RequestMethod.GET})
	public void saveRecharge(@RequestParam String cardNo,@RequestParam String rechargeAmount,HttpServletResponse response,HttpSession session)throws IOException {
		PointInfo pointInfo = pointService.queryPointInfo(cardNo);
		PointInfo tempPointInfo = new PointInfo();
		Admin admin = (Admin)session.getAttribute("admin");
		
		RechargeRecord rechargeRecord = new RechargeRecord();
		BigDecimal tempAmount = new BigDecimal(rechargeAmount);
		rechargeRecord.setRechargeAmount(tempAmount);
		Integer tempPoint = tempAmount.intValue()/10;
		rechargeRecord.setChangePoints(tempPoint);
		tempPoint = tempPoint + pointInfo.getLeftPoints();
		tempAmount = tempAmount.add(pointInfo.getLeftAmount());
		tempPointInfo.setCardNo(cardNo);
		tempPointInfo.setLeftAmount(tempAmount);
		tempPointInfo.setLeftPoints(tempPoint);
		
		BigDecimal conversionRatio = new BigDecimal("0.1");
		rechargeRecord.setMemberID(pointInfo.getMemberId());
		rechargeRecord.setCardNo(pointInfo.getCardNo());
		rechargeRecord.setConversionRatio(conversionRatio);
		rechargeRecord.setCreateTime(new Date());
		rechargeRecord.setCreator(admin.getAdminName());
		String resultMsg = "";
		String result = "";
		if(pointService.updatePointInfo(tempPointInfo)==0){
			 resultMsg = "��ֵʧ�ܣ�����ϵ����Ա";
		}else{
			 pointService.insertRechargeRecord(rechargeRecord);
			 
			 Member member = new Member();
			 member.setMemberID(pointInfo.getMemberId());
			 member.setTotalPoints(tempPoint);
			 memberService.updateMemberPoints(member);
			 resultMsg =  "��ֵ�ɹ�!";
		}
		Gson gson = new Gson();
		String resultString = gson.toJson(resultMsg);
		result = "{\"result\":"+ resultString +"}";
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(resultString);
	}
	
	@RequestMapping(value = "/pointExchange", method = {RequestMethod.POST,RequestMethod.GET})
	public String pointExchange() {
		return "member/memberExchange";
	}
	
	
	@RequestMapping(value = "/exchangeProduct", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView exchangeProduct(@RequestParam int id) {
		ModelAndView mv = new ModelAndView();
		Product product = productService.getProductByID(id);
		mv.addObject("product",product);
		mv.setViewName("member/memberExchangeConfirm");
		return mv;
	}
	
	@Transactional
	@RequestMapping(value = "/doExchange", method = RequestMethod.POST)
	public void doExchange(@RequestParam String cardNo,@RequestParam Integer productId,HttpServletResponse response,HttpSession session)throws IOException {
		Admin admin = (Admin) session.getAttribute("admin");
		PointInfo pointInfo = new PointInfo();
		pointInfo = pointService.queryPointInfo(cardNo);
		Product product = new Product();
		product = productService.getProductByID(productId);
		PointExchange pointExchange = new PointExchange();
		BigDecimal extraCash = product.getNeedCash().subtract(pointInfo.getLeftAmount());
		if(extraCash.compareTo(BigDecimal.ZERO)==1) {
			pointExchange.setCash(extraCash);
			pointExchange.setExchangeAmount(pointInfo.getLeftAmount());
			pointInfo.setLeftAmount(BigDecimal.ZERO);
		} else {
			pointInfo.setExtraCash(BigDecimal.ZERO);
			pointInfo.setLeftAmount(pointInfo.getLeftAmount().subtract(product.getNeedCash()));
			pointExchange.setCash(BigDecimal.ZERO);
	        pointExchange.setExchangeAmount(product.getNeedCash());
		}
		pointInfo.setLeftPoints(pointInfo.getLeftPoints() - product.getNeedPoint());
//		PointInfo tempPointInfo = new PointInfo();
//		BigDecimal tempAmount = new BigDecimal(rechargeAmount);
//		tempAmount = tempAmount.add(pointInfo.getLeftAmount());
//		tempPointInfo.setCardNo(cardNo);
//		tempPointInfo.setLeftAmount(tempAmount);
		String resultMsg = "";
		String result = "";
		
		
		pointExchange.setCardNo(cardNo);
		pointExchange.setProductId(productId);
		pointExchange.setMemberID(pointInfo.getMemberId());
		pointExchange.setExchangeGift(product.getProductName());
        pointExchange.setExchangePoints(product.getNeedPoint());
        pointExchange.setCash(extraCash);
//		pointExchange.setNote();
//		pointExchange.setCompanyID("");
		pointExchange.setDeptID(product.getDepartment());
		pointExchange.setCreator(admin.getAdminName());
		pointExchange.setCreateTime(new Date());
		pointService.insertPointExchange(pointExchange);
		
		int updateResult = pointService.updatePointInfo(pointInfo);
		if(updateResult==0){
			 resultMsg = "�һ�ʧ�ܣ�����ϵ����Ա";
		}else{
			 resultMsg =  "�һ��ɹ�!";
		}
		Gson gson = new Gson();
		String resultString = gson.toJson(resultMsg);
		result = "{\"result\":"+ resultString +"}";
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(result);
	}
	
	@RequestMapping(value = "/pointExchangeHistory", method = {RequestMethod.POST,RequestMethod.GET})
	public String pointExchangeHistory() {
		return "member/memberExchangeHistory";
	}
	
	@RequestMapping(value = "/listPointExchange")
	public void listPointExchange(HttpServletResponse response,PointExchangeReqParam pointExchangeReqParam) throws IOException, ParseException{
		List<PointExchange> pointExchangeList = pointService.queryPointExchange(pointExchangeReqParam);
		int totalPageCount = pointService.totalPageCount(pointExchangeReqParam);
		List<PointExchangeResponseRow> pointExchangeResponseList = new ArrayList<PointExchangeResponseRow>();
		
		for (int i=0;i<pointExchangeList.size();i++) {
			String timeString = timeFormat.format(pointExchangeList.get(i).getCreateTime());
			pointExchangeList.get(i).setCreateTimeString(timeString);
			PointExchangeResponseRow pointExchangeResponseRow = new PointExchangeResponseRow(i, pointExchangeList.get(i));
			pointExchangeResponseList.add(pointExchangeResponseRow);
		}
		
		PointExchangeResponse pointExchangeResponse=new PointExchangeResponse();
		pointExchangeResponse.setPage(pointExchangeReqParam.getPage());        //����
		pointExchangeResponse.setTotal(totalPageCount);
		pointExchangeResponse.setRows(pointExchangeResponseList);
		Gson gson = new Gson();
		String resultString = gson.toJson(pointExchangeResponse);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(resultString);
		out.close();
	}
	
	@RequestMapping(value = "/editPoints")
	public void editPoints() {
		
	}
}
