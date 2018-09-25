/**
 * 
 */
package com.stars.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.stars.entity.Thread;
import com.stars.entity.User;
import com.stars.service.ReplyThreadService;


@Controller
@RequestMapping("")
public class ReplyController {

	@Autowired
	private ReplyThreadService replyThreadService;
	@RequestMapping("/after/reading/doReply")
	public String doReply(@RequestParam("content")String content,@RequestParam("tid")int tid,Model model,HttpServletRequest request){
	  int uid =(int)request.getSession().getAttribute("uid");
	  Thread thread = new Thread();
		User user = new User();
		thread = (Thread)request.getSession().getAttribute("thread");
		user = (User)request.getSession().getAttribute("user");
		model.addAttribute("thread",thread);
		model.addAttribute("user",user);
	  replyThreadService.add(uid, tid, content);
	  return "after/common/reading";
	}
}
