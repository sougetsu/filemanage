package com.jeecg.productinfo.service;
import com.jeecg.productinfo.entity.CerProductInfoEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface CerProductInfoServiceI extends CommonService{
	
 	public void delete(CerProductInfoEntity entity) throws Exception;
 	
 	public Serializable save(CerProductInfoEntity entity) throws Exception;
 	
 	public void saveOrUpdate(CerProductInfoEntity entity) throws Exception;
 	
}
