package com.yc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Products;
import com.yc.service.IProductsService;
import com.yc.service.impl.GenericService;

@Component
public class ProductsService extends GenericService<Products> implements IProductsService {

	@Autowired
	GenericDao<Products> productsDao;
	
	@Override
	GenericDao<Products> getDao() {
		return productsDao;
	}

	@Override
	public Products getAllByAgricult(int i) {
		return productsDao.getFirstRecord("agriculturalsSort.id", i);
	}
	
	@Override
	public List<Products> getProductsByAgricult(int i) {
		return productsDao.getBy("agriculturalsSort.id", i);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Products> getAllByParams(String text) {
		StringBuffer hql = new StringBuffer("select * from Products where productsName like '%"+text+"%'");
		return productsDao.getEntityManager().createNativeQuery(hql.toString(), Products.class).getResultList();
	}
	
	@Override
	public List<Products> getProductsInAgricult(int i, int j, int k) {
		StringBuffer hql = new StringBuffer(" from Products where agriculturalsSort.id in ("+i+","+j+","+k+")");
		return productsDao.find(hql.toString(), null, null);
	}
}
