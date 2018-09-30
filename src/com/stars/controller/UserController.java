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

import com.stars.entity.Forum;
import com.stars.entity.ReplyThread;
import com.stars.entity.Thread;
import com.stars.entity.User;
import com.stars.service.ForumService;
import com.stars.service.ReplyThreadService;
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
	@Autowired
	private ReplyThreadService replyThreadService;
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
			System.out.println("DoLogin--uid"+user.getId());
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
	/**判断名字是否重复
	 * @param name
	 * @param request
	 * @return
	 * 2018-09-29 14:39:30
	 */
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
	
	public String returnAlreadyLogin(Model model, HttpServletRequest request){
		
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
	public String personalCenter(Model model, HttpServletRequest request) {
		int uid = (int)request.getSession().getAttribute("uid");
		List<Thread> threads = threadService.getPostByUid(uid);
		User user = userService.getById(uid);
		model.addAttribute("threads",threads);
		model.addAttribute("user",user);
		return "after/center/personalCenter";
		
	}
	
	/**个人中心发布
	 * @return
	 * 2018-09-25 14:09:03
	 */
	@RequestMapping("after/center/posts")
	public String personalCenterPost(Model model, HttpServletRequest request) {
		int uid = (int)request.getSession().getAttribute("uid");
		List<Thread> threads = threadService.getPostByUid(uid);
		User user = userService.getById(uid);
		model.addAttribute("threads",threads);
		model.addAttribute("user",user);
		return "after/center/posts";
		
	}
	/**个人中心评论
	 * @return
	 * 2018-09-25 14:09:03
	 */
	@RequestMapping("after/center/comments")
	public String personalCenterComment(Model model, HttpServletRequest request) {
		int fromUid = (int) request.getSession().getAttribute("uid");
		List<ReplyThread> replyfromUidLists = replyThreadService.getReplyThreadByfromUid(fromUid);
		List<Thread> whereFromThreads = new ArrayList<Thread>();
		User user= userService.getById(fromUid);
		for (int i=0 ; i<replyfromUidLists.size();i++) {
			whereFromThreads.add(threadService.getById(replyfromUidLists.get(i).getTid()));
		}
		
		model.addAttribute("replyfromUidLists",replyfromUidLists);
		model.addAttribute("whereFromThreads",whereFromThreads);
		model.addAttribute("user",user);
		return "after/center/comments";
		
	}
	/**个人中心收藏
	 * @return
	 * 2018-09-25 14:09:03
	 */
	@RequestMapping("after/center/collections")
	public String personalCenterColection(Model model, HttpServletRequest request) {
		
		return "after/center/collections";
		
	}
	
	/**编辑个人资料
	 * @param model
	 * @param request
	 * @return
	 * 2018-09-29 14:53:08
	 */
	@RequestMapping("after/editProfile")
public String editProfile(Model model, HttpServletRequest request) {
		
		
		return "after/center/editProfile";
		
	}
	
	@RequestMapping( "up_tx")
    public void uploadFile(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("访问了");
		   String savePath = request.getSession().getServletContext()
	                .getRealPath("");
	        //保存文件的路径
	        savePath = savePath + "/upload/";
	        File f1 = new File(savePath);
	        System.out.println(savePath);
	        //如果文件不存在,就新建一个
	        if (!f1.exists()) {
	            f1.mkdirs();
	        }
	        //这个是文件上传需要的类,具体去百度看看,现在只管使用就好
	        DiskFileItemFactory fac = new DiskFileItemFactory();
	        ServletFileUpload upload = new ServletFileUpload(fac);
	        upload.setHeaderEncoding("utf-8");
	        List fileList = null;
	        try {
	            fileList = upload.parseRequest(request);
	        } catch (FileUploadException ex) {
	        }
	        //迭代器,搜索前端发送过来的文件
	        Iterator<FileItem> it = fileList.iterator();
	        String name = "";
	        String extName = "";
	        while (it.hasNext()) {
	            FileItem item = it.next();
	            //判断该表单项是否是普通类型
	            if (!item.isFormField()) {
	                name = item.getName();
	                long size = item.getSize();
	                String type = item.getContentType();
	                System.out.println(size + " " + type);
	                if (name == null || name.trim().equals("")) {
	                    continue;
	                }
	                // 扩展名格式： extName就是文件的后缀,例如 .txt
	                if (name.lastIndexOf(".") >= 0) {
	                    extName = name.substring(name.lastIndexOf("."));
	                }
	                File file = null;
	                do {
	                    // 生成文件名：
	                    name = UUID.randomUUID().toString();
	                    file = new File(savePath + name + extName);
	                } while (file.exists());
	                File saveFile = new File(savePath + name + extName);
	                try {
	                    item.write(saveFile);
	                } catch (Exception e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	        try {
				response.getWriter().print(name + extName);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
}
    
}
