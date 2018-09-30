/**
 * 
 */
package com.stars.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stars.entity.ReplyThread;
import com.stars.entity.Thread;
import com.stars.entity.Thumb;
import com.stars.entity.User;
import com.stars.service.ReplyThreadService;
import com.stars.service.ThreadService;
import com.stars.service.ThumbService;
import com.stars.service.UserService;


@Controller
@RequestMapping("")
public class ReplyController {

	@Autowired
	private ReplyThreadService replyThreadService;
	@Autowired
	private UserService userService;
	@Autowired
	private ThreadService threadService;
	@Autowired
	private ThumbService thumbService;
	
	/**处理评论
	 * @param content
	 * @param tid
	 * @param model
	 * @param request
	 * @return
	 * 2018-09-26 09:52:59
	 */
	@RequestMapping("/after/reading/doReply")
	@ResponseBody
	public void doReply(@RequestParam("content")String content,@RequestParam("tid")int tid,Model model,HttpServletRequest request){
	  System.out.println("访问了doReply");
		int fromUid =(int)request.getSession().getAttribute("uid");
	  Thread thread = new Thread();
		User user = new User();
		threadService.addReplyNum(tid);
		thread = (Thread)request.getSession().getAttribute("thread");
		user = (User)request.getSession().getAttribute("user");
		List<ReplyThread> replyThreads = replyThreadService.getReviewList(tid);
		List<User> users = userService.UserFromReplyThreadUid(tid);
		model.addAttribute("thread",thread);
		model.addAttribute("user",user);
		model.addAttribute("replyThreads",replyThreads);
		model.addAttribute("users",users);
	  replyThreadService.add(fromUid,0,tid, content);
	}
	
	@RequestMapping("/after/reading/doReplyUser")
	@ResponseBody
	public void doReplyUser(@RequestParam("content")String content,@RequestParam("tid")int tid,@RequestParam("toUid")int toUid,Model model,HttpServletRequest request){
		  System.out.println("访问了doReplyUser");
			int fromUid =(int)request.getSession().getAttribute("uid");
		  Thread thread = new Thread();
			User user = new User();
			threadService.addReplyNum(tid);
			thread = (Thread)request.getSession().getAttribute("thread");
			user = (User)request.getSession().getAttribute("user");
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
			model.addAttribute("thread",thread);
			model.addAttribute("user",user);
			model.addAttribute("replyThreads",replyThreads);
			model.addAttribute("users",users);
			model.addAttribute("replyUsers",replyUsers);
			model.addAttribute("beRepliedUsers",beRepliedUsers);
			model.addAttribute("replyUserList",replyUserList);
		  replyThreadService.add(fromUid,toUid,tid, content);
		}
	
	
	/**删除评论
	 * @param rid
	 * @return
	 * 2018-09-29 11:36:47
	 */
	@RequestMapping("after/doDeleteReply")
	public String doDeleteReply(@RequestParam("rid")int rid) {
		System.out.println("访问了doDeleteReply");
		thumbService.deleteByrid(rid);
		replyThreadService.delete(rid);
		
	 return "after/center/personalCenter";
	}
	
}
