package com.medicalsupport.mapper;

import java.util.List;

import com.medicalsupport.entity.Admin;
import com.medicalsupport.entity.PointInfo;
import com.medicalsupport.httpentity.AdminReqParam;
import com.medicalsupport.httpentity.MemberReqParam;


public interface PointInfoMapper {
    public int updatePointInfo(PointInfo pointInfo);
    
    public int updatePointOnly(PointInfo pointInfo);
    
    public PointInfo selectPointInfo(String cardNo);
    
    public PointInfo selectPointInfoByIdNumber(String idNumber);
    
    public PointInfo selectPointInfoByMemberId(String memberId);
    
    public int updatePointInfoSelective(PointInfo pointInfo);
    
    public int insert(PointInfo pointInfo);
    
    public List<PointInfo> listPointInfo(MemberReqParam memberReqParam);
    
    public int totalPageCountOfPointInfo(MemberReqParam memberReqParam);
}
