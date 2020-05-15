package com.jeecg.productinfo.service.impl;
import java.io.Serializable;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeecg.productinfo.entity.CerCertificationEntity;
import com.jeecg.productinfo.service.CerCertificationServiceI;

@Service("cerCertificationService")
@Transactional
public class CerCertificationServiceImpl extends CommonServiceImpl implements CerCertificationServiceI {

	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
 	public void delete(CerCertificationEntity entity) throws Exception{
 		super.delete(entity);
 	}
 	
 	public Serializable save(CerCertificationEntity entity) throws Exception{
 		if(entity.getZlbs()==1) {
 			entity.setZlzt(entity.getZlbzdj());
 			entity.setZlbzdj("");
 		}
 		// 生成合格证编号
 		entity.setHgzbh(getHgzLsh());
 		Serializable t = super.save(entity);
 		return t;
 	}
 	
 	public void saveOrUpdate(CerCertificationEntity entity) throws Exception{
 		super.saveOrUpdate(entity);
 	}
 	
}