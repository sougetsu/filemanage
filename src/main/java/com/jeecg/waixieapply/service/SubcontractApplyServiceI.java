package com.jeecg.waixieapply.service;
import com.jeecg.waixieapply.entity.SubcontractApplyEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface SubcontractApplyServiceI extends CommonService{
	
 	public void delete(SubcontractApplyEntity entity) throws Exception;
 	
 	public Serializable save(SubcontractApplyEntity entity) throws Exception;
 	
 	public void saveOrUpdate(SubcontractApplyEntity entity) throws Exception;
 	
}
