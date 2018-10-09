package com.stars.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
		@RequestMapping("/view/science")
		public String Science(Model model){
			Forum forum =forumService.getById(1);
			List<Thread> threads =threadService.getListByfid(1);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
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
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
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
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			
			return "view/science/science_reply";
		}
		
		@RequestMapping("/view/science_theme")
		public String ScienceTheme(Model model){
			
			List<Thread> threads =threadService.getListByfid(1);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			return "view/science/science_theme";
		}
		
		@RequestMapping("/view/photograph")
		public String Photograph(Model model){
			Forum forum =forumService.getById(2);
			List<Thread> threads =threadService.getListByfid(2);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forum",forum);
			return "view/photograph/photograph";
		}
		
		/**最热主题
		 * @param model
		 * @return
		 * 2018-09-25 09:30:41
		 */
		@RequestMapping("/view/photograph_hot")
		public String PhotographHot(Model model){
			List<Thread> threads =threadService.getMostViewsByfid(2);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			return "view/photograph/photograph_hot";
		}
		
		/**最多评论
		 * @param model
		 * @return
		 * 2018-09-25 11:27:28
		 */
		@RequestMapping("/view/photograph_reply")
		public String PhotographReply(Model model){
			List<Thread> threads =threadService.getMostReplyNumByfid(2);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			
			return "view/photograph/photograph_reply";
		}
		
		@RequestMapping("/view/photograph_theme")
		public String PhotographTheme(Model model){
			
			List<Thread> threads =threadService.getListByfid(2);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			return "view/photograph/photograph_theme";
		}
		
		
		@RequestMapping("/view/movie")
		public String Movie(Model model){
			Forum forum =forumService.getById(3);
			List<Thread> threads =threadService.getListByfid(3);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forum",forum);
			return "view/movie/movie";
		}
		
		/**最热主题
		 * @param model
		 * @return
		 * 2018-09-25 09:30:41
		 */
		@RequestMapping("/view/movie_hot")
		public String MovieHot(Model model){
			List<Thread> threads =threadService.getMostViewsByfid(3);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			return "view/movie/movie_hot";
		}
		
		/**最多评论
		 * @param model
		 * @return
		 * 2018-09-25 11:27:28
		 */
		@RequestMapping("/view/movie_reply")
		public String MovieReply(Model model){
			List<Thread> threads =threadService.getMostReplyNumByfid(3);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			
			return "view/movie/movie_reply";
		}
		
		@RequestMapping("/view/movie_theme")
		public String MovieTheme(Model model){
			
			List<Thread> threads =threadService.getListByfid(3);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			return "view/movie/movie_theme";
		}
		@RequestMapping("/after/science")
		public String AfterScience(Model model,HttpServletRequest request){
			Forum forum =forumService.getById(1);
			List<Thread> threads =threadService.getListByfid(1);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			int uid = (int) request.getSession().getAttribute("uid");
			User user = userService.getById(uid);
			 model.addAttribute("user",user);
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forum",forum);
			return "after/science/science";
		}
		
		
		@RequestMapping("/after/science_theme")
		public String AfterScienceTheme(Model model){
			
			List<Thread> threads =threadService.getListByfid(1);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			return "after/science/science_theme";
		}
		
		@RequestMapping("/after/science_reply")
		public String AfterScienceReply(Model model){
			List<Thread> threads =threadService.getMostReplyNumByfid(1);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			
			return "after/science/science_reply";
		}
		
		@RequestMapping("/after/science_hot")
		public String AfterScienceHot(Model model){
			List<Thread> threads =threadService.getMostViewsByfid(1);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			return "after/science/science_hot";
		}
		
		@RequestMapping("/after/photograph")
		public String AfterPhotograph(Model model,HttpServletRequest request){
			Forum forum =forumService.getById(2);
			List<Thread> threads =threadService.getListByfid(2);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			int uid = (int) request.getSession().getAttribute("uid");
			User user = userService.getById(uid);
			 model.addAttribute("user",user);
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forum",forum);
			return "after/photograph/photograph";
		}
		
		
		@RequestMapping("/after/photograph_theme")
		public String AfterPhotographTheme(Model model){
			
			List<Thread> threads =threadService.getListByfid(2);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			return "after/photograph/photograph_theme";
		}
		
		@RequestMapping("/after/photograph_reply")
		public String AfterPhotographReply(Model model){
			List<Thread> threads =threadService.getMostReplyNumByfid(2);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			
			return "after/photograph/photograph_reply";
		}
		
		@RequestMapping("/after/photograph_hot")
		public String AfterPhotographHot(Model model){
			List<Thread> threads =threadService.getMostViewsByfid(2);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			return "after/photograph/photograph_hot";
		}
		
		@RequestMapping("/after/movie")
		public String AfterMovie(Model model,HttpServletRequest request){
			Forum forum =forumService.getById(3);
			List<Thread> threads =threadService.getListByfid(3);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			int uid = (int) request.getSession().getAttribute("uid");
			User user = userService.getById(uid);
			 model.addAttribute("user",user);
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forum",forum);
			return "after/movie/movie";
		}
		
		
		@RequestMapping("/after/movie_theme")
		public String AfterMovieTheme(Model model){
			
			List<Thread> threads =threadService.getListByfid(3);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			return "after/movie/movie_theme";
		}
		
		@RequestMapping("/after/movie_reply")
		public String AfterMovieReply(Model model){
			List<Thread> threads =threadService.getMostReplyNumByfid(3);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			
			return "after/movie/movie_reply";
		}
		
		@RequestMapping("/after/movie_hot")
		public String AfterMovieHot(Model model){
			List<Thread> threads =threadService.getMostViewsByfid(3);
			List<Forum> forums = new ArrayList<Forum>();
			List<User> users = new ArrayList<User>();
			for(int i=0;i<threads.size();i++) {
			forums.add(forumService.getById(threads.get(i).getFid()));
			users.add(userService.getById(threads.get(i).getUid()));
			}
			 model.addAttribute("threads",threads);
			 model.addAttribute("users",users);
			 model.addAttribute("forums",forums);
			return "after/movie/movie_hot";
		}
}
