/**
 * 
 */
package com.stars.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stars.entity.Forum;
import com.stars.entity.Thread;
import com.stars.entity.User;
import com.stars.service.ForumService;
import com.stars.service.ThreadService;
import com.stars.service.UserService;

/**
 * @author Administrator
 *
 */

@Controller
@RequestMapping("")
public class SearchController {
      @Autowired
      private ThreadService threadService;
      @Autowired 
      private UserService userService;
	  @Autowired
	  private ForumService forumService;
	@RequestMapping("after/search")
	public String ReturnSearchResult(@RequestParam("content")String content,Model model,HttpServletRequest request) {
		
		List<Thread> threads = threadService.searchThroughTitleAndContent("%"+content+"%");
		List<User> users  = new ArrayList<User>();
		List<Forum> forums  = new ArrayList<Forum>();
		User user = userService.getById((int)request.getSession().getAttribute("uid"));
		for(int i=0; i<threads.size(); i++) {
			users.add(userService.getById(threads.get(i).getUid()));
			forums.add(forumService.getById(threads.get(i).getFid()));
		}
		model.addAttribute("user",user);
		 model.addAttribute("threads",threads);
		 model.addAttribute("users",users);
		 model.addAttribute("forums",forums);
		return "after/common/searchResult";
	}
}
