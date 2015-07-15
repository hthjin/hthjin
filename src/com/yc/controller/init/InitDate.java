package com.yc.controller.init;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Repository;

import com.yc.entity.AgriculturalsSort;
import com.yc.entity.Language;
import com.yc.entity.ShopCategory;
import com.yc.entity.user.Personnel;
import com.yc.service.IAgriculturalsSortService;
import com.yc.service.IPersonnelService;
import com.yc.service.IShopCategoryService;

@SuppressWarnings("rawtypes")
@Repository
public class InitDate implements ApplicationListener{
	
	@Resource
	IShopCategoryService categoryService;
	
	@Autowired
	IPersonnelService personnelService;
	
	@Autowired
	IAgriculturalsSortService sortService;
	
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
			personnelService.save(nat);
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
	}

}
