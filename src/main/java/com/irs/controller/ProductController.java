package com.irs.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.ResolverUtil.Test;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.irs.bean.BigClass;
import com.irs.bean.Classify;
import com.irs.bean.Product;
import com.irs.bean.TbUsers;
import com.irs.controller.base.BaseController;
import com.irs.service.BigClassService;
import com.irs.service.ClassifyService;
import com.irs.service.ProductService;
import com.irs.util.DateUtil;
import com.irs.util.ResultModel;

@RequestMapping("goods")
@Controller
public class ProductController extends BaseController {
	@Autowired
	private ProductService service;
	@Autowired
	private BigClassService bigservice;
	@Autowired
	private ClassifyService smallservice;

	@RequestMapping("/gopage")
	public String gopage() {
		return "page/product/goodsList";

	}

	public static Logger logo = Logger.getLogger(Test.class);
	/**
	 * 获取所有数据
	 * 
	 * @param req
	 * @param length
	 * @param start
	 * @param good
	 * @return
	 */
	@RequestMapping("findUserByPage")
	@ResponseBody
	public ResultModel findUserByPage(HttpServletRequest req,
			@RequestParam(value = "length", defaultValue = "20") Integer length,
			@RequestParam(value = "start", defaultValue = "0") Integer start, Product good) {

		TbUsers admin = (TbUsers)SecurityUtils.getSubject().getPrincipal();
		good.setUid(Integer.parseInt(String.valueOf(admin.getUid())));
		List<Product> list = service.list(good, start, length);
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getCreatetime() != null) {
				list.get(i).setTime(DateUtil.getStringDate(list.get(i).getCreatetime(), "yyyy-MM-dd HH:mm"));

			}

		}

		ResultModel rm = new ResultModel();
		rm.setData(list);
		rm.setRecordsFiltered(service.getcount(good));
		rm.setRecordsTotal(service.getcount(good));
		return rm;
	}

	/**
	 * 添加数据
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @param goods
	 * @param bid
	 * @param myfiles
	 * @return
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public ModelAndView insert(ModelAndView model, HttpServletRequest request, HttpServletResponse response,
			Product goods, String[] bid, MultipartFile myfiles) {
		Map<String, Object> map = (Map<String, Object>) FileUploadController.uploadApk(myfiles, request, response);
		TbUsers admin = (TbUsers) SecurityUtils.getSubject().getPrincipal();
		goods.setUid(Integer.parseInt(String.valueOf(admin.getUid())));
		goods.setPimage(map.get("path").toString());// 图片地址
		int a=1;
		goods.setState(a);
		goods.setCreatetime(new Date());// 默认当前系统时间
		int bool = service.insert(goods);
		if (bool > 0) {
			model.setViewName("page/product/goodsList");
		} else {
			model.setViewName("page/product/goodsAdd");
		}
		return model;
	}

	/**
	 * 修改数据
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @param goods
	 * @param myfiles
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public ModelAndView update(ModelAndView model, HttpServletRequest request, HttpServletResponse response,
			Product goods, MultipartFile myfiles) {
		if (myfiles != null) {
			Map<String, Object> map = (Map<String, Object>) FileUploadController.uploadApk(myfiles, request, response);
			if (!map.get("code").equals(400)) {
				goods.setPimage(map.get("path").toString());// 图片地址
			}
		}
		int bool = service.update(goods);
		if (bool > 0) {
			model.setViewName("page/product/goodsList");
		} else {
			model.setViewName("page/product/goodsAdd");
		}
		return model;
	}

	@RequestMapping("/updatestate")
	@ResponseBody
	public ResultModel updatestate(ResultModel model, Integer pid, Integer state) {
		Product goods = new Product();
		goods.setPid(pid);
		goods.setState(state);
		int bool = service.update(goods);
		if (bool > 0) {
			model.setCode(200);
			model.setMsg("修改成功");
		} else {
			model.setCode(400);
			model.setMsg("修改失败");
		}
		return model;
	}

	/**
	 * 进入修改页面
	 * 
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("/getinfo")
	@ResponseBody
	public ModelAndView getinfoById(ModelAndView model, Integer pid) {
		Product goods = service.getinfo(pid);
		if (goods != null) {
			model.addObject("goods", goods);
			List<BigClass> big = bigservice.findall(0, 1000);
			List<Classify> small = smallservice.findall(0, 1000);
			model.addObject("bigclass", big);
			model.addObject("small", small);
			model.setViewName("page/product/goodsEdit");
		}
		return model;
	}

	/**
	 * 进入商品添加页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/goadd")
	@ResponseBody
	public ModelAndView goinsert(ModelAndView model) {
		List<BigClass> big = bigservice.findall(0, 1000);
		List<Classify> small = smallservice.findall(0, 1000);
		model.addObject("big", big);
		model.addObject("small", small);
		model.setViewName("page/product/goodsAdd");
		return model;
	}

	@RequestMapping("/getsmall")
	@ResponseBody
	public List<Classify> getsmall(Integer bid) {
		return smallservice.getinfoBybid(bid);
	}

	/**
	 * 删除数据
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public ResultModel delete(Integer pid) {
		int bool = service.delete(pid);
		if (bool > 0) {
			return success(200, "删除成功");
		} else {
			return error(500, "系统异常");
		}

	}

}
