package addGroup;

import java.util.Date;
import java.sql.Timestamp;


//스터디 모임 정보 
public class addDTO {

 // 스터디 모임 번호 
 private int groupNum;

 // 그룹장 
 private String id;

 // 모임명 
 private String groupName;

 // 이미지 경로 레코드 생성 시 기본이미지 경로 지정
 private String groupImage;

 // 내용 
 private String content;

 // 등록시간 
 private Timestamp createDate;

 // 찜횟수 
 private int zzimCount;

 // 모임인원 
 private int maxMember;

 // 현재인원 default 1
 private int nowMember;

 // 모집기간 
 private String limitDate;

 // 모임요일
 private String possibleDay;

 // 장소 
 private String location;

 // 대표연락처 
 private String tel;

 // 모임소개 
 private String introduce;

 // 카테고리코드(대) 
 private String bc;

 // 카테고리코드(소) 
 private String sc;

 // 회비 
 private String money;



 // 모임목표 
 private String groupGoal;

 // 모집대상 
 private String target;

 

public int getGroupNum() {
	return groupNum;
}

public void setGroupNum(int groupNum) {
	this.groupNum = groupNum;
}

public String getId() {
	return id;
}

public void setId(String id) {
	this.id = id;
}

public String getGroupName() {
	return groupName;
}

public void setGroupName(String groupName) {
	this.groupName = groupName;
}

public String getGroupImage() {
	return groupImage;
}

public void setGroupImage(String groupImage) {
	this.groupImage = groupImage;
}

public String getContent() {
	return content;
}

public void setContent(String content) {
	this.content = content;
}



public Timestamp getCreateDate() {
	return createDate;
}

public void setCreateDate(Timestamp createDate) {
	this.createDate = createDate;
}

public int getZzimCount() {
	return zzimCount;
}

public void setZzimCount(int zzimCount) {
	this.zzimCount = zzimCount;
}

public int getMaxMember() {
	return maxMember;
}

public void setMaxMember(int maxMember) {
	this.maxMember = maxMember;
}

public int getNowMember() {
	return nowMember;
}

public void setNowMember(int nowMember) {
	this.nowMember = nowMember;
}



public String getLimitDate() {
	return limitDate;
}

public void setLimitDate(String limitDate) {
	this.limitDate = limitDate;
}

public String getLocation() {
	return location;
}

public void setLocation(String location) {
	this.location = location;
}

public String getTel() {
	return tel;
}

public void setTel(String tel) {
	this.tel = tel;
}

public String getIntroduce() {
	return introduce;
}

public void setIntroduce(String introduce) {
	this.introduce = introduce;
}



public String getBc() {
	return bc;
}

public void setBc(String bc) {
	this.bc = bc;
}

public String getSc() {
	return sc;
}

public void setSc(String sc) {
	this.sc = sc;
}



public String getMoney() {
	return money;
}

public void setMoney(String money) {
	this.money = money;
}

public String getGroupGoal() {
	return groupGoal;
}

public void setGroupGoal(String groupGoal) {
	this.groupGoal = groupGoal;
}

public String getTarget() {
	return target;
}

public void setTarget(String target) {
	this.target = target;
}

public String getPossibleDay() {
	return possibleDay;
}

public void setPossibleDay(String possibleDay) {
	this.possibleDay = possibleDay;
}




 
}