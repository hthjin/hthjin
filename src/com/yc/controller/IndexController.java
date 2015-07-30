
package com.yc.controller;

import java.io.IOException;
import java.util.Comparator;
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

import com.yc.entity.Advertisement;
import com.yc.entity.FamousManor;
import com.yc.entity.News;
import com.yc.entity.Products;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommodity;
import com.yc.service.IAdvertisementService;
import com.yc.service.IFamousManorService;
import com.yc.service.INewsService;
import com.yc.service.IProductsService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommodityService;

@Controller
@RequestMapping("/")
public class IndexController {
	
	@Autowired
	IShopCategoryService categoryService;
	
	@Autowired
	INewsService newService;
	
	@Autowired
	IFamousManorService famousManorService;
	
	@Autowired
	IShopCommodityService shopCommoidtyService;
	
	@Autowired
	IProductsService productsService;
	
	@Autowired
	IAdvertisementService advertisementService;
	
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<ShopCategory> list = categoryService.getAllByParent();
    	System.out.println("list========="+list.size());
    	List<News> news = newService.getNewsByIsThrough(true);
    	//改，以后 top 8
    	List<FamousManor> famouss =  famousManorService.getAll();
    	List<ShopCommodity> hongjiu = shopCommoidtyService.getAllByShopCategoryID(1, new String(), 0, 6);
    	List<ShopCommodity> baijiu = shopCommoidtyService.getAllByShopCategoryID(2, new String(), 0, 6);
    	List<ShopCommodity> pijiu = shopCommoidtyService.getAllByShopCategoryID(3, new String(), 0, 6);
    	List<ShopCommodity> yangjiu = shopCommoidtyService.getAllByShopCategoryID(4, new String(), 0, 6);
    	ModelMap mode = new ModelMap();
    	mode.put("categories", list);
    	mode.put("hongjiu", hongjiu);
    	mode.put("baijiu", baijiu);
    	mode.put("pijiu", pijiu);
    	mode.put("yangjiu", yangjiu);
    	mode.put("newsList", news);
    	mode.put("famouss", famouss);
        return new ModelAndView("index",mode);
    }

 	@RequestMapping(value = "login", method = RequestMethod.GET)
    public ModelAndView homePage(String page,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		return new ModelAndView("personnel/login");
    }
 	
 	@RequestMapping(value = "hthjin", method = RequestMethod.GET)
 	public ModelAndView hthjin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		List<Products> news = productsService.getProductsByAgricult(1);
 		List<Products> products = productsService.getProductsByAgricult(5);
 		news.sort(new Comparator<Products>() {
			@Override
			public int compare(Products o1, Products o2) {
				return o2.getId()-o1.getId();
			}
		});
 		ModelMap mode = new ModelMap();
 		mode.put("news", news);
 		mode.put("youqings", products);
 		Products gongsijianjie = productsService.getAllByAgricult(2);
 		mode.put("gongsijianjie", gongsijianjie);
 		Products qiyewenhua = productsService.getAllByAgricult(6);
 		mode.put("qiyewenhua", qiyewenhua);
 		Products gongsizhanlue = productsService.getAllByAgricult(7);
 		mode.put("gongsizhanlue", gongsizhanlue);
 		List<Products> yunshufangshi = productsService.getProductsByAgricult(9);
 		mode.put("yunshufangshi", yunshufangshi);
 		List<Advertisement> advertisementList = advertisementService.getAdvertiseBywhichPage("首页");
		mode.put("advertisementList", advertisementList);
 		return new ModelAndView("hthjin",mode);
 	}
 	@RequestMapping(value = "production", method = RequestMethod.GET)
    public ModelAndView production(Integer agricID,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		Products products = productsService.findById(agricID);
 		ModelMap mode = new ModelMap();
 		if(products != null){
 			List<Products> news = productsService.getProductsByAgricult(products.getAgriculturalsSort().getId());
 	 		news.sort(new Comparator<Products>() {
 				@Override
 				public int compare(Products o1, Products o2) {
 					return o2.getId()-o1.getId();
 				}
 			});
 	 		mode.put("news", news);
 	 		mode.put("products", products);
 		}
 		return new ModelAndView("products",mode);
 	}
 	
 	@RequestMapping(value = "getDitu", method = RequestMethod.GET)
 	public ModelAndView getDitu( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		Products products = productsService.getAllByAgricult(3);
 		ModelMap mode = new ModelMap();
 		mode.put("products", products);
 		return new ModelAndView("getDitu",mode);
 	}
 	
 	@RequestMapping(value = "jianjie", method = RequestMethod.GET)
 	public ModelAndView jianjie( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		Products products = productsService.getAllByAgricult(2);
 		ModelMap mode = new ModelMap();
 		mode.put("products", products);
 		return new ModelAndView("jianjie",mode);
 	}
 	
 	@RequestMapping(value = "lianxiUS", method = RequestMethod.GET)
 	public ModelAndView lianxiUS( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		Products products = productsService.getAllByAgricult(4);
 		ModelMap mode = new ModelMap();
 		mode.put("products", products);
 		return new ModelAndView("lianxiUS",mode);
 	}
 	
 	@RequestMapping(value = "youqing", method = RequestMethod.GET)
 	public ModelAndView youqing( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		Products products = productsService.getAllByAgricult(5);
 		ModelMap mode = new ModelMap();
 		mode.put("youqings", products);
 		return new ModelAndView("youqing",mode);
 	}
 	
 	@RequestMapping(value = "wuliu", method = RequestMethod.GET)
 	public ModelAndView wuliu(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		ModelMap mode = new ModelMap();
 		List<Products> yunshufangshi = productsService.getProductsByAgricult(9);
 		mode.put("yunshufangshi", yunshufangshi);
 		Products products = productsService.findById(id);
 		mode.put("products", products);
 		return new ModelAndView("wuliu",mode);
 	}
 	
 	@RequestMapping(value = "about", method = RequestMethod.GET)
 	public ModelAndView about(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		ModelMap mode = new ModelMap();
 		List<Products> list = productsService.getProductsInAgricult(6,7,8);
 		Products products = productsService.findById(id);
 		mode.put("products", products);
 		mode.put("list", list);
 		return new ModelAndView("about",mode);
 	}
}
