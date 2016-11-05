

package addGroup;

import java.util.Date;
import java.sql.Timestamp;


public class addDTO {
	
	private String groupNum;
	private String id;
	private Timestamp createDate;
	private String zzimCount;
	private String nowMember;
	
	private String groupName;
	private String imagePath;
	private String maxMember;
	private String limitDate; //모집기간(1주~4주) 
	private String location;
	private String tel;
	private String bcategorycode;
	private String scategorycode;
	private String introduce;
	private String money;
	private String regQuestion;
	private String groupGoal;
	private String target;
	
	public String getGroupNum() {
		return groupNum;
	}
	public void setGroupNum(String groupNum) {
		this.groupNum = groupNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public String getZzimCount() {
		return zzimCount;
	}
	public void setZzimCount(String zzimCount) {
		this.zzimCount = zzimCount;
	}
	public String getNowMember() {
		return nowMember;
	}
	public void setNowMember(String nowMember) {
		this.nowMember = nowMember;
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
	
	public String getMaxMember() {
		return maxMember;
	}
	public void setMaxMember(String maxMember) {
		this.maxMember = maxMember;
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
	public String getBcategorycode() {
		return bcategorycode;
	}
	public void setBcategorycode(String bcategorycode) {
		this.bcategorycode = bcategorycode;
	}
	public String getScategorycode() {
		return scategorycode;
	}
	public void setScategorycode(String scategorycode) {
		this.scategorycode = scategorycode;
	}
	
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getRegQuestion() {
		return regQuestion;
	}
	public void setRegQuestion(String regQuestion) {
		this.regQuestion = regQuestion;
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
