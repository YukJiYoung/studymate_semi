package customerboard;

import java.sql.Timestamp;
public class BoardDataBean {
	
	private int qNum;
	private String qWriter;
	private String qTitle;
	private String email;
	private String qContent;
	private String passwd;
	private Timestamp qDate;
	private int readcount;
	private String ip;
	public int getqNum() {
		return qNum;
	}
	public void setqNum(int qNum) {
		this.qNum = qNum;
	}
	public String getqWriter() {
		return qWriter;
	}
	public void setqWriter(String qWriter) {
		this.qWriter = qWriter;
	}
	public String getqTitle() {
		return qTitle;
	}
	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Timestamp getqDate() {
		return qDate;
	}
	public void setqDate(Timestamp qDate) {
		this.qDate = qDate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRefStep() {
		return refStep;
	}
	public void setRefStep(int refStep) {
		this.refStep = refStep;
	}
	public int getRefLevel() {
		return refLevel;
	}
	public void setRefLevel(int refLevel) {
		this.refLevel = refLevel;
	}
	private int ref;
	private int refStep;
	private int refLevel;

	

}
