package com.jeecg.statistics.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jeecgframework.core.common.dao.jdbc.JdbcDao;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.common.model.json.Highchart;
import org.jeecgframework.core.util.DBTypeUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.system.service.MutiLangServiceI;
import org.jeecgframework.web.system.service.SystemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/statisticsController")
public class StatisticsController {

	private static final Logger logger = LoggerFactory.getLogger(StatisticsController.class);

	@Autowired
	private SystemService systemService;

	@Autowired
	private MutiLangServiceI mutiLangService;

	/**
	 *  	外协费用统计
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "TotalReport")
	public ModelAndView TotalReport(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/statistics/feeCountByMonth");
	}
	
	/**
	 *	外协费用统计
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "insepectFeeReport")
	public ModelAndView InsepectFeeReport(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/statistics/inspectFeeCountByMonth");
	}
	
	/**
	 *	模块费用统计
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "moduleFeeReport")
	public ModelAndView moduleFeeReport(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/statistics/moduleFeeCountByMonth");
	
	}
	/**
	 * 	计划复投次数
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "reOrder")
	public ModelAndView ReOrder(HttpServletRequest request) {
		return new ModelAndView("com/jeecg/statistics/reorder");
	}

	/**
	 *	 统计复投数据echart数据返回
	 * 
	 * @return
	 */
	@RequestMapping(params = "broswerCount")
	@ResponseBody
	public List<Highchart> studentCount(HttpServletRequest request, String reportType, HttpServletResponse response) {
		List<Highchart> list = new ArrayList<Highchart>();
		Highchart hc = new Highchart();
		StringBuffer sb = new StringBuffer();
		sb.append(
				"select t1.departname ,sum(t1.numcount) as reordersum from (select b.departname,ifnull(planno,'无计划') as planno ,(COUNT(*)-1) as numcount FROM subcontract_apply a LEFT JOIN t_s_depart b on a.sqbm = b.id GROUP BY b.departname,planno HAVING count(*)>1) t1 GROUP BY t1.departname;");
		List<Map<String, Object>> userBroswerList = systemService.findForJdbc(sb.toString());
		Long count = systemService.getCountForJdbc(
				"select sum(t1.numcount)from (select b.departname,ifnull(planno,'无计划') as planno ,(COUNT(*)-1) as numcount FROM subcontract_apply a LEFT JOIN t_s_depart b on a.sqbm = b.id GROUP BY b.departname,planno HAVING count(*)>1) t1 ");
		List lt = new ArrayList();
		hc = new Highchart();
		// hc.setName(mutiLangService.getLang(BROSWER_COUNT_ANALYSIS));
		hc.setName("部门计划复投统计");
		hc.setType(reportType);
		Map<String, Object> map;
		if (userBroswerList.size() > 0) {
			for (Map object : userBroswerList) {
				map = new HashMap<String, Object>();
				map.put("name", object.get("departname").toString());
				map.put("y", object.get("reordersum").toString());
				Long groupCount = Long.parseLong(object.get("reordersum").toString());
				Double percentage = 0.0;
				if (count != null && count.intValue() != 0) {
					percentage = new Double(groupCount) / count;
				}
				map.put("percentage", percentage * 100);
				lt.add(map);
			}
		}
		hc.setData(lt);
		list.add(hc);
		return list;
	}

	/**
	 * 	统计复投数据数据列表
	 * 
	 * @return
	 */
	@RequestMapping(params = "listReorderByJdbc")
	public void listReorderByJdbc(HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		List<Map<String, Object>> maplist = systemService.findForJdbc(
				"select t1.departname ,sum(t1.numcount) as reordersum from (select b.departname,ifnull(planno,'无计划') as planno ,(COUNT(*)-1) as numcount FROM subcontract_apply a LEFT JOIN t_s_depart b on a.sqbm = b.id GROUP BY b.departname,planno HAVING count(*)>1) t1 GROUP BY t1.departname",
				null);
		Long countSutent = systemService.getCountForJdbc(
				"select sum(t1.numcount)from (select b.departname,ifnull(planno,'无计划') as planno ,(COUNT(*)-1) as numcount FROM subcontract_apply a LEFT JOIN t_s_depart b on a.sqbm = b.id GROUP BY b.departname,planno HAVING count(*)>1) t1");
		for (Map map : maplist) {
			Long personcount = Long.parseLong(map.get("reordersum").toString());
			Double percentage = 0.0;
			if (personcount != null && personcount.intValue() != 0) {
				percentage = new Double(personcount) / countSutent;
			}

			map.put("rate", String.format("%.2f", percentage * 100) + "%");
		}
		Long count = 0L;
		count = systemService.getCountForJdbcParam(
				"select count(0) from (select t1.departname ,sum(t1.numcount) as reordersum from (select b.departname,ifnull(planno,'无计划') as planno ,(COUNT(*)-1) as numcount FROM subcontract_apply a LEFT JOIN t_s_depart b on a.sqbm = b.id GROUP BY b.departname,planno HAVING count(*)>1) t1 GROUP BY t1.departname)t",
				null);
		dataGrid.setTotal(count.intValue());
		dataGrid.setResults(maplist);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 	获取浏览器使用情况统计
	 * 
	 * @return
	 */
	@RequestMapping(params = "listAllStatisticByJdbc")
	public void listAllStatisticByJdbc(HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		List<Map<String, Object>> maplist = systemService.findForJdbc(
				"select l.broswer broswer ,count(broswer) broswercount from t_s_log l group by l.broswer", null);
		Long countSutent = systemService.getCountForJdbc("select count(*) from t_s_log where 1=1");
		for (Map map : maplist) {
			Long personcount = Long.parseLong(map.get("broswercount").toString());
			Double percentage = 0.0;
			if (personcount != null && personcount.intValue() != 0) {
				percentage = new Double(personcount) / countSutent;
			}

			map.put("rate", String.format("%.2f", percentage * 100) + "%");
		}
		Long count = 0L;
		if (JdbcDao.DATABSE_TYPE_SQLSERVER.equals(DBTypeUtil.getDBType())) {
			count = systemService.getCountForJdbcParam(
					"select count(0) from (select l."
							+ "  broswer ,count(broswer) broswercount from t_s_log  l group by l.broswer) as t( broswer, broswercount)",
					null);
		} else {
			count = systemService.getCountForJdbcParam(
					"select count(0) from (select l.broswer broswer ,count(broswer) broswercount from t_s_log l group by l.broswer)t",
					null);
		}

		dataGrid.setTotal(count.intValue());
		dataGrid.setResults(maplist);
		TagUtil.datagrid(response, dataGrid);
	}
	
	/**
	 * 	获取年度用统计数据（可视化页面）
	 * 
	 * @return
	 */
	@RequestMapping(params = "listFeeCountByYear")
	@ResponseBody
	public List<Highchart> listFeeCountByYear(HttpServletRequest request, String reportType, Integer applyType,
			HttpServletResponse response, DataGrid dataGrid,int year) {
		List<Highchart> list = new ArrayList<Highchart>();
		Highchart hc = new Highchart();
		StringBuffer sb = new StringBuffer();
		sb.append("select departname from t_s_depart where org_type=2");
		List<Map<String, Object>> departList = systemService.findForJdbc(sb.toString());

		Map<String, Object> map = new HashMap<String, Object>();
		List departlistinfo = new ArrayList();
		if (departList.size() > 0) {
			String[] departname = new String[departList.size()];
			for (int i = 0; i < departList.size(); i++) {
				if (i % 2 == 1) {
					departname[i] = "\n" + departList.get(i).get("departname").toString();
				} else {
					departname[i] = departList.get(i).get("departname").toString();
				}
			}
			map.put("departname", departname);
			departlistinfo.add(map);
		}
		Highchart departinfo = new Highchart();
		departinfo.setName("部门列表");
		departinfo.setType(reportType);
		departinfo.setData(departlistinfo);
		list.add(departinfo);

		// 实际费用
		Map<String, Object> feemap = new HashMap<String, Object>();
		List feelistinfo = new ArrayList();
		StringBuffer feequery = new StringBuffer();
		if(applyType==1 || applyType==2) {
			//外协或检验加工单
			feequery.append("select b.departname,sum(plancost)as plancost,sum(cost) as cost from subcontract_apply a "
							+ " LEFT JOIN t_s_depart b on a.sqbm = b.id" + " where a.applytype= " + applyType +" and DATE_FORMAT(a.applydate,'%Y') =  "
							+ year + " GROUP BY b.departname");
		}else {
			//模块加工单 默认3
			feequery.append("select b.departname,sum(yjje)as plancost,sum(cost) as cost from modulesubcontract_apply a "
							+ " LEFT JOIN t_s_depart b on a.sqbm = b.id" + " where DATE_FORMAT(a.create_date,'%Y') =  "
							+ year + " GROUP BY b.departname");
		}
		
		List<Map<String, Object>> feedetail = systemService.findForJdbc(feequery.toString());
		Double[] cost = new Double[departList.size()];
		Double[] plancost = new Double[departList.size()];
		Double[] ratio = new Double[departList.size()];
		for (int j = 0; j < departList.size(); j++) {
			double costtemp = 0d;
			double plancosttemp = 0d;
			String departname = departList.get(j).get("departname").toString();
			for (Map object : feedetail) {
				if (departname.equals(object.get("departname").toString())) {
					if (object.containsKey("cost") && object.get("cost") != null) {
						costtemp = Double.valueOf(object.get("cost").toString());
					}
					if (object.containsKey("plancost") && object.get("plancost") != null) {
						plancosttemp = Double.valueOf(object.get("plancost").toString());
					}
				}
			}
			cost[j] = costtemp;
			plancost[j] = plancosttemp;
			if(plancosttemp!=0) {
				ratio[j] = (costtemp/plancosttemp) * 100;
			}else {
				ratio[j] = 0d;
			}
		}
		feemap.put("cost", cost);
		feemap.put("plancost", plancost);
		feemap.put("ratio", ratio);
		feelistinfo.add(feemap);
		Highchart costinfo = new Highchart();
		costinfo.setName("实际费用列表");
		costinfo.setType(reportType);
		costinfo.setData(feelistinfo);
		list.add(costinfo);
		return list;
	}
	
	/**
	 * 	获取月度费用统计数据（统计分析服务）
	 * 
	 * @return
	 */
	@RequestMapping(params = "listFeeCountByMonth")
	@ResponseBody
	public List<Highchart> listFeeCountByMonth(HttpServletRequest request, String reportType, Integer applyType,
			HttpServletResponse response, DataGrid dataGrid) {
		List<Highchart> list = new ArrayList<Highchart>();
		Highchart hc = new Highchart();
		StringBuffer sb = new StringBuffer();
		sb.append("select departname from t_s_depart where org_type=2");
		List<Map<String, Object>> departList = systemService.findForJdbc(sb.toString());

		Map<String, Object> map = new HashMap<String, Object>();
		List departlistinfo = new ArrayList();
		if (departList.size() > 0) {
			String[] departname = new String[departList.size()];
			for (int i = 0; i < departList.size(); i++) {
				if (i % 2 == 1) {
					departname[i] = "\n" + departList.get(i).get("departname").toString();
				} else {
					departname[i] = departList.get(i).get("departname").toString();
				}
			}
			map.put("departname", departname);
			departlistinfo.add(map);
		}
		Highchart departinfo = new Highchart();
		departinfo.setName("部门列表");
		departinfo.setType(reportType);
		departinfo.setData(departlistinfo);
		list.add(departinfo);

		// 实际费用
		Map<String, Object> feemap = new HashMap<String, Object>();
		List feelistinfo = new ArrayList();
		for (int i = 201901; i <= 201912; i++) {
			StringBuffer feequery = new StringBuffer();
			if(applyType==1 || applyType==2) {
				//外协或检验加工单
				feequery.append("select b.departname,DATE_FORMAT(a.applydate,'%Y%m') as yearmonth,sum(plancost)as plancost,sum(cost) as cost from subcontract_apply a "
								+ " LEFT JOIN t_s_depart b on a.sqbm = b.id" + " where a.applytype= " + applyType +" and DATE_FORMAT(a.applydate,'%Y%m') =  "
								+ i + " GROUP BY b.departname,DATE_FORMAT(a.applydate,'%Y%m')");
			}else {
				//模块加工单 默认3
				feequery.append("select b.departname,DATE_FORMAT(a.create_date,'%Y%m') as yearmonth,sum(yjje)as plancost,sum(cost) as cost from modulesubcontract_apply a "
								+ " LEFT JOIN t_s_depart b on a.sqbm = b.id" + " where DATE_FORMAT(a.create_date,'%Y%m') =  "
								+ i + " GROUP BY b.departname,DATE_FORMAT(a.create_date,'%Y%m')");
			}
			
			List<Map<String, Object>> feedetail = systemService.findForJdbc(feequery.toString());
			Double[] cost = new Double[departList.size()];
			Double[] plancost = new Double[departList.size()];
			for (int j = 0; j < departList.size(); j++) {
				double costtemp = 0d;
				double plancosttemp = 0d;
				String departname = departList.get(j).get("departname").toString();
				for (Map object : feedetail) {
					if (departname.equals(object.get("departname").toString())) {
						if (object.containsKey("cost") && object.get("cost") != null) {
							costtemp = Double.valueOf(object.get("cost").toString());
						}
						if (object.containsKey("plancost") && object.get("plancost") != null) {
							plancosttemp = Double.valueOf(object.get("plancost").toString());
						}
					}
				}
				cost[j] = costtemp;
				plancost[j] = plancosttemp;
			}
			feemap.put("month_" + i, cost);
			feemap.put("planmonth_" + i, plancost);
		}
		feelistinfo.add(feemap);
		Highchart costinfo = new Highchart();
		costinfo.setName("实际费用列表");
		costinfo.setType(reportType);
		costinfo.setData(feelistinfo);
		list.add(costinfo);
		return list;
	}

	/**
	 * 	按照加工类型统计月度费用数据
	 * 
	 * @return
	 */
	@RequestMapping(params = "listTypeCountByMonth")
	@ResponseBody
	public List<Highchart> listTypeCountByMonth(HttpServletRequest request, String reportType, Integer applyType,
			HttpServletResponse response, DataGrid dataGrid) {
		List<Highchart> list = new ArrayList<Highchart>();
		Highchart hc = new Highchart();
		StringBuffer sb = new StringBuffer();
		sb.append(
				"SELECT typename FROM t_s_type WHERE typegroupid in(SELECT id FROM t_s_typegroup WHERE typegroupcode='jglx')");
		List<Map<String, Object>> typeList = systemService.findForJdbc(sb.toString());

		Map<String, Object> map = new HashMap<String, Object>();
		List typelistinfo = new ArrayList();
		if (typeList.size() > 0) {
			String[] departname = new String[typeList.size()];
			for (int i = 0; i < typeList.size(); i++) {
				departname[i] = typeList.get(i).get("typename").toString();
			}
			map.put("typename", departname);
			typelistinfo.add(map);
		}
		Highchart typetinfo = new Highchart();
		typetinfo.setName("分类列表");
		typetinfo.setType(reportType);
		typetinfo.setData(typelistinfo);
		list.add(typetinfo);

		// 实际费用
		Map<String, Object> feemap;
		List<Highchart> feelistinfo = new ArrayList<Highchart>();
		for (int j = 0; j < typeList.size(); j++) {
			Highchart typechart = new Highchart();
			String typename = typeList.get(j).get("typename").toString();
			typechart.setName(typename);
			typechart.setType("line");
			Double[] cost = new Double[12];
			for (int i = 0; i <= 11; i++) {
				String yearid = String.valueOf(201900+i+1);
				StringBuffer feequery = new StringBuffer();
				
				if(applyType==1 || applyType==2) {
					//外协或检验加工单
					feequery.append(
							"select a.wxjglx,DATE_FORMAT(a.applydate,'%Y%m') as yearmonth,sum(plancost)as plancost,sum(cost) as cost from subcontract_apply a  "
									+ " where DATE_FORMAT(a.applydate,'%Y%m') =  " + yearid
									+ " and a.wxjglx = '" + typename
									+ " ' and a.applytype = '" + applyType
									+ "' GROUP BY a.wxjglx,DATE_FORMAT(a.applydate,'%Y%m')");
				}else {
					//模块加工单 默认3
					feequery.append(
							"select a.wxjglx,DATE_FORMAT(a.create_date,'%Y%m') as yearmonth,sum(yjje)as plancost,sum(cost) as cost from modulesubcontract_apply a  "
									+ " where DATE_FORMAT(a.create_date,'%Y%m') =  " + yearid
									+ " and a.wxjglx = '" + typename
									+ "' GROUP BY a.wxjglx,DATE_FORMAT(a.create_date,'%Y%m')");
				}
				
				List<Map<String, Object>> typefeedetail = systemService.findForJdbc(feequery.toString());
				double costtemp = 0d;
				for (Map object : typefeedetail) {
					if (typename.equals(object.get("wxjglx").toString())) {
						if (object.containsKey("cost") && object.get("cost") != null) {
							costtemp = Double.valueOf(object.get("cost").toString());
							continue;
						}
					}
				}
				cost[i] = costtemp;
			}
			typechart.setData(Arrays.asList(cost));
			feelistinfo.add(typechart);
		}
		Highchart seriesInfo = new Highchart();
		seriesInfo.setName("series");
		seriesInfo.setType(reportType);
		seriesInfo.setData(feelistinfo);
		list.add(seriesInfo);
		return list;
	}
	
	
	/**
	 * 	统计当年供应商top10
	 * 
	 * @return
	 */
	@RequestMapping(params = "listTop10SupplyByYear")
	@ResponseBody
	public List<Highchart> listTop10SupplyByYear(HttpServletRequest request, String reportType,Integer applyType,
			HttpServletResponse response, DataGrid dataGrid,int year) {
		List<Highchart> list = new ArrayList<Highchart>();
		StringBuffer feequery = new StringBuffer();
		if(applyType==1 || applyType==2) {
			//外协或检验加工单
			feequery.append("SELECT wxjgdw ,COUNT(*) as applycount from subcontract_apply  "
							+ " where applytype= " + applyType +" and DATE_FORMAT(applydate,'%Y') =  "
							+ year + " GROUP BY wxjgdw order by applycount desc limit 10 ");
		}else {
			//模块加工单 默认3
			feequery.append("SELECT wbgys as wxjgdw ,COUNT(*) as applycount from modulesubcontract_apply  "
					+ " where DATE_FORMAT(create_date,'%Y') =  "
					+ year + " GROUP BY wbgys order by applycount desc limit 10 ");
		}
		List<Map<String, Object>> supplyCount = systemService.findForJdbc(feequery.toString());
		List<String> supplyName = new ArrayList<String>();
		List<Integer> supplyNmaeCount = new ArrayList<Integer>();
		for (Map object : supplyCount) {
			supplyName.add(object.get("wxjgdw").toString());
			supplyNmaeCount.add(Integer.valueOf(object.get("applycount").toString()));
		}
		Highchart legndInfo = new Highchart();
		legndInfo.setName("series");
		legndInfo.setType(reportType);
		legndInfo.setData(supplyName);
		list.add(legndInfo);
		
		
		Highchart seriesInfo = new Highchart();
		seriesInfo.setName("series");
		seriesInfo.setType(reportType);
		seriesInfo.setData(supplyNmaeCount);
		list.add(seriesInfo);
		return list;
	}
	/**
	 * 	年度综合统计（总支出，复投次数，加急次数，）
	 * 
	 * @return
	 */
	@RequestMapping(params = "listZhtjByYear")
	@ResponseBody
	public List<Highchart> listZhtjByYear(HttpServletRequest request, String reportType,Integer applyType,
			HttpServletResponse response, DataGrid dataGrid,int year) {
		List<Highchart> list = new ArrayList<Highchart>();
		List<Double> feeCount = new ArrayList<Double>();
		List<Integer> reOrderCount = new ArrayList<Integer>();
		List<Integer> engencyCount = new ArrayList<Integer>();
		for (int i = 0; i <= 4; i++) {
			int yearid = year+i;
			StringBuffer allpayFee = new StringBuffer();
			StringBuffer reOrderNum = new StringBuffer();
			StringBuffer emergencyNum = new StringBuffer();
			if(applyType==1 || applyType==2) {
				//外协或检验加工单
				allpayFee.append("SELECT sum(cost) AS cost from subcontract_apply  "
								+ " where applytype= " + applyType +" and DATE_FORMAT(applydate,'%Y') =  "
								+ yearid );
				reOrderNum.append("select sum(t1.reordernum) as reordernum from ("
						+ " SELECT planno,(COUNT(*) - 1) as reordernum FROM subcontract_apply a  "
						+ " where a.applytype= " + applyType +" and planno is not null  and DATE_FORMAT(applydate,'%Y') =  "
						+ yearid +" GROUP BY planno ) t1 ");
				emergencyNum.append("SELECT count(1) as urgentnum from subcontract_apply  "
						+ " where applytype= " + applyType +" and urgentdate is not null  and DATE_FORMAT(applydate,'%Y') =  "
						+ yearid );
			}else {
				//模块加工单 默认3
				allpayFee.append("SELECT sum(cost) AS cost  from modulesubcontract_apply  "
						+ " where DATE_FORMAT(create_date,'%Y') =  "
						+ yearid );
				reOrderNum.append("select sum(t1.reordernum) as reordernum from ("
						+ " SELECT planno,(COUNT(*) - 1) as reordernum FROM modulesubcontract_apply  "
						+ " where  planno is not null  and DATE_FORMAT(create_date,'%Y') =  "
						+ yearid +" GROUP BY planno ) t1 ");
				emergencyNum.append("SELECT count(1) as urgentnum from modulesubcontract_apply  "
						+ " where urgentdate is not null  and DATE_FORMAT(create_date,'%Y') =  "
						+ yearid );
			}
			
			List<Map<String, Object>> allpayFeeCount = systemService.findForJdbc(allpayFee.toString());
			List<Map<String, Object>> reOrderNumCount = systemService.findForJdbc(reOrderNum.toString());
			//List<Map<String, Object>> emergencyNumCount = systemService.findForJdbc(emergencyNum.toString());
			
			for (Map object : allpayFeeCount) {
				if(object.get("cost") !=null) {
					feeCount.add(Double.valueOf(object.get("cost").toString()));
				}else {
					feeCount.add(0.0d);
				}
			}
			for (Map object : reOrderNumCount) {
				if(object.get("reordernum")!=null) {
					reOrderCount.add(Integer.valueOf(object.get("reordernum").toString()));
				}else {
					reOrderCount.add(0);
				}
			}
//			for (Map object : emergencyNumCount) {
//				if(object.get("urgentnum")!=null) {
//					engencyCount.add(Integer.valueOf(object.get("urgentnum").toString()));
//				}else {
//					engencyCount.add(0);
//				}
//			}
			engencyCount.add(0);
		}
		
		Highchart feeInfo = new Highchart();
		feeInfo.setName("外协总支出");
		feeInfo.setType(reportType);
		feeInfo.setData(feeCount);
		list.add(feeInfo);
		
		
		Highchart orderInfo = new Highchart();
		orderInfo.setName("复投次数");
		orderInfo.setType(reportType);
		orderInfo.setData(reOrderCount);
		list.add(orderInfo);
		
		Highchart urgentInfo = new Highchart();
		urgentInfo.setName("加急次数");
		urgentInfo.setType(reportType);
		urgentInfo.setData(engencyCount);
		list.add(urgentInfo);
		
		return list;
	}
	
	/**
	 *	 综合报表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "getTotalReport")
	@ResponseBody
	public String getTotalReport(HttpServletRequest request) {
		List<Map<String, Object>> maplist = systemService.findForJdbc(
				"select l.broswer broswer ,count(broswer) broswercount from t_s_log l group by l.broswer", null);
		Long countSutent = systemService.getCountForJdbc("select count(*) from t_s_log where 1=1");
		for (Map map : maplist) {
			Long personcount = Long.parseLong(map.get("broswercount").toString());
			Double percentage = 0.0;
			if (personcount != null && personcount.intValue() != 0) {
				percentage = new Double(personcount) / countSutent;
			}

			map.put("rate", String.format("%.2f", percentage * 100) + "%");
		}
		Long count = 0L;
		if (JdbcDao.DATABSE_TYPE_SQLSERVER.equals(DBTypeUtil.getDBType())) {
			count = systemService.getCountForJdbcParam(
					"select count(0) from (select l."
							+ "  broswer ,count(broswer) broswercount from t_s_log  l group by l.broswer) as t( broswer, broswercount)",
					null);
		} else {
			count = systemService.getCountForJdbcParam(
					"select count(0) from (select l.broswer broswer ,count(broswer) broswercount from t_s_log l group by l.broswer)t",
					null);
		}

		StringBuffer strb = new StringBuffer();
		strb.append(
				"{\"title\": {\"text\": \"浏览器登录次数统计\",\"subtext\": \"测试数据\"},\"toolbox\": {\"show\": true,\"feature\": {\"restore\": {\"show\": true,\"title\": \"还原\"},\"saveAsImage\": {\"show\": true,\"title\": \"保存为图片\",\"type\": \"png\",\"lang\": [\"点击保存\"]},}},\"series\": [{\"data\": [");
		for (Map map : maplist) {
			strb.append("{\"value\": \" " + map.get("broswercount") + "\",\"name\": \"" + map.get("broswer") + "\"},");
		}
		strb.append("],\"type\": \"pie\"}]}");
		String option = strb.toString();

		return option;
	}
}
