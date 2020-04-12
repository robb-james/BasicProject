package com.irs.UserController;

import java.io.ByteArrayOutputStream;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aliyuncs.http.HttpRequest;

import com.irs.bean.BigClass;
import com.irs.bean.Classify;
import com.irs.bean.TbCollection;
import com.irs.bean.Product;
import com.irs.bean.Slide;
import com.irs.bean.TbUsers;
import com.irs.controller.base.BaseController;
import com.irs.service.BigClassService;
import com.irs.service.ClassifyService;
import com.irs.service.MailService;
import com.irs.service.ProductService;
import com.irs.service.SlideService;
import com.irs.service.TbCollectionService;
import com.irs.service.UserService;
import com.irs.util.ResultModel;
import com.irs.util.SendCodeMessage;
import com.irs.util.VerifyCode;

/**
 * 前台所有的信息接口类
 * 
 * @author robb
 *
 */
@Controller
@RequestMapping("main")
public class UserController extends BaseController {
	@Autowired
	private BigClassService bigservice;
	@Autowired
	private ClassifyService smallservice;
	@Autowired
	private ProductService productservice;
	@Autowired
	private SlideService slideservice;
	@Autowired
	private UserService service;
	@Autowired
	private MailService mailservice;
	@Autowired
	private TbCollectionService collectionservice;

	@RequestMapping("/login")
	public String login() {
		return "page/UserSide/login";
	}

	/**
	 * 进入前台首页
	 * 
	 * @return
	 */
	@RequestMapping("/index")
	public ModelAndView index(Product bean) {
		ModelAndView model = new ModelAndView("page/UserSide/main");
		List<BigClass> biglist = bigservice.findall(0, 200);// 所有大分类
		List<Classify> smallllist = smallservice.findall(0, 200);// 小分类
		List<Product> productlist = productservice.list(bean, 0, 20);// 部分商品
		List<Slide> list = slideservice.list();// 所有轮播图
		model.addObject("sel_big", biglist);
		model.addObject("sel_fen", smallllist);
		model.addObject("sel_prod", productlist);
		model.addObject("sel_hd", list);
		return model;
	}

	/**
	 * 邮箱发送验证码
	 * 
	 * @param email
	 * @return
	 */
	@RequestMapping("getCheckCode")
	@ResponseBody
	public String getCheckCode(String email) {
		String checkCode = String.valueOf(new Random().nextInt(899999) + 100000);
		String message = "您的注册验证码为：" + checkCode;
		try {
			mailservice.sendSimpleMail(email, "注册验证码", message);
		} catch (Exception e) {
			return e.getLocalizedMessage();
		}
		return checkCode;
	}

	/**
	 * 获取手机短信验证码
	 * 
	 * @param request
	 * @param response
	 * @param phone
	 *            手机号
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("/sendcodeNub")
	public ResultModel sendNub(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "phone", required = true) String phone) throws Exception {
		Integer nub = (int) ((Math.random() * 9 + 1) * 100000);
		System.out.println("验证码---" + nub);
		// 添加 发送验证码 接口
		SendCodeMessage.sendSms(phone, nub.toString());
		request.getSession().setAttribute("verify", nub);
		request.getSession().setAttribute("phone", phone);
		return success(nub);
	}

	/**
	 * 检测手机号是否存在
	 * 
	 * @param phone
	 * @return
	 */
	@RequestMapping("/checkphone")
	@ResponseBody
	public ResultModel getinfo(String phone) {
		ResultModel model = new ResultModel();
		TbUsers user = service.getphone(phone);
		if (user == null) {
			model.setCode(400);
		} else {
			model.setCode(200);
		}
		return model;
	}

	/**
	 * 检测用户昵称是否存在
	 * 
	 * @param phone
	 * @return
	 */
	@RequestMapping("/checkname")
	@ResponseBody
	public ResultModel getnickname(String nickname) {
		ResultModel model = new ResultModel();
		TbUsers user = service.getphone(nickname);
		if (user == null) {
			model.setCode(400);
		} else {
			model.setCode(200);
		}
		return model;
	}

	/**
	 * 用户端 注册接口
	 * 
	 * @param nickname
	 * @param phone
	 * @param password
	 * @param type
	 * @return
	 */
	@RequestMapping("/register")
	@ResponseBody
	public ResultModel insert(String nickname, String phone, String password, String type) {
		ResultModel model = new ResultModel();
		TbUsers user = new TbUsers();
		user.setNickname(nickname);
		user.setPassword(password);
		user.setPhone(phone);
		user.setType(Integer.parseInt(type));
		if (type.equals("1")) {
			user.setRoleid(61);// 商家角色
		} else {
			user.setRoleid(62);// 普通用户角色
		}
		int rel = 0;
		try {
			rel = service.insUserService(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (rel > 0) {
			model.setCode(200);
			model.setMsg("注册成功");
		} else {
			model.setCode(500);
			model.setMsg("注册失败");
		}
		return model;

	}

	/**
	 * 获取验证码
	 * 
	 * @param response
	 * @param session
	 * @throws Exception
	 */
	@RequestMapping("/verify")
	public void verify(HttpServletResponse response, HttpSession session) throws Exception {
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		String verifyCodeValue = VerifyCode.drawImg(output);
		session.setAttribute("verifyCodeValue", verifyCodeValue);
		System.out.println("生成的验证码===》" + verifyCodeValue);
		ServletOutputStream out = response.getOutputStream();
		output.writeTo(out);
	}

	/**
	 * 前台用户登录
	 * 
	 * @param request
	 * @param phone
	 * @param password
	 * @param code
	 * @return
	 */
	@RequestMapping("/userlogin")
	@ResponseBody
	public ResultModel login(HttpServletRequest request, String phone, String password, String code) {
		ResultModel model = new ResultModel();
		HttpSession session = request.getSession();
		String ver = session.getAttribute("verifyCodeValue").toString();
		String ss = code.toUpperCase();
		if (!ver.equals(ss)) {
			model.setCode(500);
			model.setMsg("您输入的验证码不正确");
		} else {

			TbUsers user = service.getinfo(phone, DigestUtils.md5DigestAsHex(password.getBytes()));
			if (user == null) {
				model.setCode(400);
				model.setMsg("手机号或密码错误");
			} else {

				session.setAttribute("user_session", user);
				model.setCode(200);
				model.setMsg("登录成功");
			}

		}
		return model;
	}

	// 注销登录
	@RequestMapping("/exit.html")
	public String exit(HttpSession session) {
		System.out.println("===注销登录===");
		session.invalidate();// 清空session中储存的用户信息
		return "redirect:index";
	}

	/**
	 * 获取商品详情
	 * 
	 * @param pid
	 *            商品编号
	 * @return
	 */
	@RequestMapping("detail.html")
	public ModelAndView productdetail(String pid) {
		ModelAndView model = new ModelAndView();
		List<BigClass> biglist = bigservice.findall(0, 200);// 所有大分类
		List<Classify> smallllist = smallservice.findall(0, 200);// 小分类
		Product p = productservice.getinfo(Integer.parseInt(pid));
		model.addObject("sel_big", biglist);
		model.addObject("sel_fen", smallllist);
		model.addObject("product", p);
		model.setViewName("page/UserSide/sp_detail");
		return model;
	}

	/**
	 * 根据用户获取用户的收藏
	 * 
	 * @param uid
	 * @return
	 */
	@RequestMapping("/collectionlist")
	public ModelAndView list(Integer uid) {
		ModelAndView model = new ModelAndView();
		if (!uid.equals("") && uid != null) {
			List<TbCollection> list = collectionservice.list(uid);
			model.addObject("collectList", list);
		}
		model.setViewName("page/UserSide/jsps/userMain/collect");
		return model;
	}

	/**
	 * 添加收藏
	 * 
	 * @param bean
	 * @return
	 */
	@RequestMapping("addcollection")
	@ResponseBody
	public ResultModel insert(TbCollection bean) {
		ResultModel model = new ResultModel();
		bean.setCreatetime(new Date());
		int rel = collectionservice.insert(bean);
		if (rel > 0) {
			model.setCode(200);
			model.setMsg("收藏成功");
		} else {
			model.setCode(500);
			model.setMsg("收藏失败");
		}
		return model;
	}

	/**
	 * 根据编号删除收藏信息
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/deleteCollection")
	@ResponseBody
	public ResultModel delete(Integer id) {
		ResultModel model = new ResultModel();
		int rel = collectionservice.delete(id);
		if (rel > 0) {
			model.setCode(200);
			model.setMsg("删除成功");
		} else {
			model.setCode(500);
			model.setMsg("删除失败");
		}
		return model;
	}
    /**
     * 前端用户的个人中心的信息
     * @param model
     * @param uid
     * @param nickname
     * @return
     */
	@RequestMapping("/usercenter.html")
	public ModelAndView getuserinfo(ModelAndView model,String uid, String nickname) {
		if (uid != null && nickname != null) {
			TbUsers user = service.selUserByNickname(nickname, Long.parseLong(uid));
			model.addObject("userBean", user);
			model.setViewName("page/UserSide/jsps/userMain/userData");
		}
		return model;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
