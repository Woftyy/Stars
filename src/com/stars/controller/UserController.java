 package com.stars.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.spel.ast.FunctionReference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.stars.constant.Constants;
import com.stars.entity.Forum;
import com.stars.entity.ReplyThread;
import com.stars.entity.Thread;
import com.stars.entity.User;
import com.stars.service.ForumService;
import com.stars.service.ReplyThreadService;
import com.stars.service.ThreadService;
import com.stars.service.UserService;
import com.stars.utils.CopyFiles;
import com.sun.net.httpserver.Authenticator.Result;

@Controller
@RequestMapping("/")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private ThreadService threadService;
	@Autowired
	private ForumService forumService;
	@Autowired
	private ReplyThreadService replyThreadService;

	/**
	 * 未登录的主页
	 * 
	 * @param model
	 * @param request
	 * @return
	 */

	@RequestMapping("/")

	public String returnIndex(Model model, HttpServletRequest request) {
		if (request.getSession() != null) {
			request.getSession().invalidate();
		}

		List<Forum> forums = new ArrayList<Forum>();
		List<Thread> threads = threadService.list();
		List<User> users = new ArrayList<User>();
		for(int i=0;i<threads.size();i++) {
		forums.add(forumService.getById(threads.get(i).getFid()));
		users.add(userService.getById(threads.get(i).getUid()));
		}
		model.addAttribute("threads", threads);
		model.addAttribute("forums", forums);
		model.addAttribute("users", users);
		return "index";
	}
	/*
	 * 
	 * 登录
	 * 
	 */

	@RequestMapping("/login")
	public String returnLogin() {
		return "login";
	}

	/**
	 * 处理登陆
	 * 
	 * @param name
	 * @param password
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/doLogin", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView doLogin(@RequestParam("name") String name, @RequestParam("password") String password,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if (userService.checkLogin(name, password)) {
			User user = new User();
			user = userService.getUserByName(name);
			List<Forum> forums = new ArrayList<Forum>();
			List<Thread> threads = threadService.list();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			HttpSession session = request.getSession();
			session.setAttribute("uid", user.getId());
			session.setAttribute("user", user);
			System.out.println("DoLogin--uid" + user.getId());
			mav.addObject ("user", user);
			mav.addObject("threads", threads);
			mav.addObject("forums", forums);
			mav.addObject("users", users);
			mav.setViewName("after/alreadyLogin");
		} else {
			mav.addObject("msg", "用户名或密码错误");
			mav.setViewName("login");
		}
		return mav;

	}

	/*
	 * 注册
	 */
	@RequestMapping("/register")
	public String returnRegister() {
		return "register";
	}

	/**
	 * 判断名字是否重复
	 * 
	 * @param name
	 * @param request
	 * @return 2018-09-29 14:39:30
	 */
	@RequestMapping(value = "/register/checkName", method = RequestMethod.POST)
	@ResponseBody
	public String validate(@RequestParam("name") String name, HttpServletRequest request) {
		System.out.println("访问了validate");
		if (userService.checkName(name)) {
			return "{\"msg\":\"true\"}";
		} else {
		}
		return "{\"msg\":\"false\"}";
	}

	/**
	 * 处理注册
	 * 
	 * @param name
	 * @param password
	 * @param sex
	 * @param email
	 * @param request
	 * @return
	 */
	@RequestMapping("/register/do")
	@ResponseBody
	public ModelAndView DoRegister(@RequestParam("name") String name, @RequestParam("password") String password,
			@RequestParam("sex") String sex, @RequestParam("email") String email, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		if (userService.checkName(name)) {
			modelAndView.addObject("msg", "用户名已存在，明明有提示还不信？？！!你以为会有bug??too young too naive!");
			modelAndView.setViewName("register");
		} else {
			userService.doRegister(name, password, sex, email);
			modelAndView.addObject("msg", "注册成功！");
			modelAndView.setViewName("login");
		}

		return modelAndView;
	}

	/**
	 * 登录后界面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/after")

	public String returnAlreadyLogin(Model model, HttpServletRequest request) {
        int id = (int) request.getSession().getAttribute("uid");
    	List<Forum> forums = new ArrayList<Forum>();
		List<Thread> threads = threadService.list();
		List<User> users = new ArrayList<User>();
		for(int i=0;i<threads.size();i++) {
		forums.add(forumService.getById(threads.get(i).getFid()));
		users.add(userService.getById(threads.get(i).getUid()));
		}
		User user = userService.getById(id);
		model.addAttribute("user", user);
		model.addAttribute("threads", threads);
		model.addAttribute("forums", forums);
		model.addAttribute("users", users);
		return "/after/alreadyLogin";
	}

	/**
	 * 退出登录
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(Model model, HttpServletRequest request) {
		request.getSession().setAttribute("account", null);
		System.out.println("session为" + request.getSession() + "登出了");
		List<Forum> forums = new ArrayList<Forum>();
		List<Thread> threads = threadService.list();
		List<User> users = new ArrayList<User>();
		for(int i=0;i<threads.size();i++) {
		forums.add(forumService.getById(threads.get(i).getFid()));
		users.add(userService.getById(threads.get(i).getUid()));
		}
		model.addAttribute("threads", threads);
		model.addAttribute("forums", forums);
		model.addAttribute("users", users);
		return "index";

	}

	/**
	 * 返回个人中心
	 * 
	 * @return 2018-09-20 15:12:27
	 */
	@RequestMapping("after/personalCenter")
	public String personalCenter(Model model, HttpServletRequest request) {
		int uid = (int) request.getSession().getAttribute("uid");
		List<Thread> threads = threadService.getPostByUid(uid);
		User user = userService.getById(uid);
		model.addAttribute("threads", threads);
		model.addAttribute("user", user);
		return "after/center/personalCenter";

	}
	
	/**
	 * 个人中心发布
	 * 
	 * @return 2018-09-25 14:09:03
	 */
	@RequestMapping("after/center/posts")
	public String personalCenterPost(Model model, HttpServletRequest request) {
		int uid = (int) request.getSession().getAttribute("uid");
		List<Thread> threads = threadService.getPostByUid(uid);
		User user = userService.getById(uid);
		model.addAttribute("threads", threads);
		model.addAttribute("user", user);
		return "after/center/posts";

	}

	/**
	 * 个人中心评论
	 * 
	 * @return 2018-09-25 14:09:03
	 */
	@RequestMapping("after/center/comments")
	public String personalCenterComment(Model model, HttpServletRequest request) {
		int fromUid = (int) request.getSession().getAttribute("uid");
		List<ReplyThread> replyfromUidLists = replyThreadService.getReplyThreadByfromUid(fromUid);
		List<Thread> whereFromThreads = new ArrayList<Thread>();
		User user = userService.getById(fromUid);
		for (int i = 0; i < replyfromUidLists.size(); i++) {
			whereFromThreads.add(threadService.getById(replyfromUidLists.get(i).getTid()));
		}

		model.addAttribute("replyfromUidLists", replyfromUidLists);
		model.addAttribute("whereFromThreads", whereFromThreads);
		model.addAttribute("user", user);
		return "after/center/comments";

	}

	/**
	 * 个人中心收藏
	 * 
	 * @return 2018-09-25 14:09:03
	 */
	@RequestMapping("after/center/collections")
	public String personalCenterColection(Model model, HttpServletRequest request) {

		return "after/center/collections";

	}
	/** 查看其它用户个人中心
	 * @param model
	 * @param otherUid
	 * @param request
	 * @return
	 * 2018-10-09 09:55:14
	 */
	@RequestMapping("after/othersCenter")
	public String othersCenter(Model model,@RequestParam ("otherUid") int otherUid, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int uid = (int) session.getAttribute("uid");
		session.setAttribute("otherUid", otherUid);
		List<Thread> threads = threadService.getPostByUid(otherUid);
		User user = userService.getById(otherUid);
		User LoginUser =userService.getById(uid);
		model.addAttribute("threads", threads);
		model.addAttribute("user", user);
		model.addAttribute("LoginUser", LoginUser);
		return "after/others/othersCenter";
	}
	/**其它用户发布
	 * @param model
	 * @param request
	 * @return
	 * 2018-10-09 09:58:56
	 */
	@RequestMapping("after/others/posts")
	public String othersCenterPost(Model model, HttpServletRequest request) {
		int otherUid = (int) request.getSession().getAttribute("otherUid");
		List<Thread> threads = threadService.getPostByUid(otherUid);
		User user = userService.getById(otherUid);
		model.addAttribute("threads", threads);
		model.addAttribute("user", user);
		return "after/others/posts";

	}
	
	/** 其它用户评论
	 * @param model
	 * @param request
	 * @return
	 * 2018-10-09 10:05:03
	 */
	@RequestMapping("after/others/comments")
	public String othersCenterComment(Model model, HttpServletRequest request) {
		int otherUid = (int) request.getSession().getAttribute("otherUid");
		List<ReplyThread> replyfromUidLists = replyThreadService.getReplyThreadByfromUid(otherUid);
		List<Thread> whereFromThreads = new ArrayList<Thread>();
		User user = userService.getById(otherUid);
		for (int i = 0; i < replyfromUidLists.size(); i++) {
			whereFromThreads.add(threadService.getById(replyfromUidLists.get(i).getTid()));
		}

		model.addAttribute("replyfromUidLists", replyfromUidLists);
		model.addAttribute("whereFromThreads", whereFromThreads);
		model.addAttribute("user", user);
		return "after/others/comments";

	}

	/**
	 * 编辑个人资料
	 * 
	 * @param model
	 * @param request
	 * @return 2018-09-29 14:53:08
	 */
	@RequestMapping("after/editProfile")
	public String editProfile(Model model, HttpServletRequest request) {
		int uid = (int) request.getSession().getAttribute("uid");
		User user = userService.getById(uid);
		model.addAttribute("user",user);
		return "after/center/editProfile";

	}

	@RequestMapping( value="/changeProfile", method=RequestMethod.POST)
	  public String upload(HttpServletRequest request,  Model model, @RequestParam("nickname") String nickname,@RequestParam("sex") String sex, @RequestParam("email") String email,         
			  @RequestParam("file") MultipartFile file) throws Exception {    	    	
		//如果文件不为空，写入上传路径       
		int uid = (int) request.getSession().getAttribute("uid");
		User user =userService.getById(uid);
		if(!file.isEmpty()) 
		{    	   long uuid = (long) (Math.random()*10000000);  
		//上传文件路径    	
		//公司本机地址
		String path1 = Constants.UPLOADURL + File.separator + user.getName(); 
		//服务器地址
		String path2 = request.getServletContext().getRealPath("images")+ File.separator +  user.getName();  
		//个人电脑地址
//		String path = "D:\\carlos\\eclipse-workplace\\Stars\\WebContent\\images" + File.separator + uuid;    
		//上传文件名           
		String filename = file.getOriginalFilename();          
		File filepath1 = new File(path1,filename);    
		File filepath2 = new File(path2,filename); 
		//判断路径是否存在，如果不存在就创建一个           
		if (!filepath1.getParentFile().exists()&&!filepath2.getParentFile().exists()) {               
			filepath1.getParentFile().mkdirs();      
			filepath2.getParentFile().mkdirs();
		}        
		//将上传文件保存到一个目标文件当中       
		String src = File.separator + user.getName()+"/"+filename;
		file.transferTo(new File(path2 + File.separator +filename)); 
		CopyFiles copy = new CopyFiles(path2+ File.separator +filename, path1);
		System.out.println("上传成功到path1" +path1);
		System.out.println("上传成功到path2" +path2);
		model.addAttribute("user",user);
		user.setEmail(email);
		user.setNickname(nickname);
		user.setSex(sex);
		user.setSrc(src);
		userService.updateProfile(user);
		return "after/center/editProfile";
		} else {    
			user.setEmail(email);
			user.setNickname(nickname);
			user.setSex(sex);
			userService.updateProfile(user);
			model.addAttribute("user",user);
     return "after/center/editProfile";
		}
		}


    
}
