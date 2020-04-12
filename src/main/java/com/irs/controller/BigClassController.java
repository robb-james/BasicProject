package com.irs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.irs.bean.BigClass;
import com.irs.controller.base.BaseController;
import com.irs.dao.BigClassMapper;
import com.irs.service.BigClassService;
import com.irs.util.ResultModel;

/**
 * 商品类型
 * 
 * @author robb
 *
 */
@Controller
@RequestMapping("big")
public class BigClassController extends BaseController {
	@Autowired
	private BigClassService bigclassService;

	/**
	 * 进入首页
	 * 
	 * @return
	 */
	@RequestMapping("/gopage")
	public String gopage() {

		return "page/product/bigclassList";
	}

	/**
	 * 获取所有的商品类型
	 * 
	 * @param req
	 * @param rsp
	 * @param big
	 * @param length
	 *            起始位置
	 * @param start
	 *            页大小
	 * @return
	 */
	@RequestMapping("/findall")
	@ResponseBody
	public ResultModel findUserByPage(@RequestParam(value = "length", defaultValue = "15") Integer length,
			@RequestParam(value = "start", defaultValue = "0") Integer start) {
		List<BigClass> page = bigclassService.findall(start, length);
		ResultModel model = new ResultModel();
		model.setData(page);
		model.setRecordsFiltered(bigclassService.getcount());
		model.setRecordsTotal(bigclassService.getcount());
		model.setCode(200);
		model.setMsg("success");
		return model;
	}

	/**
	 * 添加商品类型
	 * 
	 * @param big
	 *            商品类型实体
	 * @return
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public ResultModel insert(BigClass big) {
		int bool = bigclassService.insert(big);
		if (bool >0) {
			return success(200, "添加成功");
		} else {
			return error(500, "系统异常");
		}
	}

	/**
	 * 根据编号获取信息
	 * 
	 * @param model
	 * @param id
	 *            编号
	 * @return
	 */
	@RequestMapping("/getinfo")
	public ModelAndView getinfoById(ModelAndView model, String id) {
		int ids = Integer.parseInt(id);
		BigClass big = bigclassService.getinfo(ids);
		if (big != null) {
			model.addObject("big", big);
			model.setViewName("product/bigclassedit");
		}
		return model;
	}

	/**
	 * 修改商品类型
	 * 
	 * @param big
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public ResultModel update(BigClass big) {
		int bool = bigclassService.update(big);
		if (bool >0) {
			return success(200, "修改成功");
		} else {
			return error(500, "系统异常");
		}
	}

	
	
}
