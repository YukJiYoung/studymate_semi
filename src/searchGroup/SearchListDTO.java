package searchGroup;
import java.sql.Timestamp; 

public class SearchListDTO{
    private int num;
    private String bcategory;
    private String scategory;
    private String title;
    private String host;
    private String status;
    private String introduce;
    private Timestamp duedate;
    private int recommendcount;
    private int currentnum;
    private int total;
    private String imgpath;
    
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getBcategory() {
		return bcategory;
	}
	public void setBcategory(String bcategory) {
		this.bcategory = bcategory;
	}
	public String getScategory() {
		return scategory;
	}
	public void setScategory(String scategory) {
		this.scategory = scategory;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public Timestamp getDuedate() {
		return duedate;
	}
	public void setDuedate(Timestamp duedate) {
		this.duedate = duedate;
	}
	public int getRecommendcount() {
		return recommendcount;
	}
	public void setRecommendcount(int recommendcount) {
		this.recommendcount = recommendcount;
	}
	public int getCurrentnum() {
		return currentnum;
	}
	public void setCurrentnum(int currentnum) {
		this.currentnum = currentnum;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
    
}