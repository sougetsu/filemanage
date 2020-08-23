package com.jeecg.filemanage.service;
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

import java.util.List;
import org.jeecgframework.core.common.service.CommonService;
import java.io.Serializable;

public interface TestFilestoreServiceI extends CommonService{
 	public void delete(TestFilestoreEntity entity) throws Exception;
	/**
	 * 添加一对多
	 * 
	 */
	public void addMain(TestFilestoreEntity testFilestore,
	        List<SubcontractYsxxEntity> subcontractYsxxList,List<SubcontractCqfxxxEntity> subcontractCqfxxxList,List<SubcontractBcsxxxEntity> subcontractBcsxxxList,List<SubcontractDdsqbgEntity> subcontractDdsqbgList,List<SubcontractDpaEntity> subcontractDpaList,List<SubcontractJianzhiEntity> subcontractJianzhiList,List<SubcontractCsbhgqkEntity> subcontractCsbhgqkList,List<SubcontractFzbhgqkEntity> subcontractFzbhgqkList,List<SubcontractSxbhgqkEntity> subcontractSxbhgqkList) throws Exception;
	/**
	 * 修改一对多
	 * 
	 */
	public void updateMain(TestFilestoreEntity testFilestore,
	        List<SubcontractYsxxEntity> subcontractYsxxList,List<SubcontractCqfxxxEntity> subcontractCqfxxxList,List<SubcontractBcsxxxEntity> subcontractBcsxxxList,List<SubcontractDdsqbgEntity> subcontractDdsqbgList,List<SubcontractDpaEntity> subcontractDpaList,List<SubcontractJianzhiEntity> subcontractJianzhiList,List<SubcontractCsbhgqkEntity> subcontractCsbhgqkList,List<SubcontractFzbhgqkEntity> subcontractFzbhgqkList,List<SubcontractSxbhgqkEntity> subcontractSxbhgqkList) throws Exception;
	        
	/**
	 * 删除一对多
	 * 
	 */
	public void delMain (TestFilestoreEntity testFilestore) throws Exception;
}
