package searchGroup;

import java.sql.Timestamp; 

public class SearchListDTO{
    private int groupNum;
    private String id;
    private String groupName;
    private String imagePath;
    private Timestamp createDate;
    private int zzimCount;
    private int maxMember;
    private int nowMember;
    private int meetingCount;
    private String location;
    private String introduce;
    private int bcategorycode;
    private String scategorycode;
    
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
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
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
	public int getMeetingCount() {
		return meetingCount;
	}
	public void setMeetingCount(int meetingCount) {
		this.meetingCount = meetingCount;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public int getBcategorycode() {
		return bcategorycode;
	}
	public void setBcategorycode(int bcategorycode) {
		this.bcategorycode = bcategorycode;
	}
	public String getScategorycode() {
		return scategorycode;
	}
	public void setScategorycode(String scategorycode) {
		this.scategorycode = scategorycode;
	}
	@Override
	public String toString() {
		return "SearchListDTO [groupNum=" + groupNum + ", id=" + id + ", groupName=" + groupName + ", imagePath="
				+ imagePath + ", createDate=" + createDate + ", zzimCount=" + zzimCount + ", maxMember=" + maxMember
				+ ", nowMember=" + nowMember + ", meetingCount=" + meetingCount + ", location=" + location
				+ ", introduce=" + introduce + ", bcategorycode=" + bcategorycode + ", scategorycode=" + scategorycode
				+ "]";
	}
    
}