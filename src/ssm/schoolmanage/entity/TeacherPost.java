package ssm.schoolmanage.entity;

import java.sql.Timestamp;

public class TeacherPost {
	private Integer teachpost_id;
	private Integer teach_id;
	private Integer post_id;
	private Timestamp teachpost_creattime;
	private Timestamp teachpost_updatetime;

	@Override
	public String toString() {
		return "TeacherPost [teachpost_id=" + teachpost_id + ", teach_id="
				+ teach_id + ", post_id=" + post_id + ", teachpost_creattime="
				+ teachpost_creattime + ", teachpost_updatetime="
				+ teachpost_updatetime + "]";
	}

	public Integer getTeachpost_id() {
		return teachpost_id;
	}

	public void setTeachpost_id(Integer teachpost_id) {
		this.teachpost_id = teachpost_id;
	}

	public Integer getTeach_id() {
		return teach_id;
	}

	public void setTeach_id(Integer teach_id) {
		this.teach_id = teach_id;
	}

	public Integer getPost_id() {
		return post_id;
	}

	public void setPost_id(Integer post_id) {
		this.post_id = post_id;
	}

	public Timestamp getTeachpost_creattime() {
		return teachpost_creattime;
	}

	public void setTeachpost_creattime(Timestamp teachpost_creattime) {
		this.teachpost_creattime = teachpost_creattime;
	}

	public Timestamp getTeachpost_updatetime() {
		return teachpost_updatetime;
	}

	public void setTeachpost_updatetime(Timestamp teachpost_updatetime) {
		this.teachpost_updatetime = teachpost_updatetime;
	}

}
