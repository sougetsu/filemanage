package com.jeecg.inspection.service;
import java.io.Serializable;

import org.jeecgframework.core.common.service.CommonService;

import com.jeecg.inspection.entity.SubcontractInspectionEntity;

public interface SubcontractInspectionServiceI extends CommonService{
	
 	public void delete(SubcontractInspectionEntity entity) throws Exception;
 	
 	public Serializable save(SubcontractInspectionEntity entity) throws Exception;
 	
 	public void saveOrUpdate(SubcontractInspectionEntity entity) throws Exception;
 	
}
