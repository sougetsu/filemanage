package com.jeecg.filemanage.service.impl;
import com.jeecg.filemanage.service.TestFilestoreServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import com.jeecg.filemanage.entity.TestFilestoreEntity;
import com.jeecg.ysxx.entity.SubcontractYsxxEntity;
import com.jeecg.cqfyxx.entity.SubcontractCqfxxxEntity;
import com.jeecg.bcsxxx.entity.SubcontractBcsxxxEntity;
import com.jeecg.ddsqbg.entity.SubcontractDdsqbgEntity;
import com.jeecg.dpa.entity.SubcontractDpaEntity;
import com.jeecg.jianzhi.entity.SubcontractJianzhiEntity;
import com.jeecg.csbhgqk.entity.SubcontractCsbhgqkEntity;
import com.jeecg.fzbhgqk.entity.SubcontractFzbhgqkEntity;
import com.jeecg.sxbhgqk.entity.SubcontractSxbhgqkEntity;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import org.jeecgframework.core.common.exception.BusinessException;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.ApplicationContextUtil;
import org.jeecgframework.core.util.MyClassLoader;
import org.jeecgframework.web.cgform.enhance.CgformEnhanceJavaInter;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.oConvertUtils;
import java.util.ArrayList;
import java.util.UUID;
import java.io.Serializable;

import java.util.Map;
import java.util.HashMap;
import org.jeecgframework.minidao.util.FreemarkerParseFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.jeecgframework.core.util.ResourceUtil;

@Service("testFilestoreService")
@Transactional
public class TestFilestoreServiceImpl extends CommonServiceImpl implements TestFilestoreServiceI {

	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
 	public void delete(TestFilestoreEntity entity) throws Exception{
 		super.delete(entity);
 	}
	public void addMain(TestFilestoreEntity testFilestore,
	        List<SubcontractYsxxEntity> subcontractYsxxList,List<SubcontractCqfxxxEntity> subcontractCqfxxxList,List<SubcontractBcsxxxEntity> subcontractBcsxxxList,List<SubcontractDdsqbgEntity> subcontractDdsqbgList,List<SubcontractDpaEntity> subcontractDpaList,List<SubcontractJianzhiEntity> subcontractJianzhiList,List<SubcontractCsbhgqkEntity> subcontractCsbhgqkList,List<SubcontractFzbhgqkEntity> subcontractFzbhgqkList,List<SubcontractSxbhgqkEntity> subcontractSxbhgqkList) throws Exception{
			//保存主信息
			this.save(testFilestore);
		
			/**保存-验收信息*/
			for(SubcontractYsxxEntity subcontractYsxx:subcontractYsxxList){
				//外键设置
				subcontractYsxx.setFileid(testFilestore.getId());
				this.save(subcontractYsxx);
			}
			/**保存-超期复验信息*/
			for(SubcontractCqfxxxEntity subcontractCqfxxx:subcontractCqfxxxList){
				//外键设置
				subcontractCqfxxx.setFileid(testFilestore.getId());
				this.save(subcontractCqfxxx);
			}
			/**保存-补充筛选信息*/
			for(SubcontractBcsxxxEntity subcontractBcsxxx:subcontractBcsxxxList){
				//外键设置
				subcontractBcsxxx.setFileid(testFilestore.getId());
				this.save(subcontractBcsxxx);
			}
			/**保存-单独水汽报告*/
			for(SubcontractDdsqbgEntity subcontractDdsqbg:subcontractDdsqbgList){
				//外键设置
				subcontractDdsqbg.setFileid(testFilestore.getId());
				this.save(subcontractDdsqbg);
			}
			/**保存-dpa*/
			for(SubcontractDpaEntity subcontractDpa:subcontractDpaList){
				//外键设置
				subcontractDpa.setFileid(testFilestore.getId());
				this.save(subcontractDpa);
			}
			/**保存-监制*/
			for(SubcontractJianzhiEntity subcontractJianzhi:subcontractJianzhiList){
				//外键设置
				subcontractJianzhi.setFileid(testFilestore.getId());
				this.save(subcontractJianzhi);
			}
			/**保存-测试不合格情况*/
			for(SubcontractCsbhgqkEntity subcontractCsbhgqk:subcontractCsbhgqkList){
				//外键设置
				subcontractCsbhgqk.setFileid(testFilestore.getId());
				this.save(subcontractCsbhgqk);
			}
			/**保存-封装不合格情况*/
			for(SubcontractFzbhgqkEntity subcontractFzbhgqk:subcontractFzbhgqkList){
				//外键设置
				subcontractFzbhgqk.setFileid(testFilestore.getId());
				this.save(subcontractFzbhgqk);
			}
			/**保存-筛选不合格情况*/
			for(SubcontractSxbhgqkEntity subcontractSxbhgqk:subcontractSxbhgqkList){
				//外键设置
				subcontractSxbhgqk.setFileid(testFilestore.getId());
				this.save(subcontractSxbhgqk);
			}
	}

	public void updateMain(TestFilestoreEntity testFilestore,
	        List<SubcontractYsxxEntity> subcontractYsxxList,List<SubcontractCqfxxxEntity> subcontractCqfxxxList,List<SubcontractBcsxxxEntity> subcontractBcsxxxList,List<SubcontractDdsqbgEntity> subcontractDdsqbgList,List<SubcontractDpaEntity> subcontractDpaList,List<SubcontractJianzhiEntity> subcontractJianzhiList,List<SubcontractCsbhgqkEntity> subcontractCsbhgqkList,List<SubcontractFzbhgqkEntity> subcontractFzbhgqkList,List<SubcontractSxbhgqkEntity> subcontractSxbhgqkList) throws Exception {
		//保存主表信息
		if(StringUtil.isNotEmpty(testFilestore.getId())){
			try {
				TestFilestoreEntity temp = findUniqueByProperty(TestFilestoreEntity.class, "id", testFilestore.getId());
				MyBeanUtils.copyBeanNotNull2Bean(testFilestore, temp);
				this.saveOrUpdate(temp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			this.saveOrUpdate(testFilestore);
		}
		//===================================================================================
		//获取参数
		Object id0 = testFilestore.getId();
		Object id1 = testFilestore.getId();
		Object id2 = testFilestore.getId();
		Object id3 = testFilestore.getId();
		Object id4 = testFilestore.getId();
		Object id5 = testFilestore.getId();
		Object id6 = testFilestore.getId();
		Object id7 = testFilestore.getId();
		Object id8 = testFilestore.getId();
		//===================================================================================
		//1.查询出数据库的明细数据-验收信息
	    String hql0 = "from SubcontractYsxxEntity where 1 = 1 AND fileid = ? ";
	    List<SubcontractYsxxEntity> subcontractYsxxOldList = this.findHql(hql0,id0);
		//2.筛选更新明细数据-验收信息
		if(subcontractYsxxList!=null&&subcontractYsxxList.size()>0){
		for(SubcontractYsxxEntity oldE:subcontractYsxxOldList){
			boolean isUpdate = false;
				for(SubcontractYsxxEntity sendE:subcontractYsxxList){
					//需要更新的明细数据-验收信息
					if(oldE.getId().equals(sendE.getId())){
		    			try {
							MyBeanUtils.copyBeanNotNull2Bean(sendE,oldE);
							this.saveOrUpdate(oldE);
						} catch (Exception e) {
							e.printStackTrace();
							throw new BusinessException(e.getMessage());
						}
						isUpdate= true;
		    			break;
		    		}
		    	}
	    		if(!isUpdate){
		    		//如果数据库存在的明细，前台没有传递过来则是删除-验收信息
		    		super.delete(oldE);
	    		}
	    		
			}
			//3.持久化新增的数据-验收信息
			for(SubcontractYsxxEntity subcontractYsxx:subcontractYsxxList){
				if(oConvertUtils.isEmpty(subcontractYsxx.getId())){
					//外键设置
					subcontractYsxx.setFileid(testFilestore.getId());
					this.save(subcontractYsxx);
				}
			}
		}
		//===================================================================================
		//1.查询出数据库的明细数据-超期复验信息
	    String hql1 = "from SubcontractCqfxxxEntity where 1 = 1 AND fileid = ? ";
	    List<SubcontractCqfxxxEntity> subcontractCqfxxxOldList = this.findHql(hql1,id1);
		//2.筛选更新明细数据-超期复验信息
		if(subcontractCqfxxxList!=null&&subcontractCqfxxxList.size()>0){
		for(SubcontractCqfxxxEntity oldE:subcontractCqfxxxOldList){
			boolean isUpdate = false;
				for(SubcontractCqfxxxEntity sendE:subcontractCqfxxxList){
					//需要更新的明细数据-超期复验信息
					if(oldE.getId().equals(sendE.getId())){
		    			try {
							MyBeanUtils.copyBeanNotNull2Bean(sendE,oldE);
							this.saveOrUpdate(oldE);
						} catch (Exception e) {
							e.printStackTrace();
							throw new BusinessException(e.getMessage());
						}
						isUpdate= true;
		    			break;
		    		}
		    	}
	    		if(!isUpdate){
		    		//如果数据库存在的明细，前台没有传递过来则是删除-超期复验信息
		    		super.delete(oldE);
	    		}
	    		
			}
			//3.持久化新增的数据-超期复验信息
			for(SubcontractCqfxxxEntity subcontractCqfxxx:subcontractCqfxxxList){
				if(oConvertUtils.isEmpty(subcontractCqfxxx.getId())){
					//外键设置
					subcontractCqfxxx.setFileid(testFilestore.getId());
					this.save(subcontractCqfxxx);
				}
			}
		}
		//===================================================================================
		//1.查询出数据库的明细数据-补充筛选信息
	    String hql2 = "from SubcontractBcsxxxEntity where 1 = 1 AND fileid = ? ";
	    List<SubcontractBcsxxxEntity> subcontractBcsxxxOldList = this.findHql(hql2,id2);
		//2.筛选更新明细数据-补充筛选信息
		if(subcontractBcsxxxList!=null&&subcontractBcsxxxList.size()>0){
		for(SubcontractBcsxxxEntity oldE:subcontractBcsxxxOldList){
			boolean isUpdate = false;
				for(SubcontractBcsxxxEntity sendE:subcontractBcsxxxList){
					//需要更新的明细数据-补充筛选信息
					if(oldE.getId().equals(sendE.getId())){
		    			try {
							MyBeanUtils.copyBeanNotNull2Bean(sendE,oldE);
							this.saveOrUpdate(oldE);
						} catch (Exception e) {
							e.printStackTrace();
							throw new BusinessException(e.getMessage());
						}
						isUpdate= true;
		    			break;
		    		}
		    	}
	    		if(!isUpdate){
		    		//如果数据库存在的明细，前台没有传递过来则是删除-补充筛选信息
		    		super.delete(oldE);
	    		}
	    		
			}
			//3.持久化新增的数据-补充筛选信息
			for(SubcontractBcsxxxEntity subcontractBcsxxx:subcontractBcsxxxList){
				if(oConvertUtils.isEmpty(subcontractBcsxxx.getId())){
					//外键设置
					subcontractBcsxxx.setFileid(testFilestore.getId());
					this.save(subcontractBcsxxx);
				}
			}
		}
		//===================================================================================
		//1.查询出数据库的明细数据-单独水汽报告
	    String hql3 = "from SubcontractDdsqbgEntity where 1 = 1 AND fileid = ? ";
	    List<SubcontractDdsqbgEntity> subcontractDdsqbgOldList = this.findHql(hql3,id3);
		//2.筛选更新明细数据-单独水汽报告
		if(subcontractDdsqbgList!=null&&subcontractDdsqbgList.size()>0){
		for(SubcontractDdsqbgEntity oldE:subcontractDdsqbgOldList){
			boolean isUpdate = false;
				for(SubcontractDdsqbgEntity sendE:subcontractDdsqbgList){
					//需要更新的明细数据-单独水汽报告
					if(oldE.getId().equals(sendE.getId())){
		    			try {
							MyBeanUtils.copyBeanNotNull2Bean(sendE,oldE);
							this.saveOrUpdate(oldE);
						} catch (Exception e) {
							e.printStackTrace();
							throw new BusinessException(e.getMessage());
						}
						isUpdate= true;
		    			break;
		    		}
		    	}
	    		if(!isUpdate){
		    		//如果数据库存在的明细，前台没有传递过来则是删除-单独水汽报告
		    		super.delete(oldE);
	    		}
	    		
			}
			//3.持久化新增的数据-单独水汽报告
			for(SubcontractDdsqbgEntity subcontractDdsqbg:subcontractDdsqbgList){
				if(oConvertUtils.isEmpty(subcontractDdsqbg.getId())){
					//外键设置
					subcontractDdsqbg.setFileid(testFilestore.getId());
					this.save(subcontractDdsqbg);
				}
			}
		}
		//===================================================================================
		//1.查询出数据库的明细数据-dpa
	    String hql4 = "from SubcontractDpaEntity where 1 = 1 AND fileid = ? ";
	    List<SubcontractDpaEntity> subcontractDpaOldList = this.findHql(hql4,id4);
		//2.筛选更新明细数据-dpa
		if(subcontractDpaList!=null&&subcontractDpaList.size()>0){
		for(SubcontractDpaEntity oldE:subcontractDpaOldList){
			boolean isUpdate = false;
				for(SubcontractDpaEntity sendE:subcontractDpaList){
					//需要更新的明细数据-dpa
					if(oldE.getId().equals(sendE.getId())){
		    			try {
							MyBeanUtils.copyBeanNotNull2Bean(sendE,oldE);
							this.saveOrUpdate(oldE);
						} catch (Exception e) {
							e.printStackTrace();
							throw new BusinessException(e.getMessage());
						}
						isUpdate= true;
		    			break;
		    		}
		    	}
	    		if(!isUpdate){
		    		//如果数据库存在的明细，前台没有传递过来则是删除-dpa
		    		super.delete(oldE);
	    		}
	    		
			}
			//3.持久化新增的数据-dpa
			for(SubcontractDpaEntity subcontractDpa:subcontractDpaList){
				if(oConvertUtils.isEmpty(subcontractDpa.getId())){
					//外键设置
					subcontractDpa.setFileid(testFilestore.getId());
					this.save(subcontractDpa);
				}
			}
		}
		//===================================================================================
		//1.查询出数据库的明细数据-监制
	    String hql5 = "from SubcontractJianzhiEntity where 1 = 1 AND fileid = ? ";
	    List<SubcontractJianzhiEntity> subcontractJianzhiOldList = this.findHql(hql5,id5);
		//2.筛选更新明细数据-监制
		if(subcontractJianzhiList!=null&&subcontractJianzhiList.size()>0){
		for(SubcontractJianzhiEntity oldE:subcontractJianzhiOldList){
			boolean isUpdate = false;
				for(SubcontractJianzhiEntity sendE:subcontractJianzhiList){
					//需要更新的明细数据-监制
					if(oldE.getId().equals(sendE.getId())){
		    			try {
							MyBeanUtils.copyBeanNotNull2Bean(sendE,oldE);
							this.saveOrUpdate(oldE);
						} catch (Exception e) {
							e.printStackTrace();
							throw new BusinessException(e.getMessage());
						}
						isUpdate= true;
		    			break;
		    		}
		    	}
	    		if(!isUpdate){
		    		//如果数据库存在的明细，前台没有传递过来则是删除-监制
		    		super.delete(oldE);
	    		}
	    		
			}
			//3.持久化新增的数据-监制
			for(SubcontractJianzhiEntity subcontractJianzhi:subcontractJianzhiList){
				if(oConvertUtils.isEmpty(subcontractJianzhi.getId())){
					//外键设置
					subcontractJianzhi.setFileid(testFilestore.getId());
					this.save(subcontractJianzhi);
				}
			}
		}
		//===================================================================================
		//1.查询出数据库的明细数据-测试不合格情况
	    String hql6 = "from SubcontractCsbhgqkEntity where 1 = 1 AND fileid = ? ";
	    List<SubcontractCsbhgqkEntity> subcontractCsbhgqkOldList = this.findHql(hql6,id6);
		//2.筛选更新明细数据-测试不合格情况
		if(subcontractCsbhgqkList!=null&&subcontractCsbhgqkList.size()>0){
		for(SubcontractCsbhgqkEntity oldE:subcontractCsbhgqkOldList){
			boolean isUpdate = false;
				for(SubcontractCsbhgqkEntity sendE:subcontractCsbhgqkList){
					//需要更新的明细数据-测试不合格情况
					if(oldE.getId().equals(sendE.getId())){
		    			try {
							MyBeanUtils.copyBeanNotNull2Bean(sendE,oldE);
							this.saveOrUpdate(oldE);
						} catch (Exception e) {
							e.printStackTrace();
							throw new BusinessException(e.getMessage());
						}
						isUpdate= true;
		    			break;
		    		}
		    	}
	    		if(!isUpdate){
		    		//如果数据库存在的明细，前台没有传递过来则是删除-测试不合格情况
		    		super.delete(oldE);
	    		}
	    		
			}
			//3.持久化新增的数据-测试不合格情况
			for(SubcontractCsbhgqkEntity subcontractCsbhgqk:subcontractCsbhgqkList){
				if(oConvertUtils.isEmpty(subcontractCsbhgqk.getId())){
					//外键设置
					subcontractCsbhgqk.setFileid(testFilestore.getId());
					this.save(subcontractCsbhgqk);
				}
			}
		}
		//===================================================================================
		//1.查询出数据库的明细数据-封装不合格情况
	    String hql7 = "from SubcontractFzbhgqkEntity where 1 = 1 AND fileid = ? ";
	    List<SubcontractFzbhgqkEntity> subcontractFzbhgqkOldList = this.findHql(hql7,id7);
		//2.筛选更新明细数据-封装不合格情况
		if(subcontractFzbhgqkList!=null&&subcontractFzbhgqkList.size()>0){
		for(SubcontractFzbhgqkEntity oldE:subcontractFzbhgqkOldList){
			boolean isUpdate = false;
				for(SubcontractFzbhgqkEntity sendE:subcontractFzbhgqkList){
					//需要更新的明细数据-封装不合格情况
					if(oldE.getId().equals(sendE.getId())){
		    			try {
							MyBeanUtils.copyBeanNotNull2Bean(sendE,oldE);
							this.saveOrUpdate(oldE);
						} catch (Exception e) {
							e.printStackTrace();
							throw new BusinessException(e.getMessage());
						}
						isUpdate= true;
		    			break;
		    		}
		    	}
	    		if(!isUpdate){
		    		//如果数据库存在的明细，前台没有传递过来则是删除-封装不合格情况
		    		super.delete(oldE);
	    		}
	    		
			}
			//3.持久化新增的数据-封装不合格情况
			for(SubcontractFzbhgqkEntity subcontractFzbhgqk:subcontractFzbhgqkList){
				if(oConvertUtils.isEmpty(subcontractFzbhgqk.getId())){
					//外键设置
					subcontractFzbhgqk.setFileid(testFilestore.getId());
					this.save(subcontractFzbhgqk);
				}
			}
		}
		//===================================================================================
		//1.查询出数据库的明细数据-筛选不合格情况
	    String hql8 = "from SubcontractSxbhgqkEntity where 1 = 1 AND fileid = ? ";
	    List<SubcontractSxbhgqkEntity> subcontractSxbhgqkOldList = this.findHql(hql8,id8);
		//2.筛选更新明细数据-筛选不合格情况
		if(subcontractSxbhgqkList!=null&&subcontractSxbhgqkList.size()>0){
		for(SubcontractSxbhgqkEntity oldE:subcontractSxbhgqkOldList){
			boolean isUpdate = false;
				for(SubcontractSxbhgqkEntity sendE:subcontractSxbhgqkList){
					//需要更新的明细数据-筛选不合格情况
					if(oldE.getId().equals(sendE.getId())){
		    			try {
							MyBeanUtils.copyBeanNotNull2Bean(sendE,oldE);
							this.saveOrUpdate(oldE);
						} catch (Exception e) {
							e.printStackTrace();
							throw new BusinessException(e.getMessage());
						}
						isUpdate= true;
		    			break;
		    		}
		    	}
	    		if(!isUpdate){
		    		//如果数据库存在的明细，前台没有传递过来则是删除-筛选不合格情况
		    		super.delete(oldE);
	    		}
	    		
			}
			//3.持久化新增的数据-筛选不合格情况
			for(SubcontractSxbhgqkEntity subcontractSxbhgqk:subcontractSxbhgqkList){
				if(oConvertUtils.isEmpty(subcontractSxbhgqk.getId())){
					//外键设置
					subcontractSxbhgqk.setFileid(testFilestore.getId());
					this.save(subcontractSxbhgqk);
				}
			}
		}
	}

	public void delMain(TestFilestoreEntity testFilestore) throws Exception{
		//删除主表信息
		this.delete(testFilestore);
		//===================================================================================
		//获取参数
		Object id0 = testFilestore.getId();
		Object id1 = testFilestore.getId();
		Object id2 = testFilestore.getId();
		Object id3 = testFilestore.getId();
		Object id4 = testFilestore.getId();
		Object id5 = testFilestore.getId();
		Object id6 = testFilestore.getId();
		Object id7 = testFilestore.getId();
		Object id8 = testFilestore.getId();
		//===================================================================================
		//删除-验收信息
	    String hql0 = "from SubcontractYsxxEntity where 1 = 1 AND fileid = ? ";
	    List<SubcontractYsxxEntity> subcontractYsxxOldList = this.findHql(hql0,id0);
		this.deleteAllEntitie(subcontractYsxxOldList);
		//===================================================================================
		//删除-超期复验信息
	    String hql1 = "from SubcontractCqfxxxEntity where 1 = 1 AND fileid = ? ";
	    List<SubcontractCqfxxxEntity> subcontractCqfxxxOldList = this.findHql(hql1,id1);
		this.deleteAllEntitie(subcontractCqfxxxOldList);
		//===================================================================================
		//删除-补充筛选信息
	    String hql2 = "from SubcontractBcsxxxEntity where 1 = 1 AND fileid = ? ";
	    List<SubcontractBcsxxxEntity> subcontractBcsxxxOldList = this.findHql(hql2,id2);
		this.deleteAllEntitie(subcontractBcsxxxOldList);
		//===================================================================================
		//删除-单独水汽报告
	    String hql3 = "from SubcontractDdsqbgEntity where 1 = 1 AND fileid = ? ";
	    List<SubcontractDdsqbgEntity> subcontractDdsqbgOldList = this.findHql(hql3,id3);
		this.deleteAllEntitie(subcontractDdsqbgOldList);
		//===================================================================================
		//删除-dpa
	    String hql4 = "from SubcontractDpaEntity where 1 = 1 AND fileid = ? ";
	    List<SubcontractDpaEntity> subcontractDpaOldList = this.findHql(hql4,id4);
		this.deleteAllEntitie(subcontractDpaOldList);
		//===================================================================================
		//删除-监制
	    String hql5 = "from SubcontractJianzhiEntity where 1 = 1 AND fileid = ? ";
	    List<SubcontractJianzhiEntity> subcontractJianzhiOldList = this.findHql(hql5,id5);
		this.deleteAllEntitie(subcontractJianzhiOldList);
		//===================================================================================
		//删除-测试不合格情况
	    String hql6 = "from SubcontractCsbhgqkEntity where 1 = 1 AND fileid = ? ";
	    List<SubcontractCsbhgqkEntity> subcontractCsbhgqkOldList = this.findHql(hql6,id6);
		this.deleteAllEntitie(subcontractCsbhgqkOldList);
		//===================================================================================
		//删除-封装不合格情况
	    String hql7 = "from SubcontractFzbhgqkEntity where 1 = 1 AND fileid = ? ";
	    List<SubcontractFzbhgqkEntity> subcontractFzbhgqkOldList = this.findHql(hql7,id7);
		this.deleteAllEntitie(subcontractFzbhgqkOldList);
		//===================================================================================
		//删除-筛选不合格情况
	    String hql8 = "from SubcontractSxbhgqkEntity where 1 = 1 AND fileid = ? ";
	    List<SubcontractSxbhgqkEntity> subcontractSxbhgqkOldList = this.findHql(hql8,id8);
		this.deleteAllEntitie(subcontractSxbhgqkOldList);
		
	}
 	
}