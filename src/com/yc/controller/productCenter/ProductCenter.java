package com.yc.controller.productCenter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.Cotton;
import com.yc.entity.CottonFactory;
import com.yc.entity.News;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommodity;
import com.yc.service.ICottonFactoryService;
import com.yc.service.INewsService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommodityService;


@Controller
@RequestMapping("/productCenter")
public class ProductCenter {
	@Autowired
	IShopCategoryService categoryService;
	@Autowired
	INewsService newService;
	@Autowired
	IShopCommodityService shopCommodityService;
	@Autowired
	ICottonFactoryService cottonFactoryService ;
	/**
	 * 产品中心首页
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "shopIndex", method = RequestMethod.GET)
	public ModelAndView shopIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode=new ModelMap();
	    List<ShopCategory> cateList = categoryService.getAllByParent();
	    List<CottonFactory> cottonFactoryList=cottonFactoryService.getAll();
	    List<ShopCategory> cateList1=categoryService.getAllByParentLevel(2);
	    List<ShopCategory> cateList2=categoryService.getAllByParentLevel(3);
	    List<ShopCategory> cateList3=categoryService.getAllByParentLevel(4);
	    mode.put("cottonFactoryList",cottonFactoryList);//工厂
	    for (int i = 0; i < cateList1.size(); i++) {
	    	List<ShopCommodity> tillerShops=shopCommodityService.getAllByShopCategoryID(cateList1.get(i).getCategoryID(), null, 0, 10);
	    	mode.put("tillerShops",tillerShops);//农产品
		}
	    for (int i = 0; i < cateList2.size(); i++) {
	    	List<ShopCommodity> appliancesShops=shopCommodityService.getAllByShopCategoryID(cateList1.get(i).getCategoryID(), null, 0,10);
	    	mode.put("appliancesShops",appliancesShops);//家电百货
		}
	    for (int i = 0; i < cateList3.size(); i++) {
	    	List<ShopCommodity> foodShops=shopCommodityService.getAllByShopCategoryID(cateList1.get(i).getCategoryID(), null, 0, 10);
	    	mode.put("foodShops",foodShops);//粮食
		}
	    List<News> news = newService.getNewsByIsThrough(true);//新闻
		mode.put("cateList", cateList);
		mode.put("newsList", news);
		return new ModelAndView("productCenter/shopIndex",mode);
	}
   
	
	/**
	 * 根据棉花类型查询工厂
	 * @param cottonType
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "cottonFactory", method = RequestMethod.GET)
	public ModelAndView cottonFactory(Integer cottonType,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode=new ModelMap();
		List<ShopCategory> cateList = categoryService.getAllByParent();
		List<CottonFactory> cottonFactoryList=cottonFactoryService.getAllByType(cottonType);
	    mode.put("cottonFactoryList",cottonFactoryList);//工厂
	    mode.put("cateList", cateList);
		return new ModelAndView("productCenter/cottonFactory",mode);
	}
	/**
	 * 查询工厂内的棉花
	 * @param cottonType
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "cottonInfo", method = RequestMethod.GET)
	public ModelAndView cottonInfo(Integer factoryId,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode=new ModelMap();
		CottonFactory cottonFactory=cottonFactoryService.findById(factoryId);
		List<Cotton> cottons=cottonFactory.getCottons();
		List<Cotton> cottonbyHand=new ArrayList<Cotton>();
		List<Cotton> cottonbyMachine=new ArrayList<Cotton>();
		for (int i = 0; i < cottons.size(); i++) {
			 if("手采棉花".equals(cottons.get(i).getCottonType())){
				 cottonbyHand.add(cottons.get(i));
			 }else if("机采棉花".equals(cottons.get(i).getCottonType())){
				 cottonbyMachine.add(cottons.get(i));
			 }
		}
		mode.put("cottonFactory",cottonFactory);
		mode.put("cottonbyHand", cottonbyHand);
		mode.put("cottonbyMachine", cottonbyMachine);
		return new ModelAndView("productCenter/cottonInfo",mode);
	}
}
