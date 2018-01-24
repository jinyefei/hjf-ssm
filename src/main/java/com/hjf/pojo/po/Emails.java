package com.hjf.pojo.po;

import java.util.Date;

public class Emails {
	private Integer eid;
	private String etitle;
	private String econtext;
	private String enclosure;
	private Integer senderid;
	private Integer reciverid;
	private Date sendtime;
	private String istrash;
	private String isread;
	public String getEtitle() {
		return etitle;
	}
	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}
	public String getEcontext() {
		return econtext;
	}
	public void setEcontext(String econtext) {
		this.econtext = econtext;
	}

	public String getEnclosure() {
		return enclosure;
	}

	public void setEnclosure(String enclosure) {
		this.enclosure = enclosure;
	}

	public Integer getSenderid() {
		return senderid;
	}
	public void setSenderid(Integer senderid) {
		this.senderid = senderid;
	}
	public Integer getReciverid() {
		return reciverid;
	}
	public void setReciverid(Integer reciverid) {
		this.reciverid = reciverid;
	}
	public Date getSendtime() {
		return sendtime;
	}
	public void setSendtime(Date sendtime) {
		this.sendtime = sendtime;
	}
	public String getIstrash() {
		return istrash;
	}
	public void setIstrash(String istrash) {
		this.istrash = istrash;
	}
	public String getIsread() {
		return isread;
	}
	public void setIsread(String isread) {
		this.isread = isread;
	}
	public Integer getEid() {
		return eid;
	}
	public void setEid(Integer eid) {
		this.eid = eid;
	}
	
}
