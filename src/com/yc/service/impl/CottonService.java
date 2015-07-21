package com.yc.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Cotton;
import com.yc.service.ICottonService;
@Component
public class CottonService extends GenericService<Cotton> implements ICottonService {
	@Autowired
	GenericDao<Cotton> CottonDao;
	
	@Override
	GenericDao<Cotton> getDao() {
		return CottonDao;
	}

}
