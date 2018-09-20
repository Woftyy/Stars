package com.stars.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.stars.entity.Category;
import com.stars.entity.Forum;
import com.stars.entity.Thread;
import com.stars.entity.User;
import com.stars.service.ForumService;
import com.stars.service.ThreadService;
import com.stars.service.UserService;

@Controller
@RequestMapping("/")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private ThreadService threadService;
	@Autowired
	private ForumService forumService;
	/**
	 *  未登录的主页
	 * @param model
	 * @param request
	 * @return
	 */

	@RequestMapping("/")

	public String returnIndex(Model model ,HttpServletRequest request){
		if (request.getSession()!=null) {
			request.getSession().invalidate();
		}
		
	List<Thread> threads =threadService.list();
	List<Forum> forums = forumService.getforumByThreadFid();
	List<User> users =userService.getUserByThreadUid();
	 model.addAttribute("threads",threads);
	 model.addAttribute("forums",forums);
	 model.addAttribute("users",users);
		return "index";
	}
	/*
	 * 
	 * 登录
	 * 
	 */
	
	@RequestMapping("/login")
	public String returnLogin(){
		return "login";
	}
	
	/**
	 * 处理登陆
	 * @param name
	 * @param password
	 * @param request
	 * @return 
	 */
	@RequestMapping(value="/doLogin", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView doLogin(@RequestParam("name")String name,@RequestParam("password")String password,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		if (userService.checkLogin(name, password)) {
			User user =  new User();
			user= userService.getUserByName(name);
			List<Thread> threads =threadService.list();
			List<Forum> forums = forumService.getforumByThreadFid();
			List<User> users =userService.getUserByThreadUid();
			HttpSession session =request.getSession();
			session.setAttribute("uid", user.getId());
			mav.addObject("threads",threads);
			mav.addObject("forums",forums);
			mav.addObject("users",users);
			mav.setViewName("after/alreadyLogin");
		}else {
			mav.addObject("msg","用户名或密码错误");
			mav.setViewName("login");
		}
		return mav;
		
	}
	/*
	 * 注册
	 */
	@RequestMapping("/register")
	public String returnRegister(){
		return "register";
	}
	@RequestMapping(value="/register/checkName", method=RequestMethod.POST)
	@ResponseBody
	public String validate(@RequestParam("name")String name,HttpServletRequest request){
		System.out.println("访问了validate");
		if (userService.checkName(name)) {
			return "{\"msg\":\"true\"}";
		}else {
		}
		  return "{\"msg\":\"false\"}";
	}
	

	/**处理注册
	 * @param name
	 * @param password
	 * @param sex
	 * @param email
	 * @param request
	 * @return
	 */
	@RequestMapping("/register/do")
	@ResponseBody
	public ModelAndView DoRegister(@RequestParam("name")String name,@RequestParam("password")String password,
			@RequestParam("sex")String sex,@RequestParam("email")String email,HttpServletRequest request){
		ModelAndView modelAndView =new ModelAndView();
		if (userService.checkName(name)) {
			modelAndView.addObject("msg","用户名已存在，明明有提示还不信？？！!你以为会有bug??too young too naive!");
			modelAndView.setViewName("register");
		}else {
			userService.doRegister(name, password, sex, email);
			modelAndView.addObject("msg","注册成功！");
			modelAndView.setViewName("login");
		}
		
		return modelAndView;
	}
	/**登录后界面
	 * @param model
	 * @return
	 */
	@RequestMapping("/after")
	
	public String returnAlreadyLogin(Model model){
		
		List<Thread> threads =threadService.list();
		List<Forum> forums = forumService.getforumByThreadFid();
		List<User> users =userService.getUserByThreadUid();
		 model.addAttribute("threads",threads);
		 model.addAttribute("forums",forums);
		 model.addAttribute("users",users);
		return "/after/alreadyLogin";
	}
	
	/**
	 * 退出登录
	 * @param request
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(Model model,HttpServletRequest request){
		request.getSession().setAttribute("account", null);
			System.out.println("session为"+request.getSession()+"登出了");
			List<Thread> threads =threadService.list();
			List<Forum> forums = forumService.getforumByThreadFid();
			List<User> users =userService.getUserByThreadUid();
			 model.addAttribute("threads",threads);
			 model.addAttribute("forums",forums);
			 model.addAttribute("users",users);
			return "index";
		
	}
	
	
	/**返回个人中心
	 * @return
	 * 2018-09-20 15:12:27
	 */
	@RequestMapping("after/personalCenter")
	public String personalCenter() {
		
		return "after/common/personalCenter";
		
	}
	
}
