package com.yc.controller.init;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Repository;

import com.yc.entity.AdvertiseDistribution;
import com.yc.entity.AgriculturalsSort;
import com.yc.entity.Language;
import com.yc.entity.Shop;
import com.yc.entity.ShopCategory;
import com.yc.entity.WuLiu;
import com.yc.entity.WuLiuType;
import com.yc.entity.user.Personnel;
import com.yc.service.IAdvertisementDistributionService;
import com.yc.service.IAgriculturalsSortService;
import com.yc.service.IPersonnelService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopService;
import com.yc.service.IWuLiuService;

@SuppressWarnings("rawtypes")
@Repository
public class InitDate implements ApplicationListener{
	
	@Resource
	IShopCategoryService categoryService;
	
	@Autowired
	IPersonnelService personnelService;
	
	@Autowired
	IAgriculturalsSortService sortService;
	
	@Autowired
	IShopService shopService;
	
	@Autowired
	IWuLiuService wuLiuService;
	
	@Autowired
	IAdvertisementDistributionService distributionService;
	
	@Override
	public void onApplicationEvent(ApplicationEvent arg0) {
		initArticleCategory();
	}

	private void initArticleCategory() {
		Personnel  nat = personnelService.findById(1);
		if (nat==null) {
			nat = new Personnel();
			nat.setUserName("管理员");
			nat.setLoginName("admin");
			nat.setPassword("000000");
			nat.setForbidden(false);
			nat = personnelService.save(nat);
		}
		WuLiu wuliu = wuLiuService.findById(1);
		if (wuliu == null) {
			wuliu = new WuLiu();
			wuliu.setFirstPrice(15f);
			wuliu.setHouPrice(5f);
			wuliu.setGeshu(1f);
			wuliu.setHoushu(1f);
			wuliu.setWuLiuType(WuLiuType.jianshu);
			wuLiuService.save(wuliu);
		}
		List<ShopCategory> categories = categoryService.getAllByParent();
		if (categories==null || categories.size()==0) {
			ShopCategory cate1 = new ShopCategory();
			cate1.setCategory("棉花");
			cate1.setIsForbidden(false);
			categoryService.save(cate1);
			ShopCategory cate2 = new ShopCategory();
			cate2.setCategory("农副产品");
			cate2.setIsForbidden(false);
			categoryService.save(cate2);
			ShopCategory cate3 = new ShopCategory();
			cate3.setCategory("家电百货");
			cate3.setIsForbidden(false);
			categoryService.save(cate3);
			ShopCategory cate4 = new ShopCategory();
			cate4.setCategory("粮食");
			cate4.setIsForbidden(false);
			categoryService.save(cate4);
		}
		Shop shop = shopService.findById(1);
		if(shop == null){
			shop = new Shop();
			shop.setUser(nat);
			shop.setIsPermit(true);
			shop.setShopName("华腾物流");
			shop = shopService.save(shop);
			nat.setShop(shop);
			personnelService.update(nat);
		}
		String[] agrs = {"公告通知","公司简介","网站地图","联系我们","友情链接","企业文化","公司战略","业务范围","运输服务"};
		AgriculturalsSort sort = sortService.findById(1);
		if(sort == null){
			for (int i = 0; i < agrs.length; i++) {
				sort = new AgriculturalsSort();
				sort.setLanguage(Language.Chinese);
				sort.setDepartmentname(agrs[i]);
				sortService.save(sort);
			}
		}
		AdvertiseDistribution distribution = distributionService.findById(1);
		if(distribution == null){
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("1903*480");
			distribution.setNum(4);
			distribution.setPosition("首页大眼睛");
			distribution.setWhichPage("首页");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("875*345");
			distribution.setNum(3);
			distribution.setPosition("产品中心大眼睛");
			distribution.setWhichPage("产品中心");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("292*159");
			distribution.setNum(1);
			distribution.setPosition("产品中心推荐A1");
			distribution.setWhichPage("产品中心");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("292*159");
			distribution.setNum(1);
			distribution.setPosition("产品中心推荐A2");
			distribution.setWhichPage("产品中心");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("292*159");
			distribution.setNum(1);
			distribution.setPosition("产品中心推荐A3");
			distribution.setWhichPage("产品中心");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("292*159");
			distribution.setNum(1);
			distribution.setPosition("产品中心推荐A4");
			distribution.setWhichPage("产品中心");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("292*159");
			distribution.setNum(1);
			distribution.setPosition("产品中心推荐A5");
			distribution.setWhichPage("产品中心");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("292*159");
			distribution.setNum(1);
			distribution.setPosition("产品中心推荐A6");
			distribution.setWhichPage("产品中心");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("292*159");
			distribution.setNum(1);
			distribution.setPosition("产品中心推荐A7");
			distribution.setWhichPage("产品中心");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("292*159");
			distribution.setNum(1);
			distribution.setPosition("产品中心推荐A8");
			distribution.setWhichPage("产品中心");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("206*290");
			distribution.setNum(4);
			distribution.setPosition("产品推荐");
			distribution.setWhichPage("产品中心");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("206*290");
			distribution.setNum(1);
			distribution.setPosition("产品推荐A1");
			distribution.setWhichPage("产品中心");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("210*290");
			distribution.setNum(1);
			distribution.setPosition("产品推荐A2");
			distribution.setWhichPage("产品中心");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("210*290");
			distribution.setNum(1);
			distribution.setPosition("产品推荐A3");
			distribution.setWhichPage("产品中心");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("210*290");
			distribution.setNum(1);
			distribution.setPosition("产品推荐A4");
			distribution.setWhichPage("产品中心");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("210*290");
			distribution.setNum(1);
			distribution.setPosition("采购专区A1");
			distribution.setWhichPage("产品中心");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("210*290");
			distribution.setNum(1);
			distribution.setPosition("采购专区A2");
			distribution.setWhichPage("产品中心");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("210*290");
			distribution.setNum(1);
			distribution.setPosition("采购专区A3");
			distribution.setWhichPage("产品中心");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("206*290");
			distribution.setNum(1);
			distribution.setPosition("采购专区A4");
			distribution.setWhichPage("产品中心");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("238*111");
			distribution.setNum(1);
			distribution.setPosition("最新公告");
			distribution.setWhichPage("产品中心");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("1200*230");
			distribution.setNum(1);
			distribution.setPosition("棉花工厂页面大眼睛");
			distribution.setWhichPage("棉花工厂页面");
			distributionService.save(distribution);
			distribution = new AdvertiseDistribution();
			distribution.setlAndW("1100*427");
			distribution.setNum(1);
			distribution.setPosition("一级页面大眼睛");
			distribution.setWhichPage("一级页面");
			distributionService.save(distribution);
		}
	}

}
