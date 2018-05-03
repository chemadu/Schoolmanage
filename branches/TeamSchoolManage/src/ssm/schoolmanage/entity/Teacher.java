package ssm.schoolmanage.entity;

import java.sql.Timestamp;

public class Teacher {
	private Integer teach_id;
	private String teach_name;
	private Character teach_office;
	private Timestamp teach_creattime;
	private Timestamp teach_updatetime;
	private String teach_comment;
	
	@Override
	public String toString() {
		return "Teacher [teach_id=" + teach_id + ", teach_name=" + teach_name
				+ ", teach_office=" + teach_office + ", teach_creattime="
				+ teach_creattime + ", teach_updatetime=" + teach_updatetime
				+ ", teach_comment=" + teach_comment + "]";
	}
	public Integer getTeach_id() {
		return teach_id;
	}
	public void setTeach_id(Integer teach_id) {
		this.teach_id = teach_id;
	}
	public String getTeach_name() {
		return teach_name;
	}
	public void setTeach_name(String teach_name) {
		this.teach_name = teach_name;
	}
	public Character getTeach_office() {
		return teach_office;
	}
	public void setTeach_office(Character teach_office) {
		this.teach_office = teach_office;
	}
	public Timestamp getTeach_creattime() {
		return teach_creattime;
	}
	public void setTeach_creattime(Timestamp teach_creattime) {
		this.teach_creattime = teach_creattime;
	}
	public Timestamp getTeach_updatetime() {
		return teach_updatetime;
	}
	public void setTeach_updatetime(Timestamp teach_updatetime) {
		this.teach_updatetime = teach_updatetime;
	}
	public String getTeach_comment() {
		return teach_comment;
	}
	public void setTeach_comment(String teach_comment) {
		this.teach_comment = teach_comment;
	}

	
}
