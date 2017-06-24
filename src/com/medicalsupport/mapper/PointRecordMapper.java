package com.medicalsupport.mapper;

import java.util.List;

import com.medicalsupport.entity.Admin;
import com.medicalsupport.entity.PointInfo;
import com.medicalsupport.entity.PointRecord;
import com.medicalsupport.httpentity.AdminReqParam;
import com.medicalsupport.httpentity.MemberReqParam;


public interface PointRecordMapper {
    public int updatePointInfo(PointInfo pointInfo);
    
    public PointInfo selectPointInfo(String cardNo);
    
    public PointInfo selectPointInfoByIdNumber(String idNumber);
    
    public PointInfo selectPointInfoByMemberId(String memberId);
    
    public int updatePointInfoSelective(PointInfo pointInfo);
    
    public int insert(PointInfo pointInfo);
    
    public List<PointRecord> listPointRecord(MemberReqParam memberReqParam);
    
    public int totalCountPointRecord(MemberReqParam memberReqParam);
    
    public int insertPointRecord(PointRecord pointRecord);
}
