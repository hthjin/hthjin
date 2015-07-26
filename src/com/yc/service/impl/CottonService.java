package com.yc.service.impl;

import java.util.List;

import javax.persistence.Query;

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

	@SuppressWarnings("unchecked")
	@Override
	public List<Cotton> deleteAllByFactoryId(Integer factoryId) {
		StringBuffer hql=new StringBuffer("select * FROM cotton WHERE cotton.cottonFactory_id = "+factoryId);
		Query query = CottonDao.getEntityManager().createNativeQuery(hql.toString(), Cotton.class);
		return query.getResultList();
	}

}
