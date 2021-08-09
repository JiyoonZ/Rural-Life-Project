package com.project.rural.community;

import java.util.ArrayList;

public class CommunityDTO {
	
	/*
	 * 커뮤니티 게시판 테이블 + 커뮤니티 이미지 테이블
	 * 
	 */
	private String seq;
	private String id;
	private String category;
	private String title;
	private String detail;
	private String regdate;
	private String cnt;
	private String name;
	private String isnew;
	private ArrayList<String> images;
	private String pseq;
	private String ccnt;
	
	private String imgCnt;
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public String getPseq() {
		return pseq;
	}
	public void setPseq(String pseq) {
		this.pseq = pseq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIsnew() {
		return isnew;
	}
	public void setIsnew(String isnew) {
		this.isnew = isnew;
	}
	public String getCcnt() {
		return ccnt;
	}
	public void setCcnt(String ccnt) {
		this.ccnt = ccnt;
	}
	public ArrayList<String> getImages() {
		return images;
	}
	public void setImages(ArrayList<String> images) {
		this.images = images;
	}
	public String getImgCnt() {
		return imgCnt;
	}
	public void setImgCnt(String imgCnt) {
		this.imgCnt = imgCnt;
	}

}
