package kr.co.pro.vo;

import java.sql.Date;

public class selectVo {
	private String InputOption;
	private String option1;
	private String option2;
	private String option3;
	private String option4;
	private String option5;
	private String option6;
	private int intoption1;
	private int intoption2;
	private int intoption3;
	private	Date dateoption1;
	private Date dateoption2;
	private	Date dateoption3;
	public String getInputOption() {
		return InputOption;
	}
	public void setInputOption(String inputOption) {
		InputOption = inputOption;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public String getOption3() {
		return option3;
	}
	public void setOption3(String option3) {
		this.option3 = option3;
	}
	public String getOption4() {
		return option4;
	}
	public void setOption4(String option4) {
		this.option4 = option4;
	}
	public String getOption5() {
		return option5;
	}
	public void setOption5(String option5) {
		this.option5 = option5;
	}
	public String getOption6() {
		return option6;
	}
	public void setOption6(String option6) {
		this.option6 = option6;
	}
	public int getIntoption1() {
		return intoption1;
	}
	public void setIntoption1(int intoption1) {
		this.intoption1 = intoption1;
	}
	public int getIntoption2() {
		return intoption2;
	}
	public void setIntoption2(int intoption2) {
		this.intoption2 = intoption2;
	}
	public int getIntoption3() {
		return intoption3;
	}
	public void setIntoption3(int intoption3) {
		this.intoption3 = intoption3;
	}
	public Date getDateoption1() {
		return dateoption1;
	}
	public void setDateoption1(Date dateoption1) {
		this.dateoption1 = dateoption1;
	}
	public Date getDateoption2() {
		return dateoption2;
	}
	public void setDateoption2(Date dateoption2) {
		this.dateoption2 = dateoption2;
	}
	public Date getDateoption3() {
		return dateoption3;
	}
	public void setDateoption3(Date dateoption3) {
		this.dateoption3 = dateoption3;
	}
	@Override
	public String toString() {
		return "selectVo [InputOption=" + InputOption + ", option1=" + option1 + ", option2=" + option2 + ", option3="
				+ option3 + ", option4=" + option4 + ", option5=" + option5 + ", option6=" + option6 + ", intoption1="
				+ intoption1 + ", intoption2=" + intoption2 + ", intoption3=" + intoption3 + ", dateoption1="
				+ dateoption1 + ", dateoption2=" + dateoption2 + ", dateoption3=" + dateoption3 + "]";
	}
	public selectVo(String inputOption, String option1, String option2, String option3, String option4, String option5,
			String option6, int intoption1, int intoption2, int intoption3, Date dateoption1, Date dateoption2,
			Date dateoption3) {
		super();
		InputOption = inputOption;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.option5 = option5;
		this.option6 = option6;
		this.intoption1 = intoption1;
		this.intoption2 = intoption2;
		this.intoption3 = intoption3;
		this.dateoption1 = dateoption1;
		this.dateoption2 = dateoption2;
		this.dateoption3 = dateoption3;
	}
	public selectVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	
}
