package com.irs.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.irs.bean.Slide;
import com.irs.service.SlideService;
import com.irs.util.ResultModel;

/**
 * 轮播图管理类
 * 
 * @author robb
 *
 */
@Controller
@RequestMapping("slide")
public class SlideController {
	@Autowired
	private SlideService service;

	/**
	 * 进入轮播首页面
	 * 
	 * @return
	 */
	@RequestMapping("/gopage")
	public String gopage() {
		return "page/slide/slideList";
	}

	/**
	 * 获取所有的信息
	 * 
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public ResultModel list() {
		ResultModel model = new ResultModel();
		List<Slide> list = service.list();
		model.setData(list);
		model.setCode(200);
		model.setRecordsFiltered(list.size());
		model.setRecordsTotal(list.size());
		return model;
	}

	/**
	 * 添加数据
	 * 
	 * @return
	 */
	@RequestMapping("/insert")
	public String insert(HttpServletRequest request, HttpServletResponse response, MultipartFile myfiles, Slide slide) {
		Map<String, Object> map = (Map<String, Object>) FileUploadController.uploadApk(myfiles, request, response);
		slide.setHurl(map.get("path").toString());
		int rel = service.insert(slide);
		if (rel > 0) {
			return "page/slide/slideList";
		} else {
			return "page/slide/slideAdd";
		}
	}

	/**
	 * 修改数据
	 * 
	 * @return
	 */
	@RequestMapping("/update")
	public String update(HttpServletRequest request, HttpServletResponse response, MultipartFile myfiles, Slide slide) {
		if (myfiles != null) {
			Map<String, Object> map = (Map<String, Object>) FileUploadController.uploadApk(myfiles, request, response);
			if (!map.get("code").equals(400)) {
				slide.setHurl(map.get("path").toString());// 图片地址
			}
		}
		int rel = service.update(slide);
		if (rel > 0) {
			return "page/slide/slideList";
		} else {
			return "page/slide/slideEdit";
		}

	}

	/**
	 * 删除数据
	 * 
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public ResultModel delete(ResultModel model, Integer hid) {
		int rel = service.delete(hid);
		if (rel > 0) {
			model.setCode(200);
			model.setMsg("添加成功");
		} else {
			model.setCode(400);
			model.setMsg("添加失败");
		}
		return model;

	}

	/**
	 * 根据编号获取一条数据返回到修改页面
	 * 
	 * @return
	 */
	@RequestMapping("/getinfo")
	public ModelAndView getinfo(String hid) {
		ModelAndView model = new ModelAndView("page/slide/slideEdit");
		Slide slide = service.getinfo(Integer.parseInt(hid));
		model.addObject("slide", slide);
	
		return model;

	}

}
