package com.yc.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

//订单item商品
@Entity
@DiscriminatorValue("cotton")
public class Cotton {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer cottonId;
	@Column
	private String batch;// 批次
	@Column
	private String cottonType;// 类型
	@Column
	private Boolean isCheck = false;// 是否公检
	@Column
	private String date;// 入库时间
	@Column
	private Integer amount;// 包数
	@Column
	private Float weight;// 毛重
	@Column
	private Float netWeight;// 公重
	@Column
	private Float price;// 价格
	@Column
	private String warehouse;// 仓库
	@Column
	private Boolean isSell;// 是否出售
	@ManyToOne(cascade = { CascadeType.REFRESH })
	@JoinColumn(name = "cottonFactory_id")
	private CottonFactory cottonFactory;// 棉花工厂

	public Integer getCottonId() {
		return cottonId;
	}

	public void setCottonId(Integer cottonId) {
		this.cottonId = cottonId;
	}

	public String getBatch() {
		return batch;
	}

	public void setBatch(String batch) {
		this.batch = batch;
	}

	public String getCottonType() {
		return cottonType;
	}

	public void setCottonType(String cottonType) {
		this.cottonType = cottonType;
	}

	public Boolean getIsCheck() {
		return isCheck;
	}

	public void setIsCheck(Boolean isCheck) {
		this.isCheck = isCheck;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Float getWeight() {
		return weight;
	}

	public void setWeight(Float weight) {
		this.weight = weight;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Float getNetWeight() {
		return netWeight;
	}

	public void setNetWeight(Float netWeight) {
		this.netWeight = netWeight;
	}

	public String getWarehouse() {
		return warehouse;
	}

	public void setWarehouse(String warehouse) {
		this.warehouse = warehouse;
	}

	public Boolean getIsSell() {
		return isSell;
	}

	public void setIsSell(Boolean isSell) {
		this.isSell = isSell;
	}

	public CottonFactory getCottonFactory() {
		return cottonFactory;
	}

	public void setCottonFactory(CottonFactory cottonFactory) {
		this.cottonFactory = cottonFactory;
	}
}
