package com.stars.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.stars.entity.Admin;
import com.stars.entity.Forum;
import com.stars.entity.Thread;
import com.stars.entity.User;
import com.stars.service.AdminService;
import com.stars.service.ForumService;
import com.stars.service.ThreadService;
import com.stars.service.UserService;


@Controller
@RequestMapping("")
public class AdminController {

	
	@Autowired
	private AdminService adminService;
	@Autowired
	private ThreadService threadService;
	@Autowired
	private UserService userService;
	@Autowired
	private ForumService forumService;
	
		@RequestMapping("/admin")
		public String adminLogin(Model model){
			return "admin/adminLogin";
	
}
		
		@RequestMapping(value = "/adminDoLogin", method = RequestMethod.POST)
		@ResponseBody
		public ModelAndView doLogin(@RequestParam("name") String name, @RequestParam("password") String password,
				HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			if (adminService.checkLogin(name, password)) {
				 Admin	admin = adminService.getAdminById(name);
				List<Forum> forums = new ArrayList<Forum>();
				List<Thread> threads = threadService.list();
				List<User> users = userService.list();
				
				mav.addObject("threads", threads);
				mav.addObject("forums", forums);
				mav.addObject("users", users);
				mav.setViewName("admin/main");
			} else {
				mav.addObject("msg", "用户名或密码错误");
				mav.setViewName("admin/adminLogin");
			}
			return mav;

		}
	
}
		
		
