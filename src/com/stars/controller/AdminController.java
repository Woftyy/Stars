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
import com.stars.entity.ReplyThread;
import com.stars.entity.Thread;
import com.stars.entity.Thumb;
import com.stars.entity.User;
import com.stars.service.AdminService;
import com.stars.service.ForumService;
import com.stars.service.ReplyThreadService;
import com.stars.service.ThreadService;
import com.stars.service.ThumbService;
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
	@Autowired
	private ReplyThreadService replyThreadService;
	@Autowired
	private ThumbService thumbService;
	
		@RequestMapping("/admin")
		public String adminLogin(Model model){
		
			return "admin/adminLogin";
	
}
		@RequestMapping("/admin/main")
		public String adminMain(Model model, HttpServletRequest request){
			
			List<Forum> forums = new ArrayList<Forum>();
			List<Thread> threads = threadService.list();
			List<User> users = userService.list();
	Admin admin = adminService.getAdminById(String.valueOf(request.getSession().getAttribute("name")));
	List<Admin> admins = adminService.list();
				model.addAttribute("admin",admin);
				model.addAttribute("admins",admins);
			model.addAttribute("users", users);
			model.addAttribute("threads",threads);
			
			return "admin/main";
	
}
		@RequestMapping("/admin/reading")
		public String adminReading(Model model,@RequestParam("uid")int uid,@RequestParam("tid")int tid ){
			
	       Thread thread = threadService.getById(tid);
	       User user = userService.getById(uid);
	       model.addAttribute("thread",thread);
	       model.addAttribute("user",user);
			return "admin/reading";
	
}
		@RequestMapping(value = "/adminDoLogin", method = RequestMethod.POST)
		@ResponseBody
		public ModelAndView adminDoLogin(@RequestParam("name") String name, @RequestParam("password") String password,
				HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			if (adminService.checkLogin(name, password)) {
				 Admin	admin = adminService.getAdminById(name);
				 HttpSession session = request.getSession();
				 session.setAttribute("name", name);
				List<Forum> forums = new ArrayList<Forum>();
				List<Thread> threads = threadService.list();
				List<User> users = userService.list();
				mav.addObject("admin", admin);	
				mav.addObject("threads", threads);
				mav.addObject("forums", forums);
				mav.addObject("users", users);
				mav.setViewName("redirect:admin/main");
			} else {
				mav.addObject("msg", "用户名或密码错误");
				mav.setViewName("admin/adminLogin");
			}
			return mav;

		}
		@RequestMapping("admin/AdminDeleteThread")
		public String AdminDeleteThread(Model model,@RequestParam("tid")int tid,HttpServletRequest request) {
			List<ReplyThread> replyThreads = replyThreadService.getReplyThreadBytid(tid);
			 for(int i=0;i< replyThreads.size();i++) {
				thumbService.deleteByrid(replyThreads.get(i).getId()); 
			 }
			replyThreadService.deleteBytid(tid);
			threadService.delete(tid);
			List<Thread> threads = threadService.list();
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = userService.list();
		
			Admin admin = adminService.getAdminById(String.valueOf(request.getSession().getAttribute("name")));
			model.addAttribute("admin",admin);
			model.addAttribute("users", users);
			model.addAttribute("threads",threads);
			
			return "/admin/afterDelete";
		}
		/** 删除主题后跳转界面
		 * @param model
		 * @return
		 * 2018-10-11 14:36:16
		 */
		@RequestMapping("/admin/afterDelete")
		public String adminReading(Model model ){
			List<Forum> forums = new ArrayList<Forum>();
			List<Thread> threads = threadService.list();
			List<User> users = userService.list();
		
			model.addAttribute("threads", threads);
		 model.addAttribute("forums", forums);
		model.addAttribute("users", users);
			return "redirect:/admin/main";
	
}
		/**删除用户
		 * @param model
		 * @param uid
		 * @return
		 * 2018-10-11 15:57:21
		 */
		@RequestMapping("/admin/deleteUser")
		public String deleteUser(Model model, @RequestParam("uid")int uid,HttpServletRequest request) {
             thumbService.deleteByUid(uid);			
             replyThreadService.deleteByUid(uid);
             threadService.deleteByUid(uid);
             userService.delete(uid);
         	List<Thread> threads = threadService.list();
			List<User> users = userService.list();
	Admin admin = adminService.getAdminById(String.valueOf(request.getSession().getAttribute("name")));
	List<Admin> admins = adminService.list();
				model.addAttribute("admin",admin);
				model.addAttribute("admins",admins);
			model.addAttribute("users", users);
			model.addAttribute("threads",threads);
			return "admin/main";
			
		}
		/** 添加管理员
		 * @param model
		 * @param id
		 * @param password
		 * @return
		 * 2018-10-11 17:35:53
		 */
		@RequestMapping("/admin/addAdmin")
		public String addAdmin(Model model, @RequestParam("id")String id, @RequestParam("password")String password) {
             Admin admin = new Admin();
             
             admin.setId(id);
           admin.setPassword(password);
             adminService.add(admin);
			
			return "redirect:/admin/main";
			
		}
		
		@RequestMapping("/admin/deleteAdmin")
		public String deleteAdmin(Model model, @RequestParam("id")String id) {
			
			adminService.delete(id);
			
			return "redirect:/admin/main";
		}
		
		
}
		
		
