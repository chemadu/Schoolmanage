package ssm.schoolmanage.entity;

import java.util.Date;

public class Post {
	private Integer post_id;
	private String post_name;
	private String post_remark;
	private Date post_creattime;
	private Date post_updatetime;
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
	public Date getPost_creattime() {
		return post_creattime;
	}
	public void setPost_creattime(Date post_creattime) {
		this.post_creattime = post_creattime;
	}
	public Date getPost_updatetime() {
		return post_updatetime;
	}
	public void setPost_updatetime(Date post_updatetime) {
		this.post_updatetime = post_updatetime;
	}
	public Post(Integer post_id, String post_name, String post_remark,
			Date post_creattime, Date post_updatetime) {
		super();
		this.post_id = post_id;
		this.post_name = post_name;
		this.post_remark = post_remark;
		this.post_creattime = post_creattime;
		this.post_updatetime = post_updatetime;
	}
	public Post() {
		super();
	}
	@Override
	public String toString() {
		return "Post [post_id=" + post_id + ", post_name=" + post_name
				+ ", post_remark=" + post_remark + ", post_creattime="
				+ post_creattime + ", post_updatetime=" + post_updatetime + "]";
	}
	
	
}
