package com.medicalsupport.service;

import java.util.List;

import com.medicalsupport.entity.PointExchange;
import com.medicalsupport.entity.PointInfo;
import com.medicalsupport.entity.PointRecord;
import com.medicalsupport.entity.RechargeRecord;
import com.medicalsupport.httpentity.MemberReqParam;
import com.medicalsupport.httpentity.PointExchangeReqParam;

public interface PointService {
    //��ֵ�����»�����Ϣ
	int pointRecharge(PointInfo pointInfo);
	
	//��ѯ������Ϣ
	PointInfo queryPointInfo(String cardNo);
	
	PointInfo queryPointInfoByIdNumber(String idNumber);
	
	PointInfo queryPointInfoByMemberId(String memberId);
	
	//���»�����Ϣ
	int updatePointInfo(PointInfo pointInfo);
	
	int updatePointOnly(PointInfo pointInfo);
	
	int updatePointInfoSelective(PointInfo pointInfo);
	
	//������ֶһ���ˮ
	int insertPointExchange(PointExchange pointExchange);
	
	//��ѯ���ֶһ���ˮ
	List<PointExchange> queryPointExchange(PointExchangeReqParam pointExchangeReqParam);
	
	int totalPageCount(PointExchangeReqParam pointExchangeReqParam);
	
	int insertPointInfo(PointInfo pointInfo);
	
	//�����ֵ��ˮ
	int insertRechargeRecord(RechargeRecord rechargeRecord);
	
	//��ѯ��ֵ��ˮ
	List<RechargeRecord> listMemberRechargeHistory(MemberReqParam memberReqParam);
	
	int totalPageCountOfMemberRechargeHistory(MemberReqParam memberReqParam);
	
	List<PointInfo> listPointInfo(MemberReqParam memberReqParam);
	
	int totalPageCountOfPointInfo(MemberReqParam memberReqParam);
	
	//��ѯ���ָ��ļ�¼
	List<PointRecord> queryPointRecord(MemberReqParam memberReqParam);
	
	int totalCountPointRecord(MemberReqParam memberReqParam);
	
	//������ָ��ļ�¼
	int insertPointRecord(PointRecord pointRecord);
}
