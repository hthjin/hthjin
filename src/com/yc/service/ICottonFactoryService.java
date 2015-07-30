package com.yc.service;

import java.util.List;

import com.yc.entity.CottonFactory;

public interface ICottonFactoryService extends IGenericService<CottonFactory> {

	/**
	 * 根据棉花类型查询棉花工厂
	 * @param cottonType
	 * @return
	 */
	List<CottonFactory> getAllByType(String cottonType);


}
