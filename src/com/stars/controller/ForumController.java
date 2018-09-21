package com.stars.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stars.entity.Forum;
import com.stars.entity.ReplyThread;
import com.stars.entity.Thread;
import com.stars.entity.User;
import com.stars.mapper.ForumMapper;
import com.stars.service.ForumService;
import com.stars.service.ReplyThreadService;
import com.stars.service.ThreadService;
import com.stars.service.UserService;

@Controller
@RequestMapping("/view")
public class ForumController {
	@Autowired
	private UserService userService;
	@Autowired
	private ThreadService threadService;
	@Autowired
	private ForumService forumService;
	@Autowired
	private ReplyThreadService replyThreadService;
	
		@RequestMapping("/science")
		public String Science(Model model){
			Forum forum =forumService.getById(1);
			List<Thread> threads =threadService.getListByfid(1);
			List<User> users =userService.getUserByThreadUid();
			List<ReplyThread> replyThreads = new ArrayList<ReplyThread>(); 
			for(int i=0; i< threads.size();i++) {
				Thread thread = threads.get(i);
				replyThreads = replyThreadService.getReplyThreadBytid(thread.getId());
			}
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forum",forum);
			return "view/science/science";
		}
		@RequestMapping("/science_hot")
		public String ScienceHot(Model model){
			List<Thread> threads =threadService.getMostViewsByfid(1);
			List<User> users =userService.getUserByThreadUid();
			List<Forum> forums = forumService.getforumByThreadFid();
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			return "view/science/science_hot";
		}
		@RequestMapping("/science_reply")
		public String ScienceReply(Model model){
			return "view/science/science_reply";
		}
		@RequestMapping("/science_theme")
		public String ScienceTheme(Model model){
			
			List<Thread> threads =threadService.getListByfid(1);
			List<User> users =userService.getUserByThreadUid();
			List<Forum> forums = forumService.getforumByThreadFid();
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			return "view/science/science_theme";
		}
		
}
