package com.jeecg.materialmanage.service;
import com.jeecg.materialmanage.entity.FileRawMaterialEntity;
import org.jeecgframework.core.common.service.CommonService;

import java.io.Serializable;

public interface FileRawMaterialServiceI extends CommonService{
	
 	public void delete(FileRawMaterialEntity entity) throws Exception;
 	
 	public Serializable save(FileRawMaterialEntity entity) throws Exception;
 	
 	public void saveOrUpdate(FileRawMaterialEntity entity) throws Exception;
 	
}
