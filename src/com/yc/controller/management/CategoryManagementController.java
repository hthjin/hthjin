package com.yc.controller.management;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.AgriculturalsSort;
import com.yc.entity.Brand;
import com.yc.entity.Language;
import com.yc.entity.News;
import com.yc.entity.Products;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommodity;
import com.yc.entity.Specifications;
import com.yc.service.IAgriculturalsSortService;
import com.yc.service.IBrandService;
import com.yc.service.INewsService;
import com.yc.service.IProductsService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommodityService;
import com.yc.service.ISpecificationsService;

//类别管理
@Controller
@RequestMapping("/management")
public class CategoryManagementController {

	private static final Logger LOG = Logger.getLogger(CategoryManagementController.class);
	
	@Autowired
	IShopCategoryService categoryService;
	
	@Autowired
	IBrandService brandService;
	
	@Autowired
	ISpecificationsService specificationsService;
	
	@Autowired
	IShopCommodityService shopCommoidtyService;
	
	@Autowired
	INewsService newsService;
	
	@Autowired
	IAgriculturalsSortService	sortService;
	
	@Autowired
	IProductsService productsService;
	
	/**
	 * 查询类别
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "sortList", method = RequestMethod.GET)
	public ModelAndView sortList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ShopCategory> list = categoryService.getAllByParent();
		ModelMap mode = new ModelMap();
		mode.put("treeList1", list);
		return new ModelAndView("management/sortList", mode);
	}
	/**
	 * 添加类别
	 * @param page
	 * @param departmentID 类别ID
	 * @param departmentname 类别名称
	 * @param describes 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "addOrUpdateDep", method = RequestMethod.POST)
	public String addOrUpdateDep(String page, Integer departmentID, String departmentname, String describes, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCategory department = categoryService.findById(departmentID);
		department = addDepartment(department, departmentname);
		if(departmentID == null){
			departmentID = department.getCategoryID();
		}
		return "redirect:/management/getAgriculturalsSort?id=" + departmentID+"&page=sortList";
	}
	
	private ShopCategory addDepartment(ShopCategory parentDepartment, String departmentname) {
		ShopCategory department = new ShopCategory();
		department.setParentLevel(parentDepartment);
		department.setCategory(departmentname);
		department = categoryService.save(department);
		if (parentDepartment != null) {
			parentDepartment.getChildren().add(department);
			categoryService.update(parentDepartment);
		}
		return department;
	}
	/**
	 * 通过类别ID查询类别
	 * @param id 类别ID
	 * @param page sortList or orther
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "getAgriculturalsSort", method = RequestMethod.GET)
	public ModelAndView getAgriculturalsSort(Integer id, String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCategory department = categoryService.findById(id);
		List<ShopCategory> list = categoryService.getAllByParent();
		ModelMap mode = new ModelMap();
		mode.put("shopCategory", department);
		mode.put("treeList1", list);
		if (page.equals("sortList")) {
			return new ModelAndView("management/sortList", mode);
		} else {
			return new ModelAndView("management/addProducts", mode);
		}
	}
	/**
	 * 更新类别
	 * @param departmentId 类别ID
	 * @param departmentname 类别名称
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "updateDepartmen", method = RequestMethod.POST)
	public String updateDepartmen(Integer departmentId, String departmentname,  HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCategory department = categoryService.findById(departmentId);
		ShopCategory depart = null;
		if (department != null) {
			depart = updateDepartment(department, departmentname);
		}
		return "redirect:/management/getAgriculturalsSort?id=" + depart.getCategoryID()+"&page=sortList";
	}
	
	private ShopCategory updateDepartment(ShopCategory department, String departmentname) {
		department.setCategory(departmentname);
		department = categoryService.update(department);
		return department;
	}
	/**
	 * 类别禁用
	 * @param departmentId
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "deleteDepartmen", method = RequestMethod.POST)
	public String deleteDepartmen(Integer departmentId, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCategory department = categoryService.findById(departmentId);
		getNode(department);
		return "redirect:/management/getAgriculturalsSort?id=" + department.getCategoryID()+"&page=sortList";
	}
	
	private void getNode(ShopCategory department) {
		List<ShopCategory> list = department.getChildren();
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				ShopCategory dep = list.get(i);
				if (dep.getChildren() != null && dep.getChildren().size() > 0) {
					getNode(dep);
				}
				dep.setIsForbidden(!dep.getIsForbidden());
				categoryService.update(dep);
			}
		}
		department.setIsForbidden(!department.getIsForbidden());
		categoryService.update(department);
	}
	/**
	 * 品牌展示
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "brandList", method = RequestMethod.GET)
	public ModelAndView brandList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Brand> list = brandService.getAll();
		List<ShopCategory> categories = categoryService.getAllByParent();
		ModelMap mode = new ModelMap();
		mode.put("categories", categories);
		mode.put("list", list);
		return new ModelAndView("management/brandList",mode);
	}
	/**
	 * 通过类别ID，查询类别，
	 * @param cateID
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "getCateByCateID", method = RequestMethod.GET)
	public ModelAndView getCateByCateID(Integer cateID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCategory cate = categoryService.findById(cateID);
		List<ShopCategory> categories = categoryService.getAllByParent();
		ModelMap mode = new ModelMap();
		mode.put("categories", categories);
		mode.put("shopCategory", cate);
		return new ModelAndView("management/brandList",mode);
	}
	/**
	 * 根据类别ID，品牌ID查询品牌和类别，用于展示品牌和类别
	 * @param cateID 类别ID
	 * @param brandID 品牌ID
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "getBrandByCateID", method = RequestMethod.GET)
	public ModelAndView getBrandByCateID(Integer cateID,Integer brandID,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Brand brand = brandService.findById(brandID);
		ShopCategory cate = categoryService.findById(cateID);
		List<ShopCategory> categories = categoryService.getAllByParent();
		ModelMap mode = new ModelMap();
		mode.put("categories", categories);
		mode.put("brand", brand);
		mode.put("shopCategory", cate);
		return new ModelAndView("management/brandList",mode);
	}
	/**
	 * 添加品牌 POST
	 * @param sendFile 上传文件
	 * @param categoryID 类别ID
	 * @param brandName 品牌名称
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "addBrand", method = RequestMethod.POST)
	public String addBrand(@RequestParam("sendFile") MultipartFile sendFile,Integer categoryID,String brandName,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCategory cate = categoryService.findById(categoryID);
		if (cate != null) {
			String name = sendFile.getOriginalFilename();
			String pathDir = "../images/brand/";
			if (!name.equals("")) {
				String logoRealPathDir = request.getSession().getServletContext().getRealPath(pathDir);
				File file1 = new File(logoRealPathDir);
				if (!file1.exists())
					file1.mkdirs();
				File file = new File(logoRealPathDir, name);
				if (file.getParentFile() == null)
					file.mkdirs();
				sendFile.transferTo(file);
			}
			Brand brand = brandService.getBrandName(brandName);
			if (brand !=null ) {
				brand.setBrandName(brandName);
				if (!name.equals("")) {
					brand.setLogo(pathDir+name);
				}
			}else{
				brand = new Brand();
				brand.setBrandName(brandName);
				if (!name.equals("")) {
					brand.setLogo(pathDir+name);
				}
				brand = brandService.save(brand);
			}
			List<ShopCategory> shopCateges = brand.getShopCateges();
			if (shopCateges == null || shopCateges.size()==0) {
				shopCateges = new ArrayList<ShopCategory>();
			}
			if (!shopCateges.contains(cate)) {
				shopCateges.add(cate);
				brand.setShopCateges(shopCateges);
			}
			if (!cate.getBrands().contains(brand)) {
				cate.getBrands().add(brand);
			}
			brandService.update(brand);
			categoryService.update(cate);
		}
		return "redirect:/management/getCateByCateID?cateID="+categoryID;
	}
	/**
	 * 更新品牌
	 * @param sendFile 上传的文件
	 * @param categoryID 类别ID
	 * @param brandID 品牌ID
	 * @param brandName 品牌名称
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "updateBrand", method = RequestMethod.POST)
	public String updateBrand(@RequestParam("sendFile") MultipartFile sendFile,Integer categoryID,Integer brandID, String brandName,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (brandID !=null && !brandID.equals("")) {
			String name = sendFile.getOriginalFilename();
			String pathDir = "images/brand/";
			if (!name.equals("")) {
				String logoRealPathDir = request.getSession().getServletContext().getRealPath("../");
				File file1 = new File(logoRealPathDir).getCanonicalFile();
				if (!file1.exists())
					file1.mkdirs();
				File file = new File(logoRealPathDir+pathDir, name).getCanonicalFile();
				if (file.getParentFile() == null)
					file.mkdirs();
				sendFile.transferTo(file);
			}
			Brand brand = brandService.findById(brandID);
			if (brand != null ) {
				brand.setBrandName(brandName);
				if (!name.equals("")) {
					brand.setLogo(pathDir+name);
				}
				brand = brandService.update(brand);
			}
			ShopCategory cate = categoryService.findById(categoryID);
			if (cate != null ) {
				List<Brand> brands = cate.getBrands();
				for (int i = 0; i < brands.size(); i++) {
					Brand brandOld = brands.get(i);
					if (brandOld.getBrandID() == brand.getBrandID()) {
						brandOld.setBrandName(brand.getBrandName());
					}
				}
				cate.setBrands(brands);
			}
		}
		return "redirect:/management/getBrandByCateID?cateID="+categoryID+"&brandID="+brandID;
	}
	/**
	 * 删除类别下的品牌，并删除品牌与商品的关联关系
	 * @param categoryID 类别ID
	 * @param brandID 品牌ID
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "deleteBrand", method = RequestMethod.GET)
	public String deleteBrand(Integer categoryID,Integer brandID,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCategory cate = categoryService.findById(categoryID);
		Brand brand = brandService.findById(brandID);
		if (brand != null) {
			List<ShopCommodity> list = brand.getShopCommoidties();
			if (list.size()>0) {
				for (int i = 0; i < list.size(); i++) {
					ShopCommodity shopComm = list.get(i);
					shopComm.setBrand(null);
					shopCommoidtyService.update(shopComm);
				}
			}
			List<ShopCategory> cates = brand.getShopCateges();
			if (cates.size()>0) {
				for (int i = 0; i < cates.size(); i++) {
					if (cates.get(i).getCategoryID()==cate.getCategoryID()) {
						cates.remove(cates.get(i));
					}
				}
			}
			brandService.update(brand);
			List<Brand> brands = cate.getBrands();
			for (int i = 0; i < brands.size(); i++) {
				System.out.println("brands.get(i).getBrandID() == brand.getBrandID()============="+(brands.get(i).getBrandID() == brand.getBrandID()));
				if (brands.get(i).getBrandID() == brand.getBrandID()) {
					brands.remove(brands.get(i)); 
				}
			}
			categoryService.update(cate);
			if (brand.getShopCateges().size() == 0) {
				brandService.delete(brandID);
			}
		}
		return "redirect:/management/getBrandByCateID?cateID="+categoryID+"&brandID="+brandID;
	}
	/**
	 * 规格展示
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "specManage", method = RequestMethod.GET)
	public ModelAndView specManage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<Specifications> list = specificationsService.getAll();
		mode.put("list", list);
		return new ModelAndView("management/specManage",mode);
	}
	/**
	 * 规格添加GET
	 * @param page add
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "addSpec", method = RequestMethod.GET)
	public ModelAndView addSpec(String page,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		mode.put("page", page);
		return new ModelAndView("management/addSpec",mode);
	}
	/**
	 * 规格添加 POST
	 * @param spec 规格属性
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "specAdd", method = RequestMethod.POST)
	public String specAdd(Specifications spec, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		spec.setAttribute(spec.getAttribute().replace("，", ","));
		specificationsService.save(spec);
		return "redirect:/management/specManage";
	}
	/**
	 * 通过规格ID查找规格,为规格更新做准备
	 * @param page update
	 * @param id 规格ID
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "updateSpec", method = RequestMethod.GET)
	public ModelAndView updateSpec(String page,Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		mode.put("page", page);
		Specifications spec = specificationsService.findById(id);
		mode.put("spec", spec);
		return new ModelAndView("management/addSpec",mode);
	}
	/**
	 * 更行规格属性,整体更新
	 * @param spec
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "updateSpec", method = RequestMethod.POST)
	public String updateSpecs(Specifications spec, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Specifications specs = specificationsService.findById(spec.getId());
		if (specs != null) {
			specs.setAttribute(spec.getAttribute().replace("，", ","));
			specs.setSpecificatName(spec.getSpecificatName());
			specificationsService.update(specs);
		}
		return "redirect:/management/specManage";
	}
	/**
	 * 展示所有类别属性和规格，为规格分配准备
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "specDivide", method = RequestMethod.GET)
	public ModelAndView specDivide(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Specifications> list = specificationsService.getAll();
		List<ShopCategory> categories = categoryService.getAllByParent();
		ModelMap mode = new ModelMap();
		mode.put("categories", categories);
		mode.put("list", list);
		return new ModelAndView("management/specDivide",mode);
	}
	/**
	 * 通过类别ID查找类别，进行规格分配
	 * @param cateID
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "getCateByID", method = RequestMethod.GET)
	public ModelAndView getCateByID(Integer cateID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCategory cate = categoryService.findById(cateID);
		List<ShopCategory> categories = categoryService.getAllByParent();
		List<Specifications> list = specificationsService.getAll();
		List<Specifications> cateSpec = cate.getSpecifications();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		mode.put("cateSpec", cateSpec);
		mode.put("categories", categories);
		mode.put("shopCategory", cate);
		return new ModelAndView("management/specDivide",mode);
	}
	
	/**
	 * 规格属性与分类绑定
	 * @param categoryID
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "divideSpec", method = RequestMethod.POST)
	public String divideSpec(Integer categoryID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCategory cate = categoryService.findById(categoryID);
		List<Specifications> cateSpec = cate.getSpecifications();
		String[] specs = request.getParameterValues("specs");
		if (cateSpec == null || cateSpec.size() == 0) {
			notCateAdd(cate, specs);
		}else{
			List<Specifications> specss = specificationsService.getAll();
			if(specs != null && specs.length >0){
				haveCateOrther(cate, cateSpec, specs, specss);
			}else{
				haveCateDel(cate, specss);
			}
		}
		return "redirect:/management/getCateByID?cateID="+categoryID;
	}
	
	/**
	 * 删除有属性类别
	 * @param cate
	 * @param specss
	 */
	private void haveCateDel(ShopCategory cate, List<Specifications> specss) {
		for (int i = 0; i < specss.size(); i++) {
			Specifications spe = specss.get(i);
			List<ShopCategory> cates = spe.getShopCategories();
			for (int j = 0; j < cates.size(); j++) {
				if(cates.get(j).getCategoryID() == cate.getCategoryID()){
					cates.remove(cates.get(j));
				}
			}
			specificationsService.update(spe);
		}
		cate.setSpecifications(null);
		cate = categoryService.update(cate);
	}

	/**
	 * 分配规格
	 * @param cate
	 * @param cateSpec
	 * @param specs
	 * @param specss
	 * @param lengths 
	 */
	private void haveCateOrther(ShopCategory cate, List<Specifications> cateSpec, String[] specs, List<Specifications> specss) {
		List<Specifications> cateSpec2 = new ArrayList<Specifications>();
		for ( int m = 0; m<cateSpec.size(); m++){
			   cateSpec2.add(cateSpec.get(m));
		}
		for (int i = 0; i < cateSpec2.size(); i++) {
			boolean isok = true;
			for (int j = 0; j < specs.length; j++) {
				Specifications spec = specificationsService.findById(Integer.parseInt(specs[j]));
				if (spec != null) {
					if(cateSpec2.get(i).getId() == spec.getId()){
						isok = false;
					}
				}
			}
			if (isok) {
				for (int j = 0; j < specss.size(); j++) {
					if(specss.get(j).getId() == cateSpec2.get(i).getId()){
						Specifications spe = specss.get(j);
						List<ShopCategory> specate = spe.getShopCategories();
						for (int k = 0; k < specate.size(); k++) {
							if(specate.get(k).getCategoryID() == cate.getCategoryID()){
								specate.remove(specate.get(k));
							}
						}  
						specificationsService.update(spe);
					}
				}
				cate.getSpecifications().remove(cateSpec2.get(i)); 
				cate = categoryService.update(cate);
			}
		}
		for (int j = 0; j < specs.length; j++) {
			Specifications spec = specificationsService.findById(Integer.parseInt(specs[j]));
			if (spec != null) {
				boolean isok = true;
				for (int i = 0; i < cateSpec.size(); i++) {
					if(spec.getId() == cateSpec.get(i).getId()){
						isok = false;
					}
				}
				if (isok) {
					List<ShopCategory> catespe = spec.getShopCategories();
					if (catespe !=null && catespe.size()>0) {
						catespe.add(cate);
					}else{
						catespe = new ArrayList<ShopCategory>();
						catespe.add(cate);
						spec.setShopCategories(catespe);
					}
					specificationsService.update(spec);
					cate.getSpecifications().add(spec);
					categoryService.update(cate);
				}
			}
		}
	}

	/**
	 * 类别属性没有规格，新添加
	 * @param cate
	 * @param specs
	 */
	private void notCateAdd(ShopCategory cate, String[] specs) {
		List<Specifications> specList;
		List<ShopCategory> cateList;
		if (specs != null && specs.length >0) {
			specList = new ArrayList<Specifications>();
			for (int i = 0; i < specs.length; i++) {
				 Specifications spec = specificationsService.findById(Integer.parseInt(specs[i]));
				 if (spec.getShopCategories().size()>0) {
					 cateList = spec.getShopCategories();
				 }else{
					 cateList = new ArrayList<ShopCategory>();
				 }
				 cateList.add(cate);
				 spec.setShopCategories(cateList);
				 spec = specificationsService.update(spec);
				 specList.add(spec); 
			}
			cate.setSpecifications(specList);
			cate = categoryService.update(cate);
		}
	}
	
	@RequestMapping(value = "shouYeSort", method = RequestMethod.GET)
	public ModelAndView shouyesortList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<AgriculturalsSort> list = sortService.getSortByParent();
		ModelMap mode = new ModelMap();
		mode.put("treeList1", list);
		return new ModelAndView("management/shouYeSort", mode);
	}

	@RequestMapping(value = "shouyeaddOrUpdateDep", method = RequestMethod.POST)
	public String addOrUpdateDep(String page, Integer departmentID, String departmentname, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AgriculturalsSort department = sortService.findById(departmentID);
		AgriculturalsSort depart = null;
		depart = shoueyeaddDepartment(department, departmentname);
		return "redirect:/management/shouyegetAgriculturalsSort?id=" + depart.getId() + "&page=sortList";
	}

	private AgriculturalsSort shoueyeaddDepartment(AgriculturalsSort parentDepartment, String departmentname) {
		AgriculturalsSort department = new AgriculturalsSort();
		department.setParentLevel(parentDepartment);
		department.setDepartmentname(departmentname);
		department = sortService.save(department);
		if (parentDepartment != null) {
			parentDepartment.getChildren().add(department);
			sortService.update(parentDepartment);
		}
		return department;
	}

	@RequestMapping(value = "shouyegetAgriculturalsSort", method = RequestMethod.GET)
	public ModelAndView shouyegetAgriculturalsSort(Integer id, String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AgriculturalsSort department = sortService.findById(id);
		List<AgriculturalsSort> list = sortService.getSortByParent();
		ModelMap mode = new ModelMap();
		mode.put("department", department);
		mode.put("treeList1", list);
		if (page.equals("sortList")) {
			return new ModelAndView("management/shouYeSort", mode);
		} else {
			return new ModelAndView("management/shouyeaddProducts", mode);
		}
	}

	@RequestMapping(value = "shouyeupdateDepartmen", method = RequestMethod.POST)
	public String shouyeupdateDepartmen(Integer departmentId, String departmentname, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AgriculturalsSort department = sortService.findById(departmentId);
		AgriculturalsSort depart = null;
		if (department != null) {
			depart = shouyeupdateDepartment(department, departmentname);
		}
		return "redirect:/management/shouyegetAgriculturalsSort?id=" + depart.getId() + "&page=sortList";
	}

	private AgriculturalsSort shouyeupdateDepartment(AgriculturalsSort department, String departmentname) {
		department.setDepartmentname(departmentname);
		department = sortService.update(department);
		return department;
	}

	@RequestMapping(value = "shouyedeleteDepartmen", method = RequestMethod.POST)
	public String shoyedeleteDepartmen(Integer departmentId, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AgriculturalsSort department = sortService.findById(departmentId);
		getNodeshouye(department);
		return "redirect:/management/shouYeSort";
	}

	private void getNodeshouye(AgriculturalsSort department) {
		Set<AgriculturalsSort> list = department.getChildren();
		if (list != null && list.size() > 0) {
			Iterator<AgriculturalsSort> iter = list.iterator();
			while (iter.hasNext()) {
				AgriculturalsSort dep = iter.next();
				if (dep.getChildren() != null && dep.getChildren().size() > 0) {
					getNodeshouye(dep);
				}
				Set<Products> depAndPos = dep.getProducts();
				if (depAndPos != null && depAndPos.size() > 0) {
					Iterator<Products> iterator = depAndPos.iterator();
					while (iterator.hasNext()) {
						Products depAndPoss = iterator.next();
						productsService.delete(depAndPoss.getId());
					}
				}
				sortService.deleteSort(dep);
			}
		}
		Set<Products> depAndPos = department.getProducts();
		if (depAndPos != null && depAndPos.size() > 0) {
			Iterator<Products> iterator = depAndPos.iterator();
			while (iterator.hasNext()) {
				Products depAndPoss = iterator.next();
				productsService.delete(depAndPoss.getId());
			}
		}
		sortService.deleteSort(department);
	}

	@RequestMapping(value = "shouyeproductslist", method = RequestMethod.GET)
	public ModelAndView shouyeproductslist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<Products> list = productsService.getAll();
		mode.put("list", list);
		return new ModelAndView("management/shouyeproductslist", mode);
	}

	@RequestMapping(value = "shouyeaddProducts", method = RequestMethod.GET)
	public ModelAndView shouyeaddProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<AgriculturalsSort> tree1 = sortService.getSortByParent();
		mode.put("treeList1", tree1);
		return new ModelAndView("management/shouyeaddProducts", mode);
	}

	@RequestMapping(value = "shouyeaddProducts", method = RequestMethod.POST)
	public String shouyeaddProducts(Integer productsID, Integer departmentID, String productsName, String effect, String benefits, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		AgriculturalsSort sort = sortService.findById(departmentID);
		List<AgriculturalsSort> list = sortService.getSortByParent();
		ModelMap mode = new ModelMap();
		mode.put("department", sort);
		mode.put("treeList1", list);
		if (sort != null) {
			Products products = productsService.findById(productsID);
			if (multipartResolver.isMultipart(request)) {
				String productsPhoto = "content/static/images/";
				List<String> recommends = new ArrayList<String>();
				MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
				// 取得request中的所有文件名
				Iterator<String> iter = multiRequest.getFileNames();
				while (iter.hasNext()) {
					// 取得上传文件
					MultipartFile file = multiRequest.getFile(iter.next());
					System.out.println("file========="+file.getSize());
					if (file != null ) {
						// 取得当前上传文件的文件名称
						String myFileName = file.getOriginalFilename();
						// 如果名称不为“”,说明该文件存在，否则说明该文件不存在
						if (myFileName.trim() != "") {
							// 重命名上传后的文件名
							String fileName = file.getOriginalFilename();
							System.out.println("fileName=========="+fileName);
							System.out.println("isChineseName(fileName)=========="+isChineseName(fileName));
							if(isChineseName(fileName)){
								fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+fileName.substring(fileName.lastIndexOf("."));;
							}else{
								fileName.toLowerCase();
							}
							// 定义上传路径
							System.out.println("file.getName().equals()" + file.getName());
							if (file.getName().equals("sendFile")) {
								String logoRealPathDir = request.getSession().getServletContext().getRealPath(productsPhoto);
								File file1 = new File(logoRealPathDir);
								if (!file1.exists())
									file1.mkdirs();
								File file2 = new File(logoRealPathDir, fileName);
								if (file2.getParentFile() == null)
									file2.mkdirs();
								file.transferTo(file2);
								productsPhoto = productsPhoto + fileName;
							} else {
								String recommend = "content/static/images/";
								String logoRealPathDir = request.getSession().getServletContext().getRealPath(recommend);
								File file1 = new File(logoRealPathDir);
								if (!file1.exists())
									file1.mkdirs();
								File file2 = new File(logoRealPathDir, fileName);
								if (file2.getParentFile() == null)
									file2.mkdirs();
								file.transferTo(file2);
								recommend = recommend + fileName;
								recommends.add(recommend);
							}
						}
					}
				}
				if (products == null) {
					products = new Products();

				}
				products.setEffect(effect);
				products.setProductsName(productsName);
				products.setBenefits(benefits);
				if (!productsPhoto.replace("content/static/images/", "").equals("")) {
					products.setProductsPhoto(productsPhoto);
				}
				if (recommends.size() > 0) {
					products.setRecommends(recommends);
				}
				products.setAgriculturalsSort(sort);
				products = productsService.save(products);
				sort.getProducts().add(products);
				mode.put("products", products);
			}
		}
		return "redirect:/management/shouyeproductslist";
	}

	private boolean isChineseName(String name) {
		return (name.getBytes().length == name.length())?false:true;
	}

	@RequestMapping(value = "shouyeupdateProducts", method = RequestMethod.GET)
	public ModelAndView updateProducts(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<AgriculturalsSort> tree1 = sortService.getSortByParent();
		Products products = productsService.findById(id);
		mode.put("treeList1", tree1);
		mode.put("products", products);
		mode.put("department", products.getAgriculturalsSort());
		return new ModelAndView("management/shouyeaddProducts", mode);
	}

	@RequestMapping(value = "shouyedeleteProducts", method = RequestMethod.GET)
	public String deleteProducts(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		productsService.delete(id);
		return "redirect:/management/shouyeproductslist";
	}

	@RequestMapping(value = "shouyenews", method = RequestMethod.GET)
	public ModelAndView news(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<News> list = newsService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/shouyenews", mode);
	}

	@RequestMapping(value = "shouyegetNews", method = RequestMethod.GET)
	public ModelAndView getNews(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		News news = newsService.findById(id);
		ModelMap mode = new ModelMap();
		mode.put("notice", news);
		return new ModelAndView("management/shouyegetNews", mode);
	}

	@RequestMapping(value = "shouyedeleteNews", method = RequestMethod.GET)
	public String deleteNews(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		newsService.delete(id);
		return "redirect:/management/shouyenews";
	}

	@RequestMapping(value = "shouyeaddNews", method = RequestMethod.GET)
	public ModelAndView addNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("management/shouyeaddNews");
	}

	@RequestMapping(value = "shouyeaddNews", method = RequestMethod.POST)
	public String shouyeaddNew(String languages, String contentNews, String title, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		News news = new News();
		news.setContent(contentNews);
		news.setTitle(title);
		news.setLanguage(Language.valueOf(languages));
		newsService.save(news);
		return "redirect:/management/shouyenews";
	}
}
