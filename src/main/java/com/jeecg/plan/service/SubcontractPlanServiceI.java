package com.jeecg.plan.service;
import com.jeecg.plan.entity.SubcontractPlanEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface SubcontractPlanServiceI extends CommonService{
	
 	public void delete(SubcontractPlanEntity entity) throws Exception;
 	
 	public Serializable save(SubcontractPlanEntity entity) throws Exception;
 	
 	public void saveOrUpdate(SubcontractPlanEntity entity) throws Exception;
 	
}
