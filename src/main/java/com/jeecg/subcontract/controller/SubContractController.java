package com.jeecg.subcontract.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jeecg.subcontract.entity.ComboEntity;
import com.jeecg.subcontract.entity.DsyColumData;
import com.jeecg.subcontract.entity.FeeCountInfo;

@Controller
@RequestMapping("/subContractController")
public class SubContractController {

	/**
	 * 查询-详细页面
	 * @param orderId
	 * @return
	 */
	@RequestMapping(params ="feeCountPage")
	public ModelAndView singlePage( HttpServletRequest request) {
		return new ModelAndView("com/jeecg/subcontract/feeCount");
	}
	
	@RequestMapping(params ="wxjgdwList")
	@ResponseBody
	public List<ComboEntity> singleTestPlace(HttpServletRequest request) {
		List<ComboEntity> ll = new ArrayList<ComboEntity>();
		ComboEntity c1 = new ComboEntity();
		c1.setId("1");
		c1.setText("北京普林拓展科技有限公司");
		ComboEntity c2 = new ComboEntity();
		c2.setId("2");
		c2.setText("东达鑫奥制版科技开发中心");
		 return  ll;
	}

	
	@RequestMapping(params ="deptList")
	@ResponseBody
	public List<ComboEntity> deptList(HttpServletRequest request) {
		List<ComboEntity> ll = new ArrayList<ComboEntity>();
		ComboEntity c1 = new ComboEntity();
		c1.setId("1");
		c1.setText("设计一部");
		ComboEntity c2 = new ComboEntity();
		c2.setId("2");
		c2.setText("设计二部");
		 return  ll;
	}
	
	@RequestMapping(params ="singleFeeColGrid")
	@ResponseBody
	public List<DsyColumData> singleFeeColGrid(FeeCountInfo feeCountInfo ,HttpServletRequest request) {
		List<DsyColumData>  sd = new ArrayList<DsyColumData>();
		DsyColumData dcd1 = new DsyColumData();
		 return  sd;
		 
	}
}
