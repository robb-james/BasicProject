package com.irs.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.irs.bean.Order;
import com.irs.bean.TbUsers;

import com.irs.controller.base.BaseController;
import com.irs.service.OrderService;

import com.irs.util.ResultModel;
/**
 * 用户订单
 * 
 * @author robb
 * 
 */
@Controller
@RequestMapping("order")
public class OrderController extends BaseController {

	@Autowired
	private OrderService orderService;
/**
 * 进去页面
 * @return
 */
    @RequestMapping("/gopage")
	public String page(){
		return "page/order/orderlist";
	}
    /**
	 * 获取所有订单数据
	 * @param req
	 * @param rsp
	 * @param big 
	 * @param length 起始位置
	 * @param start  页大小
	 * @return
	 */
	@RequestMapping("/findall")
	@ResponseBody
	public ResultModel findUserByPage(@RequestParam(value = "length",defaultValue="15")Integer length,
			@RequestParam(value = "start",defaultValue="0")Integer start,Order bean) {
		TbUsers admin = (TbUsers)SecurityUtils.getSubject().getPrincipal();
		bean.setUid(Integer.parseInt(String.valueOf(admin.getUid())));
	    List<Order>  list=	orderService.findByPage(start, length, bean);
		ResultModel model = new ResultModel();
		model.setData(list);
		model.setRecordsFiltered(orderService.selectCount(Integer.parseInt(String.valueOf(admin.getUid()))));
		model.setRecordsTotal(orderService.selectCount(Integer.parseInt(String.valueOf(admin.getUid()))));
		model.setCode(200);
		model.setMsg("success");
		return model;
	}
	/**
	 * 修改订单状态
	 * @param model
	 * @param order
	 * @return
	 */
    @RequestMapping("/update")
	@ResponseBody
    public ResultModel udate(ResultModel model,String oid){
    	Order order=new Order();
    	order.setOid(oid);
    	order.setOstate(3);
    int rel=orderService.updateByPrimaryKey(order);
    	if(rel>0){
    		model.setCode(200);
    		model.setMsg("修改成功");
    	}else{
    		model.setCode(400);
    		model.setMsg("修改失败");
    	}
    	return model;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

	/* =============================↓前台↓============================= */

	// 跳转订单页面
/*	@RequestMapping("/orders")
	public String orders() {
		return "/user/order";
	}

	// 跳转订单支付成功页面
	@RequestMapping("/paydd")
	public String paydd() {
		return "/user/orderState";
	}

	// 提交支付订单
	@RequestMapping("/tjdd")
	public void tjdd(Order order, HttpSession session, Model model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		Date date = new Date();
		TbUsers user = (TbUsers) session.getAttribute(Constants.USER_SESSION);// 获取登录的用户信息
		String dizhi = request.getParameter("did");// 地址ID
		String zhifu = request.getParameter("paytype");// 支付方式
		String liuyan = request.getParameter("oboard");// 留言信息
		String jine = request.getParameter("ototal");// 总金额
		String oid = request.getParameter("oid");// 订单id

		if (oid == null) {
			map.put("msg", "no");
		} else {
			int uids =Integer.parseInt(String.valueOf(user.getUid()));
			int shdz = Integer.parseInt(dizhi);
			int zf = Integer.parseInt(zhifu);
			// 防止价格出现异常
			// DecimalFormat df = new DecimalFormat("0.00");
			// 商品总金额
			Double cny = Double.parseDouble(jine);
			order.setUid(uids);// 用户id
			order.setOtime(date);// 下单时间
			order.setPaytype(zf);// 支付方式:0:在线支付，1:货到付款
			order.setOboard(liuyan);// 留言
			order.setDid(shdz);// 收货地址
			order.setOtotal(cny);// 总金额
			// 1:待付款,2:待发货,3:已发货,4:交易取消,5:交易成功,6:货到付款
			order.setOstate(2);
			orderService.OrderUpdate(order);
			map.put("msg", "ok");
		}
		JSONUtils.toJson(response, map);
	}

	// 根据用户id查询全部订单
	@RequestMapping("/payall")
	public void payall(HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws ServletException, IOException {
		// 获取登录的用户信息
		TbUsers user = (TbUsers) session.getAttribute(Constants.USER_SESSION);// 获取登录的用户信息
		if (user != null) {
			int uids =Integer.parseInt(String.valueOf(user.getUid())) ;// 用户id
			// orderxxService.findByPage3(request, model, uids);// 回显分页数据
			List<OrderxxVo> ssList = orderxxService.selAlldd(uids);
			request.setAttribute("ssList", ssList);
		} else {
			System.out.println("");
		}

		request.setAttribute("rightPage", "orderAll");
		request.getRequestDispatcher("/WEB-INF/jsp/user/userMain.jsp").forward(
				request, response);
	}

	// 根据用户id查询待支付订单
	@RequestMapping("/payment")
	public void payment(HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws ServletException, IOException {
		// 获取登录的用户信息
		TbUsers user = (TbUsers) session.getAttribute(Constants.USER_SESSION);// 获取登录的用户信息
		// 根据用户id、订单状态查询
		if (user != null) {
			int uids =Integer.parseInt(String.valueOf(user.getUid())) ;// 用户id
			// orderxxService.findByPage4(request, model, uids, ostate);//
			// 回显分页数据
			List<OrderxxVo> ssList = orderxxService.payment(uids);
			request.setAttribute("ssList", ssList);
		} else {
			request.getRequestDispatcher("/WEB-INF/jsp/user/login.jsp")
					.forward(request, response);
		}
		request.setAttribute("rightPage", "orderAll");
		request.getRequestDispatcher("/WEB-INF/jsp/user/userMain.jsp").forward(
				request, response);
	}

	// 根据用户id查询待发货的订单
	@RequestMapping("/delivery")
	public void delivery(HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws ServletException, IOException {
		// 获取登录的用户信息
		TbUsers uid = (TbUsers) session.getAttribute(Constants.USER_SESSION);// 获取登录的用户信息
		// 根据用户id、订单状态查询
		if (uid != null) {
			int uids =Integer.parseInt(String.valueOf(uid.getUid())) ;// 用户id
			// orderxxService.findByPage4(request, model, uids, ostate);//
			// 回显分页数据
			List<OrderxxVo> ssList = orderxxService.delivery(uids);
			request.setAttribute("ssList", ssList);
		} else {
			request.getRequestDispatcher("/WEB-INF/jsp/user/login.jsp")
					.forward(request, response);
		}
		request.setAttribute("rightPage", "orderAll");
		request.getRequestDispatcher("/WEB-INF/jsp/user/userMain.jsp").forward(
				request, response);
	}

	// 根据用户id查询待收货的订单
	@RequestMapping("/receipt")
	public void receipt(HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws ServletException, IOException {
		// 获取登录的用户信息
		TbUsers user = (TbUsers) session.getAttribute(Constants.USER_SESSION);// 获取登录的用户信息
		// 根据用户id、订单状态查询
		if (user != null) {
			int uids =Integer.parseInt(String.valueOf(user.getUid())) ;// 用户id
			// orderxxService.findByPage4(request, model, uids, ostate);//
			// 回显分页数据
			List<OrderxxVo> ssList = orderxxService.receipt(uids);
			request.setAttribute("ssList", ssList);
		} else {
			request.getRequestDispatcher("/WEB-INF/jsp/user/login.jsp")
					.forward(request, response);
		}
		request.setAttribute("rightPage", "orderAll");
		request.getRequestDispatcher("/WEB-INF/jsp/user/userMain.jsp").forward(
				request, response);
	}

	// 取消订单
	@RequestMapping("/cancel")
	public void cancel(String oid, Order order, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		if (oid != null) {
			order.setOstate(4);
			orderService.OrderUpdate(order);
			map.put("msg", "ok");
		} else {
			map.put("msg", "no");
		}
		JSONUtils.toJson(response, map);
	}

	// 确认收货
	@RequestMapping("/shouhuo")
	public void shouhuo(String oid, Order order, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		if (oid != null) {
			order.setOstate(5);
			orderService.OrderUpdate(order);
			map.put("msg", "ok");
		} else {
			map.put("msg", "no");
		}
		JSONUtils.toJson(response, map);
	}

	@RequestMapping("/jumpxx")
	public void jumpxx(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("rightPage", "orderDetail");
		request.getRequestDispatcher("/WEB-INF/jsp/user/userMain.jsp").forward(
				request, response);
	}

	@RequestMapping("/xiangxi")
	public void xiangxi(String oid, Model model, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<OrderxxVo> xiangxi = orderxxService.xiangxi(oid);
		request.setAttribute("rightPage", "orderDetail");
		request.setAttribute("xiangxi", xiangxi);
		request.getRequestDispatcher("/WEB-INF/jsp/user/userMain.jsp").forward(
				request, response);
	}*/

	
}
