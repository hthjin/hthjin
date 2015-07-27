package com.yc.controller.management;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.Cotton;
import com.yc.entity.CottonFactory;
import com.yc.service.ICottonFactoryService;
import com.yc.service.ICottonService;

//棉花工厂管理
@Controller
@RequestMapping("/management")
public class CottonFactoryController {

	private static final Logger LOG = Logger.getLogger(CottonFactoryController.class);
	
	@Autowired
	ICottonFactoryService cottonFactoryService;
	
	@Autowired
	ICottonService cottonService;
	
	@RequestMapping(value = "getAllCottonFactory", method = RequestMethod.GET)
	public ModelAndView getAllCottonFactory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<CottonFactory> cottonFactories= cottonFactoryService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("cottonFactories", cottonFactories);
		return new ModelAndView("management/cottonFactory", mode);
	}
	
	@RequestMapping(value = "addCottonFactoryList", method = RequestMethod.GET)
	public ModelAndView addCottonFactoryList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		mode.put("method", "add");
		return new ModelAndView("management/addCottonFactory",mode);
	}
	
	@RequestMapping(value = "updateCottonFactoryList", method = RequestMethod.GET)
	public ModelAndView updateCottonFactoryList(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CottonFactory newCottonFactory = cottonFactoryService.findById(id);
		ModelMap mode = new ModelMap();
		mode.put("method", "update");
		mode.put("cottonFactory", newCottonFactory);
		return new ModelAndView("management/addCottonFactory",mode);
	}
	
	@RequestMapping(value = "addCottonFactory", method = RequestMethod.POST)
	public String addCottonFactory(CottonFactory cottonFactory,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CottonFactory newCottonFactory = new CottonFactory();
		newCottonFactory.setFactoryId(null);
		newCottonFactory.setFactoryAddress(cottonFactory.getFactoryAddress());
		newCottonFactory.setFactoryName(cottonFactory.getFactoryName());
		newCottonFactory.setFactoryPhone(cottonFactory.getFactoryPhone());
		newCottonFactory.setLinkMan(cottonFactory.getLinkMan());
		cottonFactoryService.save(newCottonFactory);
		return "redirect:/management/getAllCottonFactory";
	}
	
	@RequestMapping(value = "updateCottonFactory", method = RequestMethod.POST)
	public String updateCottonFactory(Integer id,CottonFactory cottonFactory,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CottonFactory newCottonFactory = cottonFactoryService.findById(id);
		newCottonFactory.setFactoryAddress(cottonFactory.getFactoryAddress());
		newCottonFactory.setFactoryName(cottonFactory.getFactoryName());
		newCottonFactory.setFactoryPhone(cottonFactory.getFactoryPhone());
		newCottonFactory.setLinkMan(cottonFactory.getLinkMan());
		cottonFactoryService.update(newCottonFactory);
		return "redirect:/management/getAllCottonFactory";
	}
	
	@RequestMapping(value = "deleteCottonFactory", method = RequestMethod.GET)
	public String deleteCottonFactory(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Cotton> cottons = cottonService.deleteAllByFactoryId(id);
		for ( int i = 0; i < cottons.size(); i++ ) {
			cottonService.delete(cottons.get(i).getCottonId());
		}
		cottonFactoryService.delete(id);
		return "redirect:/management/getAllCottonFactory";
	}
	
	
	@RequestMapping(value = "getAllCotton", method = RequestMethod.GET)
	public ModelAndView getAllCotton(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Cotton> cottons= cottonService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("cottons", cottons);
		return new ModelAndView("management/cotton", mode);
	}
	
	@RequestMapping(value = "addCottonList", method = RequestMethod.GET)
	public ModelAndView addCottonList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		mode.put("method", "add");
		List<CottonFactory> cottonFactories= cottonFactoryService.getAll();
		mode.put("cottonFactories", cottonFactories);
		return new ModelAndView("management/addCotton",mode);
	}
	
	@RequestMapping(value = "updateCottonList", method = RequestMethod.GET)
	public ModelAndView updateCottonList(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cotton newCotton = cottonService.findById(id);
		ModelMap mode = new ModelMap();
		List<CottonFactory> cottonFactories= cottonFactoryService.getAll();
		mode.put("cottonFactories", cottonFactories);
		mode.put("method", "update");
		mode.put("cotton", newCotton);
		return new ModelAndView("management/addCotton",mode);
	}
	
	@RequestMapping(value = "addCotton", method = RequestMethod.POST)
	public String addCotton(Cotton cotton,Integer cottonFactoryId, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CottonFactory cottonFactory = cottonFactoryService.findById(cottonFactoryId);
		Cotton newCotton= new Cotton();
		newCotton.setAmount(cotton.getAmount());
		newCotton.setBatch(cotton.getBatch());
		newCotton.setCottonFactory(cottonFactory);
		newCotton.setCottonType(cotton.getCottonType());
		newCotton.setDate(cotton.getDate());
		newCotton.setIsCheck(cotton.getIsCheck());
		newCotton.setIsSell(cotton.getIsSell());
		newCotton.setNetWeight(cotton.getNetWeight());
		newCotton.setPrice(cotton.getPrice());
		newCotton.setWarehouse(cotton.getWarehouse());
		newCotton.setWeight(cotton.getWeight());
		cottonService.save(newCotton);
		return "redirect:/management/getAllCotton";
	}
	
	@RequestMapping(value = "updateCotton", method = RequestMethod.POST)
	public String updateCotton(Integer cottonId,Integer cottonFactoryId,Cotton cotton,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cotton newCotton = cottonService.findById(cottonId);
		CottonFactory cottonFactory = cottonFactoryService.findById(cottonFactoryId);
		newCotton.setAmount(cotton.getAmount());
		newCotton.setBatch(cotton.getBatch());
		newCotton.setCottonFactory(cottonFactory);
		newCotton.setCottonType(cotton.getCottonType());
		newCotton.setDate(cotton.getDate());
		newCotton.setIsCheck(cotton.getIsCheck());
		newCotton.setIsSell(cotton.getIsSell());
		newCotton.setNetWeight(cotton.getNetWeight());
		newCotton.setPrice(cotton.getPrice());
		newCotton.setWarehouse(cotton.getWarehouse());
		newCotton.setWeight(cotton.getWeight());
		cottonService.update(newCotton);
		return "redirect:/management/getAllCotton";
	}
	
	@RequestMapping(value = "deleteCotton", method = RequestMethod.GET)
	public String deleteCotton(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		cottonService.delete(id);
		return "redirect:/management/getAllCotton";
	}
}
