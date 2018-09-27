package com.stars.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.stars.entity.ReplyThread;
import com.stars.entity.Thread;
import com.stars.entity.Thumb;
import com.stars.entity.User;
import com.stars.service.ReplyThreadService;
import com.stars.service.ThreadService;
import com.stars.service.ThumbService;
import com.stars.service.UserService;



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

	/**点击发帖后的编辑页面
	 * @param uid
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("after/editing")
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
	@RequestMapping("after/editing/post")
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
	
	@RequestMapping("after/reading")
	public String returnReading(Model model, @RequestParam("tid")int tid,@RequestParam("uid")int uid,HttpServletRequest request){
		System.out.println("ReturnReading uid"+uid);
		System.out.println("reading tid"+tid);
		HttpSession session = request.getSession();
		Thread thread = new Thread();
		User user = new User();
		thread = threadService.getById(tid);
		user = userService.getById(uid);
		List<ReplyThread> replyThreads = replyThreadService.getReplyThreadBytid(tid);
		List<User> users = userService.UserFromReplyThreadUid(tid);
		session.setAttribute("thread", thread);
		session.setAttribute("user", user);
		model.addAttribute("thread",thread);
		model.addAttribute("replyThreads",replyThreads);
		model.addAttribute("user",user);
		model.addAttribute("users",users);
		return "after/common/reading";
	}
	
	/**登录用户在个人中心查看自已的主题
	 * @param model
	 * @param request
	 * @return
	 * 2018-09-25 15:09:24
	 */
	@RequestMapping("after/privateReading")
	public String returnPrivateReading(Model model, HttpServletRequest request){
		
		return "after/common/privateReading";
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
	            //如果找到了这条记录，则删除该记录，同时文章的点赞数减1
	            Thumb thumb=thumbs.get(0);
	            //删除记录
	            thumbService.delete(thumb.getId());
	            //评论点赞数减1
	            ReplyThread replyThread=replyThreadService.getById(rid);
	            replyThread.setNum(replyThread.getNum()-1);
	            replyThreadService.updateReplyThread(replyThread);
	        }else {
	            //如果没有找到这条记录，则添加这条记录，同时文章点赞数加1
	            Thumb thumb=new Thumb();
	            thumb.setRid(rid);
	            thumb.setUid(uid);
	            //添加记录
	            thumbService.add(rid, uid);
	            //文章点赞数加1
	            ReplyThread replyThread=replyThreadService.getById(rid);
	            replyThread.setNum(replyThread.getNum()+1);
	            replyThreadService.updateReplyThread(replyThread);
	        }
	}
	
}
