package com.medicalsupport.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medicalsupport.entity.Member;
import com.medicalsupport.service.MemberService;
import com.medicalsupport.httpentity.MemberReqParam;
import com.medicalsupport.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper memberMapper;
	
	public List<Member> listMember(MemberReqParam memberReqParam){
		return memberMapper.listMember(memberReqParam);
	}
	
	public List<Member> listMemberForCreateCard(MemberReqParam memberReqParam){
		return memberMapper.listMemberForCreateCard(memberReqParam);
	}
	
	public List<Member> listMemberForReCreateCard(MemberReqParam memberReqParam){
		return memberMapper.listMemberForReCreateCard(memberReqParam);
	}
	
	public int totalPageCount(MemberReqParam memberReqParam){
		return memberMapper.totalPageCount(memberReqParam);
	}
	
	public int totalPageCountForCreateCard(MemberReqParam memberReqParam) {
		return memberMapper.totalPageCountForCreateCard(memberReqParam);
	}
	
	public Member getMemberByID(String memberID){ 
		return memberMapper.getMemberByID(memberID);
	}
	
	public boolean insertMember(Member member){
		int count = memberMapper.insertMember(member);
		
		if(count==1){
			return true;
		}
		else{
			return false;
		}
	}

	public boolean updateMember(Member member){
        int count = memberMapper.updateMember(member);
		
		if(count==1){
			return true;
		}
		else{
			return false;
		}
	}
	
	public boolean updateCardNo(Member member) {
		int count = memberMapper.updateCardNo(member);
		
		if(count==1){
			return true;
		}else{
			return false;
		}
	}
	
	public boolean updateCardStatus(Member member) {
		int count = memberMapper.updateCardStatus(member);
		
		if(count==1){
			return true;
		}else{
			return false;
		}
	}
	
	public boolean updateMemberPoints(Member member){
		int count = memberMapper.updateMemberPoints(member);
		
		if(count==1){
			return true;
		}
		else{
			return false;
		}
	}
	
	public void deleteMembers(String[] allId){
		memberMapper.deleteMembers(allId);
	}
}
