package addGroup;

import java.sql.Date;

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
    private Date createDate;

    // 찜횟수 
    private Integer zzimCount;

    // 모임인원 
    private Integer maxMember;

    // 현재인원 default 1
    private Integer nowMember;

    // 모집기간 
    private String limitDate;

    // 모임요일 
    private String meetingCount;

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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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

	public String getMeetingCount() {
		return meetingCount;
	}

	public void setMeetingCount(String meetingCount) {
		this.meetingCount = meetingCount;
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

	@Override
	public String toString() {
		return "addDTO [groupNum=" + groupNum + ", id=" + id + ", groupName=" + groupName + ", imagePath=" + imagePath
				+ ", createDate=" + createDate + ", zzimCount=" + zzimCount + ", maxMember=" + maxMember
				+ ", nowMember=" + nowMember + ", limitDate=" + limitDate + ", meetingCount=" + meetingCount
				+ ", location=" + location + ", tel=" + tel + ", introduce=" + introduce + ", bcategorycode="
				+ bcategorycode + ", scategorycode=" + scategorycode + ", money=" + money + ", groupGoal=" + groupGoal
				+ ", target=" + target + "]";
	}
	
    
    
  }