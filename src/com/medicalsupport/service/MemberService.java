package com.medicalsupport.service;

import java.util.List;

import com.medicalsupport.entity.Member;
import com.medicalsupport.httpentity.MemberReqParam;

public interface MemberService {
	List<Member> listMember(MemberReqParam memberReqParam);
	
	List<Member> listMemberForCreateCard(MemberReqParam memberReqParam);
	
	List<Member> listMemberForReCreateCard(MemberReqParam memberReqParam);
	
	int totalPageCount(MemberReqParam memberReqParam);
	
	int totalPageCountForCreateCard(MemberReqParam memberReqParam);
	
	Member getMemberByID(String memberID);
	
	boolean insertMember(Member member);

	boolean updateMember(Member member);
	
	boolean updateMemberPoints(Member member);
	
	void deleteMembers(String[] allId);
	
	boolean updateCardNo(Member member);
	
	boolean updateCardStatus(Member member);
	
}
