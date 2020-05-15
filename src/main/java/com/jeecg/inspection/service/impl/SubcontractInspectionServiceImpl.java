package com.jeecg.inspection.service.impl;
import java.io.Serializable;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeecg.inspection.entity.SubcontractInspectionEntity;
import com.jeecg.inspection.service.SubcontractInspectionServiceI;

@Service("subcontractInspectionService")
@Transactional
public class SubcontractInspectionServiceImpl extends CommonServiceImpl implements SubcontractInspectionServiceI {

	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
 	public void delete(SubcontractInspectionEntity entity) throws Exception{
 		super.delete(entity);
 	}
 	
 	public Serializable save(SubcontractInspectionEntity entity) throws Exception{
 		Serializable t = super.save(entity);
 		return t;
 	}
 	
 	public void saveOrUpdate(SubcontractInspectionEntity entity) throws Exception{
 		super.saveOrUpdate(entity);
 	}
 	
}