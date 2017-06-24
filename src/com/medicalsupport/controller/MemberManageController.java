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
import java.util.Calendar;
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
import com.medicalsupport.entity.PointInfo;
import com.medicalsupport.entity.PointRecord;
import com.medicalsupport.entity.RechargeRecord;
import com.medicalsupport.service.MemberService;
import com.medicalsupport.service.PointService;
import com.medicalsupport.httpentity.MemberReqParam;
import com.medicalsupport.httpentity.MemberResponseRow;
import com.medicalsupport.httpentity.PointInfoResponse;
import com.medicalsupport.httpentity.PointInfoResponseRow;
import com.medicalsupport.httpentity.PointRecordResponse;
import com.medicalsupport.httpentity.PointRecordResponseRow;
import com.medicalsupport.httpentity.RechargeRecordResponse;
import com.medicalsupport.httpentity.RechargeRecordResponseRow;
import com.medicalsupport.httpentity.MemberResponse;

@Controller
public class MemberManageController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PointService pointService;
	
	private SimpleDateFormat timeFormat = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat( "yyyy-MM-dd" );
	
	@RequestMapping(value = "/member")
	public String memberManage() {
		return "member/member";
	}
	
	@RequestMapping(value = "/listMember")
	public void listMember(HttpServletResponse response,MemberReqParam memberReqParam) throws IOException, ParseException{
		List<Member> memberList = memberService.listMember(memberReqParam);
		int totalPageCount = memberService.totalPageCount(memberReqParam);
		List<MemberResponseRow> memberResponseList = new ArrayList<MemberResponseRow>();
		if(memberList!=null && memberList.size()!=0) {
			for(int i=0;i<memberList.size();i++) {
				if("1".equals(memberList.get(i).getSex())) {
					memberList.get(i).setSexS("男");
				} else {
					memberList.get(i).setSexS("女");
				}
				if(memberList.get(i).getCardNo() == null) {
					memberList.get(i).setCardNo("");
				}
				if(memberList.get(i).getBirthDate() == null) {
					memberList.get(i).setBirthDate("");
				}
				String openDateString = dateFormat.format(memberList.get(i).getOpenDate());
				memberList.get(i).setOpenDateString(openDateString);
				MemberResponseRow memberResponseRow = new MemberResponseRow(i, memberList.get(i));
				memberResponseList.add(memberResponseRow);
			}
		}
		
		MemberResponse memberResponse=new MemberResponse();
		memberResponse.setPage(memberReqParam.getPage());        //设置
		memberResponse.setTotal(totalPageCount);
		memberResponse.setRows(memberResponseList);
		Gson gson = new Gson();
		String resultString = gson.toJson(memberResponse);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(resultString);
		out.close();
	}
	
	@RequestMapping(value = "/listMemberForCreateCard")
	public void listMemberForCreateCard(HttpServletResponse response,MemberReqParam memberReqParam) throws IOException, ParseException{
		List<Member> memberList = memberService.listMemberForCreateCard(memberReqParam);
		int totalPageCount = memberService.totalPageCountForCreateCard(memberReqParam);
		List<MemberResponseRow> memberResponseList = new ArrayList<MemberResponseRow>();
		
		for (int i=0;i<memberList.size();i++) {
			if("1".equals(memberList.get(i).getSex())) {
				memberList.get(i).setSexS("男");
			} else {
				memberList.get(i).setSexS("女");
			}
			String openDateString = dateFormat.format(memberList.get(i).getOpenDate());
			memberList.get(i).setOpenDateString(openDateString);
			MemberResponseRow memberResponseRow = new MemberResponseRow(i, memberList.get(i));
			memberResponseList.add(memberResponseRow);
		}
		
		MemberResponse memberResponse=new MemberResponse();
		memberResponse.setPage(memberReqParam.getPage());        //设置
		memberResponse.setTotal(totalPageCount);
		memberResponse.setRows(memberResponseList);
		Gson gson = new Gson();
		String resultString = gson.toJson(memberResponse);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(resultString);
		out.close();
	}
	
	@RequestMapping(value = "/listMemberForReCreateCard")
	public void listMemberForReCreateCard(HttpServletResponse response,MemberReqParam memberReqParam) throws IOException, ParseException{
		List<Member> memberList = memberService.listMemberForReCreateCard(memberReqParam);
		int totalPageCount = memberService.totalPageCountForCreateCard(memberReqParam);
		List<MemberResponseRow> memberResponseList = new ArrayList<MemberResponseRow>();
		
		for (int i=0;i<memberList.size();i++) {
			if("1".equals(memberList.get(i).getSex())) {
				memberList.get(i).setSexS("男");
			} else {
				memberList.get(i).setSexS("女");
			}
			String openDateString = dateFormat.format(memberList.get(i).getOpenDate());
			memberList.get(i).setOpenDateString(openDateString);
			MemberResponseRow memberResponseRow = new MemberResponseRow(i, memberList.get(i));
			memberResponseList.add(memberResponseRow);
		}
		
		MemberResponse memberResponse=new MemberResponse();
		memberResponse.setPage(memberReqParam.getPage());        //设置
		memberResponse.setTotal(totalPageCount);
		memberResponse.setRows(memberResponseList);
		Gson gson = new Gson();
		String resultString = gson.toJson(memberResponse);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(resultString);
		out.close();
	}
	
	@RequestMapping(value = "/listMemberRechargeHistory")
	public void listMemberRechargeHistory(HttpServletResponse response,MemberReqParam memberReqParam) throws IOException, ParseException{
		List<RechargeRecord> rechargeRecordList = pointService.listMemberRechargeHistory(memberReqParam);
		int totalPageCount = pointService.totalPageCountOfMemberRechargeHistory(memberReqParam);
		List<RechargeRecordResponseRow> rechargeRecordResponseList = new ArrayList<RechargeRecordResponseRow>();
		
		for (int i=0;i<rechargeRecordList.size();i++) {
			String timeString = timeFormat.format(rechargeRecordList.get(i).getCreateTime());
			rechargeRecordList.get(i).setCreateTimeString(timeString);
			RechargeRecordResponseRow rechargeRecordResponseRow = new RechargeRecordResponseRow(i, rechargeRecordList.get(i));
			rechargeRecordResponseList.add(rechargeRecordResponseRow);
		}
		
		RechargeRecordResponse rechargeRecordResponse=new RechargeRecordResponse();
		rechargeRecordResponse.setPage(memberReqParam.getPage());        //设置
		rechargeRecordResponse.setTotal(totalPageCount);
		rechargeRecordResponse.setRows(rechargeRecordResponseList);
		Gson gson = new Gson();
		String resultString = gson.toJson(rechargeRecordResponse);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(resultString);
		out.close();
	}
	
	@RequestMapping(value = "/listPointInfo")
	public void listPointInfo(HttpServletResponse response,MemberReqParam memberReqParam) throws IOException, ParseException{
		List<PointInfo> pointInfoList = pointService.listPointInfo(memberReqParam);
		int totalPageCount = pointService.totalPageCountOfPointInfo(memberReqParam);
		List<PointInfoResponseRow> pointInfoResponseList = new ArrayList<PointInfoResponseRow>();
		
		for (int i=0;i<pointInfoList.size();i++) {
			PointInfoResponseRow pointInfoResponseRow = new PointInfoResponseRow(i, pointInfoList.get(i));
			pointInfoResponseList.add(pointInfoResponseRow);
		}
		
		PointInfoResponse pointInfoResponse=new PointInfoResponse();
		pointInfoResponse.setPage(memberReqParam.getPage());        //设置
		pointInfoResponse.setTotal(totalPageCount);
		pointInfoResponse.setRows(pointInfoResponseList);
		Gson gson = new Gson();
		String resultString = gson.toJson(pointInfoResponse);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(resultString);
		out.close();
	}
	
	@RequestMapping(value = "/pointRecordHistory")
	public String pointRecordHistory() {
		return "member/pointRecordHistory";
	}
	
	@RequestMapping(value = "/listPointRecord")
	public void listPointRecord(HttpServletResponse response,MemberReqParam memberReqParam) throws IOException, ParseException{
		List<PointRecord> pointRecordList = pointService.queryPointRecord(memberReqParam);
		int totalPageCount = pointService.totalCountPointRecord(memberReqParam);
		List<PointRecordResponseRow> pointRecordResponseList = new ArrayList<PointRecordResponseRow>();
		
		for (int i=0;i<pointRecordList.size();i++) {
			PointRecordResponseRow pointRecordResponseRow = new PointRecordResponseRow(i, pointRecordList.get(i));
			String timeString = timeFormat.format(pointRecordList.get(i).getCreateTime());
			pointRecordList.get(i).setCreateTimeString(timeString);
			if("1".equals(pointRecordResponseRow.getCell().getOperationType())) {
				pointRecordResponseRow.getCell().setOperationType("增加");
			} else {
				pointRecordResponseRow.getCell().setOperationType("减少");
			}
			pointRecordResponseList.add(pointRecordResponseRow);
		}
		
		PointRecordResponse pointRecordResponse=new PointRecordResponse();
		pointRecordResponse.setPage(memberReqParam.getPage());        //设置
		pointRecordResponse.setTotal(totalPageCount);
		pointRecordResponse.setRows(pointRecordResponseList);
		Gson gson = new Gson();
		String resultString = gson.toJson(pointRecordResponse);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(resultString);
		out.close();
	}
	
	@RequestMapping(value = "/addMember")
	public ModelAndView toAdd() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberInfo");
		return mv;
	}
	
	@RequestMapping(value = "/editMember")
	public ModelAndView toEdit(@RequestParam String memberID) {
		ModelAndView mv = new ModelAndView();
		Member member = memberService.getMemberByID(memberID);
		mv.addObject("editMember",member);
		mv.setViewName("member/memberInfo");
		return mv;
	}
	
	@RequestMapping(value = "/editMemberForCreateCard")
	public ModelAndView editMemberForCreateCard(@RequestParam String memberID) {
		ModelAndView mv = new ModelAndView();
		Member member = memberService.getMemberByID(memberID);
		mv.addObject("editMember",member);
		mv.setViewName("member/memberCreateCardInfo");
		return mv;
	}
	
	@RequestMapping(value = "/editMemberForRecreateCard")
	public ModelAndView editMemberForRecreateCard(@RequestParam String memberID) {
		ModelAndView mv = new ModelAndView();
		Member member = memberService.getMemberByID(memberID);
		mv.addObject("editMember",member);
		mv.setViewName("member/memberRecreateCardInfo");
		return mv;
	}
	
	@Transactional
	@RequestMapping(value = "/saveCardNoForCreateCard")
	public ModelAndView saveCardNo(Member member,HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		Admin admin = (Admin)session.getAttribute("admin");
		BigDecimal leftAmount = new BigDecimal("0.0");
		PointInfo pointInfo = new PointInfo();
		pointInfo.setMemberId(member.getMemberID());
		pointInfo.setCardNo(member.getCardNo());
		pointInfo.setName(member.getName());
		pointInfo.setIdNumber(member.getIdNumber());
		pointInfo.setLeftPoints(0);
		pointInfo.setLeftAmount(leftAmount);
		pointInfo.setCreateTime(new Date());
		pointInfo.setCreator(admin.getAdminName());
		if(memberService.updateCardNo(member) == false) {
		    mv.addObject("msg", "建卡失败!请稍后重试!");
		}else {
			pointService.insertPointInfo(pointInfo);
			mv.addObject("msg", "建卡成功!");
		}
		mv.setViewName("admin/save_result");
		return mv;
	}
	
//	@Transactional
//	@RequestMapping(value = "/memberLossCard")
//	public ModelAndView memberLossCard(Member member,HttpSession session)
//	{
//		ModelAndView mv = new ModelAndView();
//		PointInfo pointInfo = new PointInfo();
//		pointInfo.setMemberId(member.getMemberID());
//		pointInfo.setCardNo(member.getCardNo());
//		if(memberService.updateCardNo(member) == false) {
//		    mv.addObject("msg", "补卡失败!请稍后重试!");
//		}else {
//			pointService.updatePointInfoSelective(pointInfo);
//			mv.addObject("msg", "补卡成功!");
//		}
//		mv.setViewName("admin/save_result");
//		return mv;
//	}
	
	@RequestMapping(value = "/memberLossCard")
	public String memberLossCard() {
		return "member/memberLossCard";
	}
	
	@RequestMapping(value = "/listMemberLossCard")
	public void listMemberLossCard(HttpServletResponse response,MemberReqParam memberReqParam) throws IOException, ParseException{
		memberReqParam.setCardStatus("0");
		List<Member> memberList = memberService.listMember(memberReqParam);
		if(memberList!=null && memberList.size()!=0) {
			for(int i=0;i<memberList.size();i++) {
				if("1".equals(memberList.get(i).getSex())) {
					memberList.get(i).setSexS("男");
				} else {
					memberList.get(i).setSexS("女");
				}
				String dateString = dateFormat.format(memberList.get(i).getOpenDate());
				memberList.get(i).setOpenDateString(dateString);
			}
		}
		int totalPageCount = memberService.totalPageCount(memberReqParam);
		List<MemberResponseRow> memberResponseList = new ArrayList<MemberResponseRow>();
		
		for (int i=0;i<memberList.size();i++) {
			MemberResponseRow memberResponseRow = new MemberResponseRow(i, memberList.get(i));
			memberResponseList.add(memberResponseRow);
		}
		
		MemberResponse memberResponse=new MemberResponse();
		memberResponse.setPage(memberReqParam.getPage());        //设置
		memberResponse.setTotal(totalPageCount);
		memberResponse.setRows(memberResponseList);
		Gson gson = new Gson();
		String resultString = gson.toJson(memberResponse);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(resultString);
		out.close();
	}
		
	@Transactional
	@RequestMapping(value = "/saveCardNoForReCreateCard")
	public ModelAndView reCreateCardNo(Member member,HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		PointInfo pointInfo = new PointInfo();
		pointInfo.setMemberId(member.getMemberID());
		pointInfo.setCardNo(member.getCardNo());
		if(memberService.updateCardNo(member) == false) {
		    mv.addObject("msg", "补卡失败!请稍后重试!");
		}else {
			pointService.updatePointInfoSelective(pointInfo);
			mv.addObject("msg", "补卡成功!");
		}
		mv.setViewName("admin/save_result");
		return mv;
	}
	
	@RequestMapping(value = "/editCardStatusForLossCard")
	public ModelAndView editCardStatusForLossCard(@RequestParam String memberID) {
		ModelAndView mv = new ModelAndView();
		Member member = memberService.getMemberByID(memberID);
		mv.addObject("editMember",member);
		mv.setViewName("member/memberLossCardInfo");
		return mv;
	}
	
	@Transactional
	@RequestMapping(value = "/saveCardStatusForLossCard")
	public ModelAndView saveCardStatusForLossCard(Member member,HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		member.setCardStatus("1");
		if(memberService.updateCardStatus(member) == false) {
		    mv.addObject("msg", "挂失失败!请稍后重试!");
		}else {
			mv.addObject("msg", "挂失成功!");
		}
		mv.setViewName("admin/save_result");
		return mv;
	}
	
	@Transactional
	@RequestMapping(value = "/saveCardNoForRecreateCard")
	public ModelAndView resaveCardNo(Member member,HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		Admin admin = (Admin)session.getAttribute("admin");
		BigDecimal leftAmount = new BigDecimal("0.0");
		PointInfo pointInfo = new PointInfo();
		pointInfo.setMemberId(member.getMemberID());
		pointInfo.setCardNo(member.getCardNo());
		pointInfo.setName(member.getName());
		pointInfo.setIdNumber(member.getIdNumber());
		pointInfo.setLeftPoints(0);
		pointInfo.setLeftAmount(leftAmount);
		pointInfo.setCreateTime(new Date());
		pointInfo.setCreator(admin.getAdminName());
		if(memberService.updateCardNo(member) == false) {
		    mv.addObject("msg", "建卡失败!请稍后重试!");
		}else {
			pointService.insertPointInfo(pointInfo);
			mv.addObject("msg", "建卡成功!");
		}
		mv.setViewName("admin/save_result");
		return mv;
	}
	
	@RequestMapping(value = "/saveMember", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView toSave(Member member,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Admin admin = (Admin)session.getAttribute("admin");
		member.setCardStatus("0");//启用
		member.setCardGrade("1");//暂时就一种卡等级
		member.setIdCardType("1");//1.身份证
		member.setOpenDate(new Date());
		if(member.getMemberID() == null || member.getMemberID() == "")
		{
//			Calendar c = Calendar.getInstance();
//			String memberID = "" + c.get(Calendar.YEAR) + c.get((Calendar.MONTH) + 1) + c.get(Calendar.DAY_OF_MONTH) + c.get(Calendar.HOUR_OF_DAY) + c.get(Calendar.MINUTE) + c.get(Calendar.SECOND);
			String idNumber = member.getIdNumber();
			String birthDayString = idNumber.substring(6,9) + "-" + idNumber.substring(10,11) + "-" + idNumber.substring(12,13);
			member.setBirthDate(birthDayString);
			Date currentTime = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String dateString = formatter.format(currentTime);
			member.setMemberID(dateString);
			if(memberService.insertMember(member) == false)
			{
				if(admin != null) {
					mv.addObject("msg", "添加会员失败!");
				} else {
					mv.addObject("msg", "会员注册失败!");
				}
			}
			else
			{
				if(admin != null) {
					mv.addObject("msg", "添加会员成功!");
				} else {
					mv.addObject("msg", "会员注册成功!");
				}
			}
		}
		else
		{
			if(memberService.updateMember(member) == false)
			{
				mv.addObject("msg", "保存失败!");
			}
			else
			{
				mv.addObject("msg", "保存成功!");
			}
		}
		mv.setViewName("admin/save_result");
		return mv;
	}
	
	@RequestMapping(value = "/memberPoints")
	public String memberPoints()
	{
		return "member/memberPoints";
	}
	
	@RequestMapping(value = "/memberPointsSearch")
	public String memberPointsSearch()
	{
		return "member/memberPointsSearch";
	}
	
	@RequestMapping(value = "/addPoints")
	public ModelAndView addPoints(@RequestParam String memberId)
	{
		ModelAndView mv = new ModelAndView();
		PointInfo pointInfo = pointService.queryPointInfoByMemberId(memberId);
		mv.addObject("memberForPoints",pointInfo);
		mv.setViewName("member/memberPointsInfo");
		return mv;
	}
	
	
	
	@RequestMapping(value = "/reducePoints")
	public ModelAndView reducePoints(@RequestParam String memberId)
	{
		ModelAndView mv = new ModelAndView();
		PointInfo pointInfo = pointService.queryPointInfoByMemberId(memberId);
		mv.addObject("memberForPoints",pointInfo);
		mv.setViewName("member/reduceMemberPointsInfo");
		return mv;
	}
	
	@Transactional
	@RequestMapping(value = "/confirmAddPoints")
	public ModelAndView confirmAddPoints(PointRecord pointRecord,HttpSession session)
	{
        ModelAndView mv = new ModelAndView();
        
        Admin admin = (Admin)session.getAttribute("admin");
        
        String cardNo = pointRecord.getCardNo();
        Integer changePoints = pointRecord.getChangePoints();
        PointInfo pointInfo = pointService.queryPointInfo(cardNo);
        pointInfo.setLeftPoints(pointInfo.getLeftPoints()+changePoints);
        int result1 = pointService.updatePointInfo(pointInfo);
        
        pointRecord.setMemberId(pointInfo.getMemberId());
        pointRecord.setOperationType("1");   //1.增加 2.减少
        pointRecord.setCreateTime(new Date());
        pointRecord.setCreator(admin.getAdminName());
        int result2 = pointService.insertPointRecord(pointRecord);
        
		if(result1==1 && result2 == 1)
		{
			mv.addObject("msg", "保存成功!");
		}
		else
		{
			mv.addObject("msg", "保存失败!");
		}
		mv.setViewName("admin/save_result");
		return mv;
	}
	
	@RequestMapping(value = "/confirmReducePoints")
	public ModelAndView confirmReducePoints(PointRecord pointRecord,HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
        
        Admin admin = (Admin)session.getAttribute("admin");
        
        String cardNo = pointRecord.getCardNo();
        Integer changePoints = pointRecord.getChangePoints();
        PointInfo pointInfo = pointService.queryPointInfo(cardNo);
        if(pointInfo.getLeftPoints() >= changePoints) {
        	pointInfo.setLeftPoints(pointInfo.getLeftPoints()-changePoints);
            int result1 = pointService.updatePointInfo(pointInfo);
            
            pointRecord.setMemberId(pointInfo.getMemberId());
            pointRecord.setOperationType("2");   //1.增加 2.减少
            pointRecord.setCreateTime(new Date());
            pointRecord.setCreator(admin.getAdminName());
            int result2 = pointService.insertPointRecord(pointRecord);
            
    		if(result1==1 && result2 == 1)
    		{
    			mv.addObject("msg", "保存成功!");
    		}
    		else
    		{
    			mv.addObject("msg", "保存失败!");
    		}
        } else {
        	mv.addObject("msg", "剩余积分不足!");
        }
        
		mv.setViewName("admin/save_result");
		return mv;
	}
	
	@RequestMapping(value = "/saveMemberPoints")
	public ModelAndView savePoints(Member member)
	{
        ModelAndView mv = new ModelAndView();
		if(memberService.updateMemberPoints(member) == false)
		{
			mv.addObject("msg", "保存失败!");
		}
		else
		{
			mv.addObject("msg", "保存成功!");
		}
		mv.setViewName("admin/save_result");
		return mv;
	}
	
	@RequestMapping(value = "/memberPointsHistory")
	public String memberPointsHistory()
	{
		return "member/memberPointsHistory";
	}
	
	@RequestMapping(value = "/memberExchangeHistory")
	public String memberExchangeHistory()
	{
		return "member/memberExchangeHistory";
	}
	
	@RequestMapping(value = "/memberRechargeHistory")
	public String memberRechargeHistory() {
		return "member/memberRechargeHistory";
	}
	
	@RequestMapping(value = "/deleteMembers")
	public void toDelete(@RequestParam String ids, PrintWriter out) {
		String[] allId = ids.split(",");
		memberService.deleteMembers(allId);
		String msg ="{\"result\":\"success\"}";
		out.write(msg);
		out.close();
	}
	
	
	@RequestMapping(value = "/listPointsHistory")
	public void listPointsHistory(HttpServletResponse response,MemberReqParam memberReqParam) throws IOException, ParseException{
		List<Member> memberList = memberService.listMember(memberReqParam);
		int totalPageCount = memberService.totalPageCount(memberReqParam);
		List<MemberResponseRow> memberResponseList = new ArrayList<MemberResponseRow>();
		
		for (int i=0;i<memberList.size();i++) {
			MemberResponseRow memberResponseRow = new MemberResponseRow(i, memberList.get(i));
			memberResponseList.add(memberResponseRow);
		}
		
		MemberResponse memberResponse=new MemberResponse();
		memberResponse.setPage(memberReqParam.getPage());        //设置
		memberResponse.setTotal(totalPageCount);
		memberResponse.setRows(memberResponseList);
		Gson gson = new Gson();
		String resultString = gson.toJson(memberResponse);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write(resultString);
		out.close();
	}
	
	@RequestMapping(value = "/memberLogin")
	public String memberLogin() {
		return "member/index";
	}
	
	@RequestMapping(value = "/memberRecharge")
	public String memberRecharge() {
		return "member/memberRecharge";
	}
	
	@RequestMapping(value = "/memberCreateCard")
	public String memeberCreateCard() {
		return "member/memberCreateCard";
	}
	
	@RequestMapping(value = "/memberRecreateCard")
	public String memeberRecreateCard() {
		return "member/memberRecreateCard";
	}
	
	@RequestMapping(value = "/register")
	public String memeberRegister() {
		return "member/memberRegister";
	}
}
