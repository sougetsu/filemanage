package com.jeecg.filemanage.service;
import com.jeecg.filemanage.entity.TestFilestoreEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface TestFilestoreServiceI extends CommonService{
	
 	public void delete(TestFilestoreEntity entity) throws Exception;
 	
 	public Serializable save(TestFilestoreEntity entity) throws Exception;
 	
 	public void saveOrUpdate(TestFilestoreEntity entity) throws Exception;
 	
}
