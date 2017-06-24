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
	
    //���ֳ�ֵ
	public int pointRecharge(PointInfo pointInfo){
		return pointInfoMapper.updatePointInfo(pointInfo);
    }
	
	//��ѯ������Ϣ
	public PointInfo queryPointInfo(String cardNo){
		PointInfo pointInfo = new PointInfo();
		pointInfo = pointInfoMapper.selectPointInfo(cardNo);
		return pointInfo;
	}
	
	//ͨ������֤�Ų�ѯ������Ϣ
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
	
	//���³�ֵ��Ϣ
	public int updatePointInfo(PointInfo pointInfo){
		
		return pointInfoMapper.updatePointInfo(pointInfo);
	}
	
	public int updatePointOnly(PointInfo pointInfo){
		
		return pointInfoMapper.updatePointOnly(pointInfo);
	}
	
    public int updatePointInfoSelective(PointInfo pointInfo){
		
		return pointInfoMapper.updatePointInfoSelective(pointInfo);
	}
    
    //������ֶһ���ˮ
    public int insertPointExchange(PointExchange pointExchange){
    	return pointExchangeMapper.insertPointExchange(pointExchange);
    }
    
    //��ѯ���ֶһ���ˮ
    public List<PointExchange> queryPointExchange(PointExchangeReqParam pointExchangeReqParam){
    	return pointExchangeMapper.queryPointExchange(pointExchangeReqParam);
    }
    
    public int totalPageCount(PointExchangeReqParam pointExchangeReqParam){
    	return pointExchangeMapper.totalPageCount(pointExchangeReqParam);
    }
    
    public int insertPointInfo(PointInfo pointInfo){
    	return pointInfoMapper.insert(pointInfo);
    }
    
  //�����ֵ��ˮ
  	public int insertRechargeRecord(RechargeRecord rechargeRecord){
  		return rechargeRecordMapper.insert(rechargeRecord);
  	}
  	
  	//��ѯ��ֵ��ˮ
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