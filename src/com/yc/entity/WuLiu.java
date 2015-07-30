package com.yc.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

//订单item商品
@Entity
@DiscriminatorValue("cotton")
public class WuLiu {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer wuLiuId;
	@Column
	private Float geshu;
	@Column
	private Float firstPrice;// 首钱
	@Column
	@Enumerated(EnumType.STRING)
	private WuLiuType wuLiuType;// 类型
	@Column
	private Float houshu;
	@Column
	private Float houPrice;// 后续
	
	public Float getGeshu() {
		return geshu;
	}
	public void setGeshu(Float geshu) {
		this.geshu = geshu;
	}
	public Float getHoushu() {
		return houshu;
	}
	public void setHoushu(Float houshu) {
		this.houshu = houshu;
	}
	public Integer getWuLiuId() {
		return wuLiuId;
	}
	public void setWuLiuId(Integer wuLiuId) {
		this.wuLiuId = wuLiuId;
	}
	public Float getFirstPrice() {
		return firstPrice;
	}
	public void setFirstPrice(Float firstPrice) {
		this.firstPrice = firstPrice;
	}
	public WuLiuType getWuLiuType() {
		return wuLiuType;
	}
	public void setWuLiuType(WuLiuType wuLiuType) {
		this.wuLiuType = wuLiuType;
	}
	public Float getHouPrice() {
		return houPrice;
	}
	public void setHouPrice(Float houPrice) {
		this.houPrice = houPrice;
	}
	
}
