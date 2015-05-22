package com.yc.service;

import java.util.List;
import java.util.Map;

import com.yc.entity.ShopCommoidty;

public interface IShopCommoidtyService extends IGenericService<ShopCommoidty> {

	/***
	 * 通过商家ID查找该商家商品
	 * @param id 商家ID
	 * @return
	 */
	List<ShopCommoidty> getAllByShop(Integer id);

	/***
	 * 通过boolean条件和商家ID查询该商家商品
	 * @param condition boolean条件
	 * @param isTrue boolean条件的值
	 * @param shopID 商家ID
	 * @return
	 */
	List<ShopCommoidty> getAllByCondition(String condition, boolean isTrue, Integer shopID);

	/***
	 * 通过商品类别ID和page查询商家商品
	 * @param id 类别ID
	 * @param page page=brand 查询品牌商品 page=special 查询折扣商品
	 * @return
	 */
	List<ShopCommoidty> getAllByShopCategoryID(Integer id, String page);

	/***
	 * 通过 规格、价格区段、类别ID、品牌ID查询商品
	 * @param map specs %,xx,%@%,xx,%规格、  money xxx@xxx价格区间段、 id类别ID、 brand (xxx,xxx) 品牌ID
	 * @param page special 折扣商品查询  brand品牌商品查询
	 * @return
	 */
	List<ShopCommoidty> getAllByParams(Map<String, Object> map, String page);

	/***
	 * 通过商品名称、商家ID查询商品
	 * @param commoName 商品名称
	 * @param shopID 商家ID
	 * @return
	 */
	List<ShopCommoidty> getAllByNameAndShop(String commoName, Integer shopID);

	/***
	 * 通过商品货号、商家ID查询商品
	 * @param commItem 商品货号
	 * @param id 商家ID
	 * @return
	 */
	ShopCommoidty getAllByCommItemAndShop(String commItem, Integer id);

	/***
	 * 通过商品规格查询商品的规格
	 * @param speces 商品规格
	 * @return
	 */
	List<String> getShopCommBySpeces(String speces);

	/***
	 * 通过商品商品名称、货号、商品编码
	 * @param map commoidtyName商品名称、commItem商品货号、commCode商品编码
	 * @return
	 */
	List<ShopCommoidty> getAllByParamsForBlack(Map<String, Object> map);
	
	/***
	 * 通过商品折扣、类别ID查询商品
	 * @param CateId 如果CateId<=1查询所有商品,CateId>1查询类别下的商品
	 * @param flag 是否折扣
	 * @return
	 */
	List<ShopCommoidty> getShopCommByCateAndIsspecial(Integer CateId, Boolean flag);

	/***
	 * 通过商品类别Id查询品牌商品
	 * @param id 类别ID id<=1 查询所有品牌商品 id>1 查询类别下的所有品牌商品
	 * @return
	 */
	List<ShopCommoidty> getShopCommByCateAndBrand(Integer id);

	/***
	 * 通过品牌ID查询品牌商品
	 * @param id 品牌ID
	 * @return
	 */
	List<ShopCommoidty> getShopCommByBrandId(Integer id);
	
	/***
	 * 通过商品名称或者商品类别名称或者品牌名称模糊查询商品，用于搜索栏
	 * @param content 商品名称 or 商品类别名称 or 品牌名称
	 * @return
	 */
	List<ShopCommoidty> searchShopComm(String content);

}
