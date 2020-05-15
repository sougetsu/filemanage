package org.jeecgframework.web.system.controller.core;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jeecgframework.web.system.pojo.base.DictionaryInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/dictionaryController")
public class DictionaryController {
	/**
	 * 获得项目名称
	 * @param request
	 * @return List<DictionaryInfo> 对象列表
	 */
	@RequestMapping(params = "projectList")
	@ResponseBody
	public List<DictionaryInfo> getProjectList(HttpServletRequest request) {
		List<DictionaryInfo> result = new ArrayList<DictionaryInfo>();
		DictionaryInfo di = new DictionaryInfo();
		di.setId("23");
		di.setText("ceshiyige");
		result.add(di);
		return result;
	}
}