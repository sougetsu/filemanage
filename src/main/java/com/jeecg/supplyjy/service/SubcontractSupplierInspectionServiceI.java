package com.jeecg.supplyjy.service;
import com.jeecg.supplyjy.entity.SubcontractSupplierInspectionEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface SubcontractSupplierInspectionServiceI extends CommonService{
	
 	public void delete(SubcontractSupplierInspectionEntity entity) throws Exception;
 	
 	public Serializable save(SubcontractSupplierInspectionEntity entity) throws Exception;
 	
 	public void saveOrUpdate(SubcontractSupplierInspectionEntity entity) throws Exception;
 	
}
