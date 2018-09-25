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
@RequestMapping("")
public class ForumController {
	@Autowired
	private UserService userService;
	@Autowired
	private ThreadService threadService;
	@Autowired
	private ForumService forumService;
	@Autowired
	private ReplyThreadService replyThreadService;
	
		@RequestMapping("/view/science")
		public String Science(Model model){
			Forum forum =forumService.getById(1);
			List<Thread> threads =threadService.getListByfid(1);
			List<User> users =userService.getUserByThreadUid();
			List<ReplyThread> replyThreads = new ArrayList<ReplyThread>(); 
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forum",forum);
			return "view/science/science";
		}
		
		/**最热主题
		 * @param model
		 * @return
		 * 2018-09-25 09:30:41
		 */
		@RequestMapping("/view/science_hot")
		public String ScienceHot(Model model){
			List<Thread> threads =threadService.getMostViewsByfid(1);
			List<User> users =userService.getUserByThreadUid();
			List<Forum> forums = forumService.getforumByThreadFid();
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			return "view/science/science_hot";
		}
		
		/**最多评论
		 * @param model
		 * @return
		 * 2018-09-25 11:27:28
		 */
		@RequestMapping("/view/science_reply")
		public String ScienceReply(Model model){
			List<Thread> threads =threadService.getMostReplyNumByfid(1);
			List<User> users =userService.getUserByThreadUid();
			List<Forum> forums = forumService.getforumByThreadFid();
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			
			return "view/science/science_reply";
		}
		
		@RequestMapping("/view/science_theme")
		public String ScienceTheme(Model model){
			
			List<Thread> threads =threadService.getListByfid(1);
			List<User> users =userService.getUserByThreadUid();
			List<Forum> forums = forumService.getforumByThreadFid();
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			return "view/science/science_theme";
		}
		
		@RequestMapping("/after/science")
		public String AfterScience(Model model){
			Forum forum =forumService.getById(1);
			List<Thread> threads =threadService.getListByfid(1);
			List<User> users =userService.getUserByThreadUid();
			List<ReplyThread> replyThreads = new ArrayList<ReplyThread>(); 
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forum",forum);
			return "after/science/science";
		}
		
		
		@RequestMapping("/after/science_theme")
		public String AfterScienceTheme(Model model){
			
			List<Thread> threads =threadService.getListByfid(1);
			List<User> users =userService.getUserByThreadUid();
			List<Forum> forums = forumService.getforumByThreadFid();
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			return "after/science/science_theme";
		}
		
		@RequestMapping("/after/science_reply")
		public String AfterScienceReply(Model model){
			List<Thread> threads =threadService.getMostReplyNumByfid(1);
			List<User> users =userService.getUserByThreadUid();
			List<Forum> forums = forumService.getforumByThreadFid();
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			
			return "after/science/science_reply";
		}
		
		@RequestMapping("/after/science_hot")
		public String AfterScienceHot(Model model){
			List<Thread> threads =threadService.getMostViewsByfid(1);
			List<User> users =userService.getUserByThreadUid();
			List<Forum> forums = forumService.getforumByThreadFid();
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			return "after/science/science_hot";
		}
}
