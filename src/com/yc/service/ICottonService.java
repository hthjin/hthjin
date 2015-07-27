package com.yc.service;


import java.util.List;

import com.yc.entity.Cotton;

public interface ICottonService extends IGenericService<Cotton> {

	List<Cotton> deleteAllByFactoryId(Integer factoryId);
}
