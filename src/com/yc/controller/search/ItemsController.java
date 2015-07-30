package com.yc.controller.search;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.ReviewsRank;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommodity;
import com.yc.entity.ShopCommoditySpecs;
import com.yc.entity.ShopReviews;
import com.yc.entity.user.AppUser;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommodityService;
import com.yc.service.IShopReviewsService;

@Controller
@RequestMapping("/items")
public class ItemsController {

	@Autowired
	IShopCategoryService shopCategService;

	@Autowired
	IShopReviewsService shopReviewsService;

	@Autowired
	IShopCommodityService shopCommService;

	// 购物Item
	@RequestMapping(value = "shopItem", method = RequestMethod.GET)
	public ModelAndView shopItem(Integer commID, Integer category, Integer shopID, String commoName, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		ShopCategory cate = shopCategService.findById(category);
		List<ShopReviews> reviewslist = shopReviewsService.getAllBycommCode(commID);
		Integer hao = 0;
		Integer zhong = 0;
		Integer cha = 0;
		for (int i = 0; i < reviewslist.size(); i++) {
			if (reviewslist.get(i).getReviewsRank() == ReviewsRank.good) {
				hao = hao + 1;
			}
			if (reviewslist.get(i).getReviewsRank() == ReviewsRank.better) {
				zhong = zhong + 1;
			}
			if (reviewslist.get(i).getReviewsRank() == ReviewsRank.bad) {
				cha = cha + 1;
			}
		}
		mode.put("reviewslist", reviewslist);
		mode.put("hao", hao);
		mode.put("zhong", zhong);
		mode.put("cha", cha);
		List<ShopCategory> shopcates = new ArrayList<ShopCategory>();
		shopcates.add(cate);
		mode.put("specifications", cate.getSpecifications());
		String strs = "";
		while (cate.getParentLevel() != null) {
			cate = shopCategService.findById(cate.getParentLevel().getCategoryID());
			if (cate != null) {
				shopcates.add(cate);
			}
		}
		for (int i = shopcates.size() - 1; i >= 0; i--) {
			strs = strs + shopcates.get(i).getCategoryID() + "-" + shopcates.get(i).getCategory() + "|";
		}
		List<ShopCategory> shopcategories = shopCategService.getAll();
		mode.put("shopCategories", shopcategories);
		mode.put("nvabar", strs.substring(0, strs.length() - 1));
		ShopCommodity shopCommoidty = shopCommService.findById(commID);
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		List<String> specStrs = null;
		mode.put("shopCommoidty", shopCommoidty);
		ShopCommoditySpecs shopSpecs = shopCommoidty.getCommsPecs();
		if (shopSpecs != null) {
			String spec = shopSpecs.getCommSpec();
			if(spec != null && !spec.equals("")){
				String[] specs = spec.split(",");
				if (specs.length > 0) {
					for (int i = 0; i < specs.length; i++) {
						if (!specs[i].equals("")) {
							if (map.containsKey(specs[i].split("-")[0])) {
								specStrs = map.get(specs[i].split("-")[0]);
								if (!specStrs.contains(specs[i].split("-")[1])) {
									specStrs.add(specs[i].split("-")[1]);
								}
							} else {
								specStrs = new ArrayList<String>();
								specStrs.add(specs[i].split("-")[1]);
								map.put(specs[i].split("-")[0], specStrs);
							}
						}
					}
				}
			}
		}
		List<ShopCategory> list = shopCategService.getAllByParent();
		mode.put("cateList", list);
		mode.put("map", map);
		AppUser user = (AppUser) request.getSession().getAttribute("loginUser");
		mode.put("user", user);
		return new ModelAndView("reception/shopItem", mode);
	}
}
