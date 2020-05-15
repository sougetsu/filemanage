package com.jeecg.module.service;
import com.jeecg.module.entity.ModulesubcontractApplyEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface ModulesubcontractApplyServiceI extends CommonService{
	
 	public void delete(ModulesubcontractApplyEntity entity) throws Exception;
 	
 	public Serializable save(ModulesubcontractApplyEntity entity) throws Exception;
 	
 	public void saveOrUpdate(ModulesubcontractApplyEntity entity) throws Exception;
 	
}
