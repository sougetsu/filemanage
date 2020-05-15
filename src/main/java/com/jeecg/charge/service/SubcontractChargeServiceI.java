package com.jeecg.charge.service;
import com.jeecg.charge.entity.SubcontractChargeEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface SubcontractChargeServiceI extends CommonService{
	
 	public void delete(SubcontractChargeEntity entity) throws Exception;
 	
 	public Serializable save(SubcontractChargeEntity entity) throws Exception;
 	
 	public void saveOrUpdate(SubcontractChargeEntity entity) throws Exception;
 	
}
