package com.irs.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.irs.service.TbCommentService;
import com.irs.util.ResultUtil;

/**
 * 评论管理
 * @author robb
 *  包含 后台数据查看，前台数据的查看
 */
@Controller
@RequestMapping("tb")
public class TbCommentController {

	@Autowired
	private TbCommentService  service;
	/**
	 * 进入评论管理页面
	 * @return
	 */
	@RequestMapping("/page")
	public String comment(){
		return "page/comment/commentlist";
	}
	/**
	 * 进入查看页面
	 * @return
	 */
	@RequestMapping("/edit")
	public String editcomment(Integer uid,Model model){
		model.addAttribute("comment",service.selectByPrimaryKey(uid));
		return "page/comment/editcomment";
	}
	/**
	 * 获取所有的评论信息
	 * @param page
	 * @param size
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public ResultUtil getlist(Integer page,Integer limit){
		page=(page-1)*limit;//当前页减一 ，乘上页大小
		return service.list(page, limit);
		
	}
	
	
}
