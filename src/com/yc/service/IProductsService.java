package com.yc.service;

import java.util.List;

import com.yc.entity.Products;

public interface IProductsService extends IGenericService<Products> {

	Products getAllByAgricult(int i);

	List<Products> getProductsByAgricult(int i);

	List<Products> getAllByParams(String text);

	List<Products> getProductsInAgricult(int i, int j, int k);

}
