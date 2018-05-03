package ssm.schoolmanage.entity;

import java.sql.Timestamp;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class Modular {
	private Integer modular_id;
	private String text;
	private String modular_remark;
	private Integer modular_parentid;
	private String modular_url;
	private String checked;
	private Timestamp faculty_creattime;
	private Timestamp faculty_updatetime;
	
	
	public String getModular_url() {
		return modular_url;
	}
	public void setModular_url(String modular_url) {
		this.modular_url = modular_url;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public Integer getModular_id() {
		return modular_id;
	}
	public void setModular_id(Integer modular_id) {
		this.modular_id = modular_id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getModular_remark() {
		return modular_remark;
	}
	public void setModular_remark(String modular_remark) {
		this.modular_remark = modular_remark;
	}
	public Integer getModular_parentid() {
		return modular_parentid;
	}
	public void setModular_parentid(Integer modular_parentid) {
		this.modular_parentid = modular_parentid;
	}
	public String getFaculty_creattime() {
		  	DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		    String tsStr = sdf.format(faculty_creattime);  
		    
		return tsStr;
	}
	public void setFaculty_creattime(Timestamp faculty_creattime) {
		this.faculty_creattime = faculty_creattime;
	}
	public String getFaculty_updatetime() {
		
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	    String tsStr = sdf.format(faculty_creattime);  
	    
	    return tsStr;
	}
	public void setFaculty_updatetime(Timestamp faculty_updatetime) {
		this.faculty_updatetime = faculty_updatetime;
	}
	@Override
	public String toString() {
		return "Modular [modular_id=" + modular_id + ", text=" + text
				+ ", modular_remark=" + modular_remark + ", modular_parentid="
				+ modular_parentid + ", modular_url=" + modular_url
				+ ", checked=" + checked + ", faculty_creattime="
				+ faculty_creattime + ", faculty_updatetime="
				+ faculty_updatetime + "]";
	}
	
	
	
	
	
}
