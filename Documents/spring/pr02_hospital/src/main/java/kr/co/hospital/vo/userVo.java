package kr.co.hospital.vo;

public class userVo {
	private String name;
	private String grade;
	public String getUser() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "userVo [name=" + name + ", grade=" + grade + "]";
	}
	public userVo(String name, String grade) {
		super();
		this.name = name;
		this.grade = grade;
	}
	public userVo() {
		super();
	
	}
	

}
