package com.medicalsupport.mapper;

import com.medicalsupport.httpentity.MemberReqParam;

import java.util.List;

import com.medicalsupport.entity.Member;

public interface MemberMapper {
    public List<Member> listMember(MemberReqParam memberReqParam);
    
    public int totalPageCount(MemberReqParam memberReqParam);
    
    public int totalPageCountForCreateCard(MemberReqParam memberReqParam);
    
    public Member getMemberByID(String memberID);
    
    public int insertMember(Member member);
    
    public int updateMember(Member member);
    
    public int updateMemberPoints(Member member);
    
    public void deleteMembers(String[] allId);
    
    public List<Member> listMemberForCreateCard(MemberReqParam memberReqParam);
    
    public List<Member> listMemberForReCreateCard(MemberReqParam memberReqParam);
    
    int updateCardNo(Member member);
    
    int updateCardStatus(Member member);
}
