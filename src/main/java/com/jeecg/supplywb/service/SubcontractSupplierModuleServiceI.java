package com.jeecg.supplywb.service;
import com.jeecg.supplywb.entity.SubcontractSupplierModuleEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface SubcontractSupplierModuleServiceI extends CommonService{
	
 	public void delete(SubcontractSupplierModuleEntity entity) throws Exception;
 	
 	public Serializable save(SubcontractSupplierModuleEntity entity) throws Exception;
 	
 	public void saveOrUpdate(SubcontractSupplierModuleEntity entity) throws Exception;
 	
}
