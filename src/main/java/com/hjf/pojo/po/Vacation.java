package com.hjf.pojo.po;

import java.util.Date;

public class Vacation {
	private Integer vid;
	private Date starttime;
	private Date endtime;
	private Integer totalday;
	private String resons;
	private Integer applyerid;
	private Integer agreemanid;
	private String isagree;
	private String applyername;
	
	public String getApplyername() {
		return applyername;
	}
	public void setApplyername(String applyername) {
		this.applyername = applyername;
	}
	public Date getStarttime() {
		return starttime;
	}
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public Integer getApplyerid() {
		return applyerid;
	}
	public void setApplyerid(Integer applyerid) {
		this.applyerid = applyerid;
	}
	public Integer getAgreemanid() {
		return agreemanid;
	}
	public void setAgreemanid(Integer agreemanid) {
		this.agreemanid = agreemanid;
	}
	
	public Integer getVid() {
		return vid;
	}
	public void setVid(Integer vid) {
		this.vid = vid;
	}
	
	public Integer getTotalday() {
		return totalday;
	}
	public void setTotalday(Integer totalday) {
		this.totalday = totalday;
	}
	public String getResons() {
		return resons;
	}
	public void setResons(String resons) {
		this.resons = resons;
	}
	
	public String getIsagree() {
		return isagree;
	}
	public void setIsagree(String isagree) {
		this.isagree = isagree;
	}
	
	
}
