package com.stars.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.stars.entity.Thread;
import com.stars.entity.User;
import com.stars.service.ThreadService;
import com.stars.service.UserService;



@Controller
@RequestMapping("/after")
public class ThreadController {

	@Autowired
	private ThreadService threadService;
	@Autowired
	private UserService userService;
	
//点击发帖后的编辑页面	
	@RequestMapping("/editing")
	public String returnEditing(@RequestParam("uid")String uid,Model model,HttpServletRequest request){
		System.out.println("ThreadController:"+uid);
	model.addAttribute("uid",uid);
		return "after/common/editing";
	}
	
	@RequestMapping("/editing/post")
	@ResponseBody
	public ModelAndView PostEditing(@RequestParam("forum")String forum,@RequestParam("uid")int uid,
			@RequestParam("title")String title,
			@RequestParam("content")String content,HttpServletRequest request){
		ModelAndView mav =new ModelAndView();
		threadService.add(forum, uid, title, content);
		System.out.println("发布成功");
		mav.addObject("uid",uid);
		mav.addObject("success","发布成功");
		mav.setViewName("after/alreadyLogin");
		return mav;
	}
	
	@RequestMapping("/reading")
	public String returnReading(Model model, @RequestParam("tid")int tid,@RequestParam("uid")int uid,HttpServletRequest request){
		System.out.println("reading uid"+uid);
		System.out.println("reading tid"+tid);
		Thread thread = new Thread();
		User user = new User();
		thread = threadService.getById(tid);
		user = userService.getById(uid);
		model.addAttribute("thread",thread);
		model.addAttribute("user",user);
		return "after/common/reading";
	}
	
	
}
