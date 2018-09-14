package com.stars.controller.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/view")
public class ForumController {
	//返回science.jsp
		@RequestMapping("/science")
		public String Science(){
			return "view/science/science";
		}
		@RequestMapping("/science_hot")
		public String ScienceHot(){
			return "view/science/science_hot";
		}
		@RequestMapping("/science_reply")
		public String ScienceReply(){
			return "view/science/science_reply";
		}
		@RequestMapping("/science_theme")
		public String ScienceTheme(){
			return "view/science/science_theme";
		}
		
}
