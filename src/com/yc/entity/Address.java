package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.yc.entity.user.AppUser;

@Entity
public class Address {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	@Column
	private String toName;// 收货人
	@Column
	private String phone;// 电话  
	@Column
	private String region;// 所在地区  
	@Column
	private String detailAdress;// 详细地址
	@Column
	private String postalCode;// 邮政编码
	
	@ManyToOne
	@JoinColumn(name = "user_id")
    private AppUser user;  
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getToName() {
		return toName;
	}

	public void setToName(String toName) {
		this.toName = toName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getDetailAdress() {
		return detailAdress;
	}

	public void setDetailAdress(String detailAdress) {
		this.detailAdress = detailAdress;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public AppUser getUser() {
		return user;
	}

	public void setUser(AppUser user) {
		this.user = user;
	}

}
