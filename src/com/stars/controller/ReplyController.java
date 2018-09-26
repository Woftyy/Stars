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
import com.stars.entity.User;
import com.stars.service.ReplyThreadService;
import com.stars.service.UserService;


@Controller
@RequestMapping("")
public class ReplyController {

	@Autowired
	private ReplyThreadService replyThreadService;
	@Autowired
	private UserService userService;
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
		int uid =(int)request.getSession().getAttribute("uid");
	  Thread thread = new Thread();
		User user = new User();
		thread = (Thread)request.getSession().getAttribute("thread");
		user = (User)request.getSession().getAttribute("user");
		List<ReplyThread> replyThreads = replyThreadService.getReplyThreadBytid(tid);
		List<User> users = userService.UserFromReplyThreadUid(tid);
		model.addAttribute("thread",thread);
		model.addAttribute("user",user);
		model.addAttribute("replyThreads",users);
		model.addAttribute("users",users);
	  replyThreadService.add(uid, tid, content);
	}
}
