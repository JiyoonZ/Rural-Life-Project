package com.project.rural.exp;

public class ExpDTO {

	private String seq;
	private String address;
	private String town;
	private String expInfo;
	private String name;
	private String startDate;
	private String endDate;
	private String tel;
	private String site;
	private String townDetail;
	private String detail;
	private String totalPerson;
	private String image;
	private String regDate;
	//새로운글 업뎃
	private String isnew;
	//사용자이름-담당자용
	private String userName;
	//지도에 표시할 주소
	private String map;
	//신청자 개수
	private String count;
	//평점
	private String starRs;
	//지원명수- 내가 지원했는지 안했는지 
	private int applyCnt;
	//신청완료한 지원자
	private int applyperson;
	
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	public String getTotalPerson() {
		return totalPerson;
	}
	public void setTotalPerson(String totalPerson) {
		this.totalPerson = totalPerson;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	private String id;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTown() {
		return town;
	}
	public void setTown(String town) {
		this.town = town;
	}
	public String getExpInfo() {
		return expInfo;
	}
	public void setExpInfo(String expInfo) {
		this.expInfo = expInfo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public String getTownDetail() {
		return townDetail;
	}
	public void setTownDetail(String townDetail) {
		this.townDetail = townDetail;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getIsnew() {
		return isnew;
	}
	public void setIsnew(String isnew) {
		this.isnew = isnew;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getMap() {
		return map;
	}
	public void setMap(String map) {
		this.map = map;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getStarRs() {
		return starRs;
	}
	public void setStarRs(String starRs) {
		this.starRs = starRs;
	}
	public int getApplyCnt() {
		return applyCnt;
	}
	public void setApplyCnt(int applyCnt) {
		this.applyCnt = applyCnt;
	}
	public int getApplyperson() {
		return applyperson;
	}
	public void setApplyperson(int applyperson) {
		this.applyperson = applyperson;
	}
	
	
	
}
