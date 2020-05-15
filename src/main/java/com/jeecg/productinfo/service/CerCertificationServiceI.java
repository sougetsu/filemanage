package com.jeecg.productinfo.service;
import com.jeecg.productinfo.entity.CerCertificationEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface CerCertificationServiceI extends CommonService{
	
 	public void delete(CerCertificationEntity entity) throws Exception;
 	
 	public Serializable save(CerCertificationEntity entity) throws Exception;
 	
 	public void saveOrUpdate(CerCertificationEntity entity) throws Exception;
 	
}
