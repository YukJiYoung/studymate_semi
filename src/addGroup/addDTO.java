package addGroup;

import java.sql.Timestamp;

// 스터디 모임 정보 
public class addDTO {

    // 스터디 모임 번호 
    private Integer groupNum;

    // 그룹장 
    private String id;

    // 모임명 
    private String groupName;

    // 이미지 경로 레코드 생성 시 기본이미지 경로 지정
    private String imagePath;

    // 등록시간 
    private Timestamp createDate;

    // 찜횟수 
    private Integer zzimCount;

    // 모임인원 
    private Integer maxMember;

    // 현재인원 
    private Integer nowMember;

    // 모집기간 
    private String limitDate;

    // 모임요일 
    private int meetingCount;

    // 장소 
    private String location;

    // 대표연락처 
    private String tel;

    // 모임소개 
    private String introduce;
    
    

    // 카테고리코드(대) 
    private Integer bcategorycode;

    // 카테고리코드(소) 
    private String scategorycode;
    
    //그룹 멤버
    private String member;
    
    //그룹 신청 목록
    private String person;
    
    public String getMember() {
		return member;
	}

	public void setMember(String member) {
		this.member = member;
	}

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public String getScategorycode() {
      return scategorycode;
   }

   public void setScategorycode(String scategorycode) {
      this.scategorycode = scategorycode;
   }

   // 회비 
    private Integer money;

    // 모임목표 
    private String groupGoal;

    // 모집대상 
    private String target;

   public Integer getGroupNum() {
      return groupNum;
   }

   public void setGroupNum(Integer groupNum) {
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

   public String getImagePath() {
      return imagePath;
   }

   public void setImagePath(String imagePath) {
      this.imagePath = imagePath;
   }

   public Timestamp getCreateDate() {
      return createDate;
   }

   public void setCreateDate(Timestamp timestamp) {
      this.createDate = timestamp;
   }

   public Integer getZzimCount() {
      return zzimCount;
   }

   public void setZzimCount(Integer zzimCount) {
      this.zzimCount = zzimCount;
   }

   public Integer getMaxMember() {
      return maxMember;
   }

   public void setMaxMember(Integer maxMember) {
      this.maxMember = maxMember;
   }

   public Integer getNowMember() {
      return nowMember;
   }

   public void setNowMember(Integer nowMember) {
      this.nowMember = nowMember;
   }

   public String getLimitDate() {
      return limitDate;
   }

   public void setLimitDate(String limitDate) {
      this.limitDate = limitDate;
   }

   public int getMeetingCount() {
      return meetingCount;
   }

   public void setMeetingCount(int meetingcount) {
      this.meetingCount = meetingcount;
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

   
   

   

   public Integer getBcategorycode() {
      return bcategorycode;
   }

   public void setBcategorycode(Integer bcategorycode) {
      this.bcategorycode = bcategorycode;
   }

   public Integer getMoney() {
      return money;
   }

   public void setMoney(Integer money) {
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

    
    
  }