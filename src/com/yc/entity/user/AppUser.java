package com.yc.entity.user;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.yc.entity.Collection;
import com.yc.entity.MissionPlan;
import com.yc.entity.OrderForm;
import com.yc.entity.Shop;
import com.yc.entity.ShopCommodity;

@Entity
@DiscriminatorValue("user")//用户
@JsonIgnoreProperties(value = { "shop", "activityCommodities", "collections","orderForms","missionPlans"})
public class AppUser {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column(length = 32, unique = true, updatable = false)
	private String loginName;
	
	@Column(length = 18, unique = true)
	private String identityId;

	@Column(length = 32)
	private String password;

	@Column(length = 32)
	private String userName;

	@Column
	private String email;
	
	@Column(length = 11)
	private String phone;
	
	@Column
	private String validateCode;//邮箱激活码
	
	@Column
	private Boolean status;
	
	@Column
	private String emailBindTime;//邮箱绑定时间
	
	@Column
	@Enumerated(EnumType.STRING)
	private Sex sex;
	
	@OneToOne
	@JoinColumn(name = "shop_id")
	private Shop shop;
	
	@Column
	private String birthday;
	
	@Column
	private Integer points = 0;//积分
	
	@ManyToMany(mappedBy = "users")
	private List<ShopCommodity> activityCommodities;//商品类别
	
	@OneToMany(mappedBy = "user")
	private List<Collection> collections;//商品类别
	
	@OneToMany(mappedBy = "orderUser")
	private List<OrderForm> orderForms;//商品类别

	@OneToMany(mappedBy = "toUser")
	private List<MissionPlan> missionPlans;//消息
	
	@Column
	private String address ;//居住地址
	
	
	public String getIdentityId() {
		return identityId;
	}

	public void setIdentityId(String identityId) {
		this.identityId = identityId;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<MissionPlan> getMissionPlans() {
		return missionPlans;
	}

	public void setMissionPlans(List<MissionPlan> missionPlans) {
		this.missionPlans = missionPlans;
	}
	
	public Integer getPoints() {
		return points;
	}

	public void setPoints(Integer points) {
		this.points = points;
	}

	public List<OrderForm> getOrderForms() {
		return orderForms;
	}

	public void setOrderForms(List<OrderForm> orderForms) {
		this.orderForms = orderForms;
	}

	public List<Collection> getCollections() {
		return collections;
	}

	public void setCollections(List<Collection> collections) {
		this.collections = collections;
	}

	public List<ShopCommodity> getActivityCommodities() {
		return activityCommodities;
	}

	public void setActivityCommodities(List<ShopCommodity> activityCommodities) {
		this.activityCommodities = activityCommodities;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public String getEmailBindTime() {
		return emailBindTime;
	}

	public void setEmailBindTime(String emailBindTime) {
		this.emailBindTime = emailBindTime;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public String getValidateCode() {
		return validateCode;
	}

	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Sex getSex() {
		return sex;
	}

	public void setSex(Sex sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	
}
