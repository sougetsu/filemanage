package com.jeecg.supplywb.service.impl;
import com.jeecg.supplywb.service.SubcontractSupplierModuleServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import com.jeecg.supplywb.entity.SubcontractSupplierModuleEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.io.Serializable;
import org.jeecgframework.core.util.ApplicationContextUtil;
import org.jeecgframework.core.util.MyClassLoader;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.web.cgform.enhance.CgformEnhanceJavaInter;

import org.jeecgframework.minidao.util.FreemarkerParseFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.jeecgframework.core.util.ResourceUtil;

@Service("subcontractSupplierModuleService")
@Transactional
public class SubcontractSupplierModuleServiceImpl extends CommonServiceImpl implements SubcontractSupplierModuleServiceI {

	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
 	public void delete(SubcontractSupplierModuleEntity entity) throws Exception{
 		super.delete(entity);
 	}
 	
 	public Serializable save(SubcontractSupplierModuleEntity entity) throws Exception{
 		Serializable t = super.save(entity);
 		return t;
 	}
 	
 	public void saveOrUpdate(SubcontractSupplierModuleEntity entity) throws Exception{
 		super.saveOrUpdate(entity);
 	}
 	
}