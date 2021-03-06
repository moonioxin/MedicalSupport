package com.medicalsupport.entity;

import java.sql.Timestamp;
import java.util.Date;


public class Member {
    private String memberID;
    private String cardNo;
    private String cardCode;
    private String cardStatus; //使用char获取不到值
    private String cardGrade;    //同上
    private String name;
    private String sex;            //同上
    private String sexS;           //用于转换性别显示
    private String birthDate;
    private String idCardType;     //同上
    private String idNumber;
    private String telephone;
    private String mobile;
    private String emergencyPhone;
    private String email;
    private String address;         
    private String zipCode;         
    private Date openDate;
    private String openDateString;
    private Date validateDate;    
    private Double discount;        
    private Double balance;
    private String password;
    private int totalPoints;     
    private Double totalConsumption;
    private Double totalRecharge;   
    private int totalCount;      
    private int maxCount;        
    private String portraint;       
    private String attachGUID;      
    private String note;            
    private String province;        
    private String city;            
    private String district;        
    private String hometown;        
    private String nationality;     
    private String creator;         
    private Date createTime;
    private String editor;          
    private Date editTime;        
    private String deptID;          
    private String companyID;       
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String carNo) {
		this.cardNo = carNo;
	}
	public String getCardCode() {
		return cardCode;
	}
	public void setCardCode(String cardCode) {
		this.cardCode = cardCode;
	}
	public String getCardStatus() {
		return cardStatus;
	}
	public void setCardStatus(String cardStatus) {
		this.cardStatus = cardStatus;
	}
	public String getCardGrade() {
		return cardGrade;
	}
	public void setCardGrade(String cardGrade) {
		this.cardGrade = cardGrade;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getIdCardType() {
		return idCardType;
	}
	public void setIdCardType(String idCardType) {
		this.idCardType = idCardType;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmergencyPhone() {
		return emergencyPhone;
	}
	public void setEmergencyPhone(String emergencyPhone) {
		this.emergencyPhone = emergencyPhone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	public Double getBalance() {
		return balance;
	}
	public void setBalance(Double balance) {
		this.balance = balance;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getTotalPoints() {
		return totalPoints;
	}
	public void setTotalPoints(int totalPoints) {
		this.totalPoints = totalPoints;
	}
	public Double getTotalConsumption() {
		return totalConsumption;
	}
	public void setTotalConsumption(Double totalConsumption) {
		this.totalConsumption = totalConsumption;
	}
	public Double getTotalRecharge() {
		return totalRecharge;
	}
	public void setTotalRecharge(Double totalRecharge) {
		this.totalRecharge = totalRecharge;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getMaxCount() {
		return maxCount;
	}
	public void setMaxCount(int maxCount) {
		this.maxCount = maxCount;
	}
	public String getPortraint() {
		return portraint;
	}
	public void setPortraint(String portraint) {
		this.portraint = portraint;
	}
	public String getAttachGUID() {
		return attachGUID;
	}
	public void setAttachGUID(String attachGUID) {
		this.attachGUID = attachGUID;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getHometown() {
		return hometown;
	}
	public void setHometown(String hometown) {
		this.hometown = hometown;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getEditor() {
		return editor;
	}
	public void setEditor(String editor) {
		this.editor = editor;
	}
	
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getEditTime() {
		return editTime;
	}
	public void setEditTime(Date editTime) {
		this.editTime = editTime;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getDeptID() {
		return deptID;
	}
	public void setDeptID(String deptID) {
		this.deptID = deptID;
	}
	public String getCompanyID() {
		return companyID;
	}
	public void setCompanyID(String companyID) {
		this.companyID = companyID;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public Date getOpenDate() {
		return openDate;
	}
	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}
	public Date getValidateDate() {
		return validateDate;
	}
	public void setValidateDate(Date validateDate) {
		this.validateDate = validateDate;
	}
	public String getSexS() {
		return sexS;
	}
	public void setSexS(String sexS) {
		this.sexS = sexS;
	}
	public String getOpenDateString() {
		return openDateString;
	}
	public void setOpenDateString(String openDateString) {
		this.openDateString = openDateString;
	}           

}
