package com.medicalsupport.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medicalsupport.entity.PointExchange;
import com.medicalsupport.entity.PointInfo;
import com.medicalsupport.entity.PointRecord;
import com.medicalsupport.entity.RechargeRecord;
import com.medicalsupport.httpentity.MemberReqParam;
import com.medicalsupport.httpentity.PointExchangeReqParam;
import com.medicalsupport.mapper.PointExchangeMapper;
import com.medicalsupport.mapper.PointInfoMapper;
import com.medicalsupport.mapper.PointRecordMapper;
import com.medicalsupport.mapper.RechargeRecordMapper;
import com.medicalsupport.service.PointService;

@Service
public class PointServiceImpl implements PointService {
	
	@Autowired
	PointInfoMapper pointInfoMapper;
	
	@Autowired
	PointExchangeMapper pointExchangeMapper;
	
	@Autowired
	RechargeRecordMapper rechargeRecordMapper;
	
	@Autowired
	PointRecordMapper pointRecordMapper;
	
    //积分充值
	public int pointRecharge(PointInfo pointInfo){
		return pointInfoMapper.updatePointInfo(pointInfo);
    }
	
	//查询积分信息
	public PointInfo queryPointInfo(String cardNo){
		PointInfo pointInfo = new PointInfo();
		pointInfo = pointInfoMapper.selectPointInfo(cardNo);
		return pointInfo;
	}
	
	//通过身份证号查询积分信息
	public PointInfo queryPointInfoByIdNumber(String idNumber){
		PointInfo pointInfo = new PointInfo();
		pointInfo = pointInfoMapper.selectPointInfoByIdNumber(idNumber);
		return pointInfo;
	}
	
	public PointInfo queryPointInfoByMemberId(String memberId) {
		PointInfo pointInfo = new PointInfo();
		pointInfo = pointInfoMapper.selectPointInfoByMemberId(memberId);
		return pointInfo;
	}
	
	//更新充值信息
	public int updatePointInfo(PointInfo pointInfo){
		
		return pointInfoMapper.updatePointInfo(pointInfo);
	}
	
	public int updatePointOnly(PointInfo pointInfo){
		
		return pointInfoMapper.updatePointOnly(pointInfo);
	}
	
    public int updatePointInfoSelective(PointInfo pointInfo){
		
		return pointInfoMapper.updatePointInfoSelective(pointInfo);
	}
    
    //插入积分兑换流水
    public int insertPointExchange(PointExchange pointExchange){
    	return pointExchangeMapper.insertPointExchange(pointExchange);
    }
    
    //查询积分兑换流水
    public List<PointExchange> queryPointExchange(PointExchangeReqParam pointExchangeReqParam){
    	return pointExchangeMapper.queryPointExchange(pointExchangeReqParam);
    }
    
    public int totalPageCount(PointExchangeReqParam pointExchangeReqParam){
    	return pointExchangeMapper.totalPageCount(pointExchangeReqParam);
    }
    
    public int insertPointInfo(PointInfo pointInfo){
    	return pointInfoMapper.insert(pointInfo);
    }
    
  //插入充值流水
  	public int insertRechargeRecord(RechargeRecord rechargeRecord){
  		return rechargeRecordMapper.insert(rechargeRecord);
  	}
  	
  	//查询充值流水
  	public List<RechargeRecord> listMemberRechargeHistory(MemberReqParam memberReqParam){
  		return rechargeRecordMapper.selectMemberRechargeHistory(memberReqParam);
  	}
  	
  	public int totalPageCountOfMemberRechargeHistory(MemberReqParam memberReqParam){
  		return rechargeRecordMapper.totalPageCount(memberReqParam);
  	}
  	
  	public List<PointInfo> listPointInfo(MemberReqParam memberReqParam) {
  		return pointInfoMapper.listPointInfo(memberReqParam);
  	}
  	
  	public int totalPageCountOfPointInfo(MemberReqParam memberReqParam) {
  		return pointInfoMapper.totalPageCountOfPointInfo(memberReqParam);
  	}
  	
  	public List<PointRecord> queryPointRecord(MemberReqParam memberReqParam) {
  		return pointRecordMapper.listPointRecord(memberReqParam);
  	}
	
	public int totalCountPointRecord(MemberReqParam memberReqParam) {
		return pointRecordMapper.totalCountPointRecord(memberReqParam);
	}
	
	public int insertPointRecord(PointRecord pointRecord) {
		return pointRecordMapper.insertPointRecord(pointRecord);
	}
}
