package com.medicalsupport.service;

import java.util.List;

import com.medicalsupport.entity.PointExchange;
import com.medicalsupport.entity.PointInfo;
import com.medicalsupport.entity.PointRecord;
import com.medicalsupport.entity.RechargeRecord;
import com.medicalsupport.httpentity.MemberReqParam;
import com.medicalsupport.httpentity.PointExchangeReqParam;

public interface PointService {
    //充值，更新积分信息
	int pointRecharge(PointInfo pointInfo);
	
	//查询积分信息
	PointInfo queryPointInfo(String cardNo);
	
	PointInfo queryPointInfoByIdNumber(String idNumber);
	
	PointInfo queryPointInfoByMemberId(String memberId);
	
	//更新积分信息
	int updatePointInfo(PointInfo pointInfo);
	
	int updatePointOnly(PointInfo pointInfo);
	
	int updatePointInfoSelective(PointInfo pointInfo);
	
	//插入积分兑换流水
	int insertPointExchange(PointExchange pointExchange);
	
	//查询积分兑换流水
	List<PointExchange> queryPointExchange(PointExchangeReqParam pointExchangeReqParam);
	
	int totalPageCount(PointExchangeReqParam pointExchangeReqParam);
	
	int insertPointInfo(PointInfo pointInfo);
	
	//插入充值流水
	int insertRechargeRecord(RechargeRecord rechargeRecord);
	
	//查询充值流水
	List<RechargeRecord> listMemberRechargeHistory(MemberReqParam memberReqParam);
	
	int totalPageCountOfMemberRechargeHistory(MemberReqParam memberReqParam);
	
	List<PointInfo> listPointInfo(MemberReqParam memberReqParam);
	
	int totalPageCountOfPointInfo(MemberReqParam memberReqParam);
	
	//查询积分更改记录
	List<PointRecord> queryPointRecord(MemberReqParam memberReqParam);
	
	int totalCountPointRecord(MemberReqParam memberReqParam);
	
	//插入积分更改记录
	int insertPointRecord(PointRecord pointRecord);
}
