package ssm.schoolmanage.entity;

import java.sql.Timestamp;

import java.util.List;

public class Post {
	private Integer post_id;
	private String post_name;
	private String post_remark;
	private Timestamp post_creattime;
	private Timestamp post_updatetime;
	private List<Teacher> teacher;

	@Override
	public String toString() {
		return "Post [post_id=" + post_id + ", post_name=" + post_name
				+ ", post_remark=" + post_remark + ", post_creattime="
				+ post_creattime + ", post_updatetime=" + post_updatetime
				+ ", teacher=" + teacher + "]";
	}

	public Integer getPost_id() {
		return post_id;
	}

	public void setPost_id(Integer post_id) {
		this.post_id = post_id;
	}

	public String getPost_name() {
		return post_name;
	}

	public void setPost_name(String post_name) {
		this.post_name = post_name;
	}

	public String getPost_remark() {
		return post_remark;
	}

	public void setPost_remark(String post_remark) {
		this.post_remark = post_remark;
	}

	public Timestamp getPost_creattime() {
		return post_creattime;
	}

	public void setPost_creattime(Timestamp post_creattime) {
		this.post_creattime = post_creattime;
	}

	public Timestamp getPost_updatetime() {
		return post_updatetime;
	}

	public void setPost_updatetime(Timestamp post_updatetime) {
		this.post_updatetime = post_updatetime;
	}


}
