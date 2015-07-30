package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.WuLiu;
import com.yc.service.IWuLiuService;

@Component
public class WuLiuService extends GenericService<WuLiu> implements IWuLiuService {

	@Autowired
	GenericDao<WuLiu> newsDao;

	@Override
	GenericDao<WuLiu> getDao() {
		return newsDao;
	}

}
