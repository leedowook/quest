package kr.co.pro.vo;

import java.sql.Date;

public class userVo {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_phone;
	private Date user_crdate;
	private int enable;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public Date getUser_crdate() {
		return user_crdate;
	}
	public void setUser_crdate(Date user_crdate) {
		this.user_crdate = user_crdate;
	}
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	@Override
	public String toString() {
		return "userVo [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_phone="
				+ user_phone + ", user_crdate=" + user_crdate + ", enable=" + enable + "]";
	}
	public userVo(String user_id, String user_pw, String user_name, String user_phone, Date user_crdate, int enable) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_crdate = user_crdate;
		this.enable = enable;
	}
	public userVo() {
		super();
		
	}
	
}
