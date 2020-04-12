package com.irs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.irs.bean.BigClass;
import com.irs.bean.Classify;
import com.irs.controller.base.BaseController;
import com.irs.dao.ClassifyMapper;
import com.irs.service.BigClassService;
import com.irs.service.ClassifyService;
import com.irs.util.ResultModel;


@RequestMapping("classify")
@Controller
public class ClassifyController extends BaseController {

	@Autowired
	private ClassifyService service;
	@Autowired
	private BigClassService bigservice;
	
	/**
	 * 进入首页
	 * @return
	 */
	@RequestMapping("/gopage")
	public String gopage(){
		
		return "page/product/classifyList";
	}
	
	
	/**
	 * 获取所有的商品类型
	 * @param req
	 * @param rsp
	 * @param big 
	 * @param length 起始位置
	 * @param start  页大小
	 * @return
	 */
	@RequestMapping("/findall")
	@ResponseBody
	public ResultModel findUserByPage(HttpServletRequest req,@RequestParam(value = "length",defaultValue="15")Integer length,
			@RequestParam(value = "start",defaultValue="0")Integer start,Classify bean) {
		List<Classify> page = service.findall(start, length);
		ResultModel model = new ResultModel();
		model.setData(page);
		model.setRecordsFiltered(service.getcount());
		model.setRecordsTotal(service.getcount());
		model.setCode(200);
		model.setMsg("success");
		return model;
	}
	
	/**
	 * 添加商品类型
	 * @param big  商品类型实体
	 * @return
	 */
@RequestMapping("/insert")
@ResponseBody
	public ResultModel  insert(Classify classify){
	int bool=service.insert(classify);
	if(bool >0){
		return success(200,"添加成功");
	}else{
		return error(500,"系统异常");
	}	
	}
	/**
	 * 根据编号获取信息
	 * @param model
	 * @param id 编号
	 * @return
	 */
	@RequestMapping("/getinfo")
	public ModelAndView getinfoById(ModelAndView  model,String id){
		int ids=Integer.parseInt(id);
		Classify classify=service.getinfo(ids);
		List<BigClass> list = bigservice.findall(0, 30);
		model.addObject("bigclass", list);
	if(classify !=null){
		model.addObject("classify",classify);
		model.setViewName("page/product/classifyEdit");
	}else{
		model.setViewName("page/product/classifyList");
	}
	return model;
	}
	/**
	 * 修改商品类型
	 * @param big
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	
	public ResultModel update(Classify classify){
		int bool=service.update(classify);
		if(bool>0){
			return success(200,"修改成功");
		}else{
			return error(500,"系统异常");
		}	
		
		
	}
	/**
	 * 进入添加页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/goadd")
	public ModelAndView goadd(ModelAndView model){
		List<BigClass> list = bigservice.findall(0, 100);
		model.addObject("bigclass", list);
		model.setViewName("page/product/classifyAdd");
		return model;
	}
	
	
	
	
}
