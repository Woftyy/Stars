package com.stars.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.stars.entity.Category;
import com.stars.entity.User;
import com.stars.service.UserService;

@Controller
@RequestMapping("/")
public class UserController {
	@Autowired
	private UserService userService;
	@RequestMapping("/")
	public String returnIndex(){
		return "index";
	}
	
	@RequestMapping("/login")
	public String returnLogin(){
		return "login";
	}
	@RequestMapping("/register")
	public String returnRegister(){
		return "register";
	}
	@RequestMapping(value="/validate", method=RequestMethod.GET)
	public ModelAndView validate(@RequestParam("name")String name,HttpServletRequest request){
		System.out.println("访问了validate");
		ModelAndView mav= new ModelAndView();
		if (userService.checkName(name)) {
			mav.addObject("msg", "该用户名存在");
			System.out.println("重定向1");
			mav.setViewName("register"); 
		}else {
			mav.addObject("msg", "用户名不存在");
			System.out.println("重定向2");
			mav.setViewName("register"); 
		}
		  
		  return mav;
	}
   //处理注册
	@RequestMapping("/register/do")
	@ResponseBody
	public String DoRegister(@RequestParam("name")String name,@RequestParam("password")String password,
			@RequestParam("sex")String sex,@RequestParam("email")String email,HttpServletRequest request){
		userService.doRegister(name, password, sex, email);
		return "login";
	}
	@RequestMapping("/after")
	public String returnAlreadyLogin(){
		return "/after/alreadyLogin";
	}
}
