package com.stars.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	

	/**点击发帖后的编辑页面
	 * @param uid
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/editing")
	public String returnEditing(@RequestParam("uid")String uid,Model model,HttpServletRequest request){
		System.out.println("ThreadController:"+uid);
	model.addAttribute("uid",uid);
		return "after/common/editing";
	}
	
	/**处理发布主题
	 * @param forum
	 * @param uid
	 * @param title
	 * @param content
	 * @param request
	 * @return
	 * 2018-09-21 14:19:11
	 */
	@RequestMapping("/editing/post")
	@ResponseBody
	public ModelAndView PostEditing(@RequestParam("forum")String forum,@RequestParam("uid")int uid,
			@RequestParam("title")String title,
			@RequestParam("content")String content,HttpServletRequest request){
		ModelAndView mav =new ModelAndView();
		threadService.add(forum, uid, title, content);
		System.out.println("发布成功");
		mav.addObject("uid",uid);
		Thread thread = threadService.getLatestThreadByUid(uid);
		User user = userService.getById(uid);
		mav.addObject("thread",thread);
		mav.addObject("user",user);
		mav.setViewName("after/common/reading");
		return mav;
	}
	
	@RequestMapping("/reading")
	public String returnReading(Model model, @RequestParam("tid")int tid,@RequestParam("uid")int uid,HttpServletRequest request){
		System.out.println("reading uid"+uid);
		System.out.println("reading tid"+tid);
		HttpSession session = request.getSession();
		Thread thread = new Thread();
		User user = new User();
		thread = threadService.getById(tid);
		user = userService.getById(uid);
		session.setAttribute("thread", thread);
		session.setAttribute("user", user);
		model.addAttribute("thread",thread);
		model.addAttribute("user",user);
		return "after/common/reading";
	}
	
	/**登录用户在个人中心查看自已的主题
	 * @param model
	 * @param request
	 * @return
	 * 2018-09-25 15:09:24
	 */
	@RequestMapping("/privateReading")
	public String returnPrivateReading(Model model, HttpServletRequest request){
		
		return "after/common/privateReading";
	}
}
