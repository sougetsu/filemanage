package com.jeecg.supply.service;
import com.jeecg.supply.entity.SubcontractSupplierEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface SubcontractSupplierServiceI extends CommonService{
	
 	public void delete(SubcontractSupplierEntity entity) throws Exception;
 	
 	public Serializable save(SubcontractSupplierEntity entity) throws Exception;
 	
 	public void saveOrUpdate(SubcontractSupplierEntity entity) throws Exception;
 	
}
