package com.yc.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
@DiscriminatorValue("cottonFactory")
public class CottonFactory {
	        @Id
	        @GeneratedValue(strategy = GenerationType.AUTO)
            private Integer factoryId;
	    	@Column
            private String   factoryName;//工厂名称
	    	@Column 
            private String   factoryAddress;//工厂地址
	    	@Column
            private String factoryPhone;//联系方式
	    	@Column
            private String linkMan;//联系人
	    	@Column 
            private String   imagePath;//工厂地址
	    	@OneToMany(mappedBy = "cottonFactory")
	    	private List<Cotton> cottons;//产品信息
	    	
	    	
			public String getImagePath() {
				return imagePath;
			}
			public void setImagePath(String imagePath) {
				this.imagePath = imagePath;
			}
			public List<Cotton> getCottons() {
				return cottons;
			}
			public void setCottons(List<Cotton> cottons) {
				this.cottons = cottons;
			}
			public Integer getFactoryId() {
				return factoryId;
			}
			public void setFactoryId(Integer factoryId) {
				this.factoryId = factoryId;
			}
			public String getFactoryName() {
				return factoryName;
			}
			public void setFactoryName(String factoryName) {
				this.factoryName = factoryName;
			}
			public String getFactoryAddress() {
				return factoryAddress;
			}
			public void setFactoryAddress(String factoryAddress) {
				this.factoryAddress = factoryAddress;
			}
			public String getFactoryPhone() {
				return factoryPhone;
			}
			public void setFactoryPhone(String factoryPhone) {
				this.factoryPhone = factoryPhone;
			}
			public String getLinkMan() {
				return linkMan;
			}
			public void setLinkMan(String linkMan) {
				this.linkMan = linkMan;
			}
}
