package com.yc.service.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.CottonFactory;
import com.yc.service.ICottonFactoryService;
@Component
public class CottonFactoryService extends GenericService<CottonFactory> implements ICottonFactoryService {
	@Autowired
	GenericDao<CottonFactory> cottonFactoryDao;

	@Override
	GenericDao<CottonFactory> getDao() {
		return cottonFactoryDao;
	}

	/* (non-Javadoc)
	 * 根据棉花类型查找棉花工厂
	 * @see com.yc.service.ICottonFactoryService#getAllByType(java.lang.String)
	 */
	@Override
	public List<CottonFactory> getAllByType(Integer cottonType) {
		StringBuffer hql=new StringBuffer("SELECT cottonfactory.* FROM cotton RIGHT JOIN cottonfactory ON cotton.cottonFactory_id=cottonfactory.factoryId");
		if(cottonType==6){
			 hql.append(" WHERE cotton.cottonType='手采棉花' GROUP BY cottonfactory.factoryId");
		}else if(cottonType==7){
			 hql.append(" WHERE cotton.cottonType='机采棉花' GROUP BY cottonfactory.factoryId");
		}else if(cottonType==-1){
			hql.append(" GROUP BY cottonfactory.factoryId");
		}
		Query query = cottonFactoryDao.getEntityManager().createNativeQuery(hql.toString(), CottonFactory.class);
		@SuppressWarnings("unchecked")
		List<CottonFactory> list =  query.getResultList();
		return list;
	}
	
}
