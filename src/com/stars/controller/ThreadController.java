package com.stars.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.stars.constant.Constants;
import com.stars.entity.AdPictureURL;
import com.stars.entity.Forum;
import com.stars.entity.ImgInfo;
import com.stars.entity.ReplyThread;
import com.stars.entity.Thread;
import com.stars.entity.Thumb;
import com.stars.entity.User;
import com.stars.service.ForumService;
import com.stars.service.ReplyThreadService;
import com.stars.service.ThreadService;
import com.stars.service.ThumbService;
import com.stars.service.UserService;
import com.stars.utils.CopyFiles;
import com.stars.utils.WordFilter;



@Controller
@RequestMapping("/")
public class ThreadController {

	@Autowired
	private ThreadService threadService;
	@Autowired
	private UserService userService;
	@Autowired
	private ReplyThreadService replyThreadService;
	@Autowired
	private ThumbService thumbService;
	@Autowired
	private ForumService forumService;

	/**点击发帖后的编辑页面
	 * @param uid
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("after/editing")
	public String returnEditing(@RequestParam("uid")int uid,Model model,HttpServletRequest request){
		System.out.println("ThreadController:"+uid);
		 User user = (User)userService.getById(uid);
		 model.addAttribute("user",user);
	model.addAttribute("uid",uid);
		return "after/common/editing";
	}
	/**进入编辑页面
	 * @param uid
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value ="after/privateEditing",method = RequestMethod.GET)
	public String returnPrivateEditing(@RequestParam("uid")String uid,@RequestParam("tid")int tid,Model model,HttpServletRequest request){
		System.out.println("ThreadController:"+uid);
	Thread thread = threadService.getById(tid);
	model.addAttribute("uid",uid);
	model.addAttribute("thread",thread);
		return "after/common/privateEditing";
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
	@RequestMapping("after/editing/post")
	public String PostEditing(Model model,@RequestParam("forum")String forum,@RequestParam("uid")int uid,
			@RequestParam("title")String title,
			@RequestParam("content")String content,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		//敏感词过滤
		String afterTitle=WordFilter.doFilter(title);
		String afterContent = WordFilter.doFilter(content);
		threadService.add(forum, uid, afterTitle, afterContent);
		HttpSession session = request.getSession();
		System.out.println("发布成功");
		model.addAttribute("uid",uid);
		Thread thread = threadService.getLatestThreadByUid(uid);
		User user = userService.getById(uid);
		int tid = thread.getId();
		//评论列表
		List<ReplyThread> replyThreads = replyThreadService.getReviewList(tid);
		//回复用户的列表
		List<ReplyThread> replyUserList = replyThreadService.getReplyList(tid);
		//评论主题的用户
		List<User> users = userService.UserFromReviewsfromUid(tid);
		//回复用户的用户
		List<User> replyUsers = userService.UserFromReplyfromUid(tid);
		//被回复的用户
		List<User> beRepliedUsers = userService.UserFromReplytoUid(tid);
		
		
		session.setAttribute("thread", thread);
		session.setAttribute("user", user);
	/*	mav.setViewName("after/common/reading?tid="+tid+"&uid="+uid);
		mav.addObject("thread",thread);
		mav.addObject("replyThreads",replyThreads);
		mav.addObject("replyUserList",replyUserList);
		mav.addObject("user",user);
		mav.addObject("users",users);
		mav.addObject("replyUsers",replyUsers);
		mav.addObject("beRepliedUsers",beRepliedUsers);*/
		
		model.addAttribute("thread",thread);
		model.addAttribute("replyThreads",replyThreads);
		model.addAttribute("replyUserList",replyUserList);
		model.addAttribute("user",user);
		model.addAttribute("users",users);
		model.addAttribute("replyUsers",replyUsers);
		model.addAttribute("beRepliedUsers",beRepliedUsers);

		
		return "redirect: ../reading?tid="+tid;
	}
	
	/** 处理 私人编辑的发布
	 * @param model
	 * @param forum
	 * @param uid
	 * @param tid
	 * @param title
	 * @param content
	 * @param request
	 * @return
	 * 2018-10-09 09:10:37
	 */
	@RequestMapping("after/privateEditing/post")
	public String PostPrivateEditing(Model model,@RequestParam("forum")String forum,@RequestParam("uid")int uid,@RequestParam("tid")int tid,
			@RequestParam("title")String title,
			@RequestParam("content")String content,HttpServletRequest request){
		ModelAndView mav =new ModelAndView();
		//敏感词过滤
		String afterTitle=WordFilter.doFilter(title);
		String afterContent = WordFilter.doFilter(content);
		threadService.update(tid, forum, uid, afterTitle, afterContent);
		HttpSession session = request.getSession();
		System.out.println("发布成功");
		model.addAttribute("uid",uid);
		Thread thread = threadService.getLatestThreadByUid(uid);
		User user = userService.getById(uid);
		System.out.println("发布成功");
		//评论列表
		List<ReplyThread> replyThreads = replyThreadService.getReviewList(tid);
		//回复用户的列表
		List<ReplyThread> replyUserList = replyThreadService.getReplyList(tid);
		//评论主题的用户
		List<User> users = userService.UserFromReviewsfromUid(tid);
		//回复用户的用户
		List<User> replyUsers = userService.UserFromReplyfromUid(tid);
		//被回复的用户
		List<User> beRepliedUsers = userService.UserFromReplytoUid(tid);
		
		session.setAttribute("thread", thread);
		session.setAttribute("user", user);
		model.addAttribute("thread",thread);
		model.addAttribute("replyThreads",replyThreads);
		model.addAttribute("replyUserList",replyUserList);
		model.addAttribute("user",user);
		model.addAttribute("users",users);
		model.addAttribute("replyUsers",replyUsers);
		model.addAttribute("beRepliedUsers",beRepliedUsers);
		return "after/common/PrivateReading";
	}

	/**  看别人发布的主题
	 * @param model
	 * @param tid
	 * @param uid
	 * @param request
	 * @return
	 * 2018-10-09 09:13:02
	 */
	@RequestMapping("after/reading")
	public String returnReading(Model model, @RequestParam("tid")int tid,@RequestParam("uid")int uid,HttpServletRequest request){
		System.out.println("ReturnReading uid"+uid);
		System.out.println("reading tid"+tid);
		HttpSession session = request.getSession();
		Thread thread = new Thread();
		User user = new User();
		thread = threadService.getById(tid);
		user = userService.getById(uid);
		Forum forum = forumService.getById(thread.getFid());
		//评论列表
		List<ReplyThread> replyThreads = replyThreadService.getReviewList(tid);
		//回复用户的列表
		List<ReplyThread> replyUserList = replyThreadService.getReplyList(tid);
		//评论主题的用户
		List<User> users = userService.UserFromReviewsfromUid(tid);
		//回复用户的用户
		List<User> replyUsers = userService.UserFromReplyfromUid(tid);
		//被回复的用户
		List<User> beRepliedUsers = userService.UserFromReplytoUid(tid);
		//主题访问数加1
		thread.setViews(thread.getViews()+1); 
		threadService.updateThread(thread);
	    //总访问数加1
		forum.setViews(forum.getViews()+1);
		forumService.update(forum);
		session.setAttribute("thread", thread);
		session.setAttribute("user", user);
		model.addAttribute("thread",thread);
		model.addAttribute("replyThreads",replyThreads);
		model.addAttribute("replyUserList",replyUserList);
		model.addAttribute("user",user);
		model.addAttribute("users",users);
		model.addAttribute("replyUsers",replyUsers);
		model.addAttribute("beRepliedUsers",beRepliedUsers);
		return "after/common/reading";
	}
	
	/** 查看自已的主题
	 * @param model
	 * @param request
	 * @return
	 * 2018-09-25 15:09:24
	 */
	@RequestMapping("after/privateReading")
	public String returnPrivateReading(Model model, @RequestParam("tid")int tid,@RequestParam("uid")int uid, HttpServletRequest request){
		
		System.out.println("returnPrivateReading uid"+uid);
		System.out.println("returnPrivateReading tid"+tid);
		HttpSession session = request.getSession();
		Thread thread = new Thread();
		User user = new User();
		thread = threadService.getById(tid);
		user = userService.getById(uid);
		//评论列表
		List<ReplyThread> replyThreads = replyThreadService.getReviewList(tid);
		//回复用户的列表
		List<ReplyThread> replyUserList = replyThreadService.getReplyList(tid);
		//评论主题的用户
		List<User> users = userService.UserFromReviewsfromUid(tid);
		//回复用户的用户
		List<User> replyUsers = userService.UserFromReplyfromUid(tid);
		//被回复的用户
		List<User> beRepliedUsers = userService.UserFromReplytoUid(tid);
		
		session.setAttribute("thread", thread);
		session.setAttribute("user", user);
		model.addAttribute("thread",thread);
		model.addAttribute("replyThreads",replyThreads);
		model.addAttribute("replyUserList",replyUserList);
		model.addAttribute("user",user);
		model.addAttribute("users",users);
		model.addAttribute("replyUsers",replyUsers);
		model.addAttribute("beRepliedUsers",beRepliedUsers);
		return "after/common/PrivateReading";
	}
	/**处理点赞
	 * @param model
	 * @param tid
	 * @param uid
	 * @param request
	 * 2018-09-26 16:23:40
	 */
	@RequestMapping("after/doThumb")
	@ResponseBody
	public void DoThumb(Model model, @RequestParam("rid")int rid,@RequestParam("uid")int uid,HttpServletRequest request){
      System.out.println("访问了doThumb");
      System.out.println("rid:"+rid+"uid:"+uid);
		   List<Thumb> thumbs=thumbService.findByRidAndUid(uid,rid);
	        if (thumbs!=null && thumbs.size()>0){
	            //如果找到了这条记录，则删除该记录，同时回复的点赞数减1
	            Thumb thumb=thumbs.get(0);
	            //删除记录
	            thumbService.delete(thumb.getId());
	            //评论点赞数减1
	            ReplyThread replyThread=replyThreadService.getById(rid);
	            replyThread.setNum(replyThread.getNum()-1);
	            replyThreadService.updateReplyThread(replyThread);
	        }else {
	            //如果没有找到这条记录，则添加这条记录，同时回复点赞数加1
	            Thumb thumb=new Thumb();
	            thumb.setRid(rid);
	            thumb.setUid(uid);
	            //添加记录
	            thumbService.add(rid, uid);
	            //评论点赞数加1
	            ReplyThread replyThread=replyThreadService.getById(rid);
	            replyThread.setNum(replyThread.getNum()+1);
	            replyThreadService.updateReplyThread(replyThread);
	        }
	}
	/**删除主题
	 * @param tid
	 * @return
	 * 2018-09-29 11:32:16
	 */
	@RequestMapping("after/doDeleteThread")
	public String doDeleteThread(Model model,@RequestParam("tid")int tid,HttpServletRequest request) {
		List<ReplyThread> replyThreads = replyThreadService.getReplyThreadBytid(tid);
		 for(int i=0;i< replyThreads.size();i++) {
			thumbService.deleteByrid(replyThreads.get(i).getId()); 
		 }
		 //删除评论
		replyThreadService.deleteBytid(tid);
		//减总查看数
		Thread thread =threadService.getById(tid);
            Forum forum = forumService.getById(thread.getFid());
            forum.setViews(forum.getViews()-thread.getViews());
            forumService.update(forum);
            //删除主题
		threadService.delete(tid);
		int uid = (int) request.getSession().getAttribute("uid");
		List<Thread> threads = threadService.getPostByUid(uid);
		User user = userService.getById(uid);
		model.addAttribute("threads", threads);
		model.addAttribute("user", user);
	 return "after/center/personalCenter";
	}
	
	
	/** 上传图片
	 * @param list
	 * @return
	 * 2018-10-15 14:21:54
	 */
	@RequestMapping("after/editing/upLoadImg")
	@ResponseBody
	public AdPictureURL  UpLoadImg(@RequestParam("imgFiles")List<MultipartFile> list,HttpServletRequest request) {
	        int errno = 0;
	        List<String> urls = new ArrayList<>();
	        AdPictureURL returnAd= new AdPictureURL();
	        Map<String, Object> map = new HashMap<>();
	        List<String> adList = new ArrayList<>();
	    	String fileName = UUID.randomUUID().toString();
	        
	      //公司本机地址
			String path1 = Constants.IMGURL + File.separator; 
			//服务器地址
			String path2 = request.getServletContext().getRealPath("images/picture")+ File.separator;  
			//个人电脑地址
//			String path = "D:\\carlos\\eclipse-workplace\\Stars\\WebContent\\images" + File.separator + uuid;    
	        if (list.size()==0) {
	        	errno =1 ;
			}
	        //将img保存进数据库
	        ImgInfo img = new ImgInfo();
	       for(MultipartFile file: list) {
	    	   String realName ="";
	    	   if (file!=null) {
			
				 File newFile = new File(path2+ File.separator+fileName);
		try {
			file.transferTo(newFile);
			String databaseUrl= Constants.DATABASEURL+fileName;
			CopyFiles copy = new CopyFiles(path2+ File.separator +fileName, path1);
			urls.add(databaseUrl);
		} catch (Exception e) {
			// TODO: handle exception
			errno = 1;
			e.printStackTrace();
		}
	    	   }
	       }
	       returnAd.setData(urls);
	       returnAd.setErrno(errno);
	      return returnAd;
	}
	
	
	
}
