package logon;
import java.sql.Timestamp;

public class LogonDataBean {
	
	private String id;
	private String passwd;
	private String name;
	private String gender;
	private String birthday;
	private String tel;
	private Timestamp regdate;
	private String email;
	private String location;
	private String scategorycode;
	private String zzimlist;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}

	public String getScategorycode() {
		return scategorycode;
	}
	public void setScategorycode(String scategorycode) {
		this.scategorycode = scategorycode;
	}
	public String getZzimlist() {
		return zzimlist;
	}
	public void setZzimlist(String zzimlist) {
		this.zzimlist = zzimlist;
	}

}