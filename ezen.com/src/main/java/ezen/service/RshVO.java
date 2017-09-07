package ezen.service;

import java.util.ArrayList;

public class RshVO {
	private int unq;
	private String mcd;
	private String title;
	private String sdate;
	private String edate;
	private String use;
	private String rdate;
	private String scd;
	private ArrayList comm;
	private String comm1; 
	public String getComm1() {
		return comm1;
	}
	public void setComm1(String comm1) {
		this.comm1 = comm1;
	}
	public void setComm(ArrayList comm) {
		this.comm = comm;
	}
	public ArrayList getComm() {
		return comm;
	}
	private String cnt;
	
	public int getUnq() {
		return unq;
	}
	public void setUnq(int unq) {
		this.unq = unq;
	}
	public String getMcd() {
		return mcd;
	}
	public void setMcd(String mcd) {
		this.mcd = mcd;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getUse() {
		return use;
	}
	public void setUse(String use) {
		this.use = use;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getScd() {
		return scd;
	}
	public void setScd(String scd) {
		this.scd = scd;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	
	
}
