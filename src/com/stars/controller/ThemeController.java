package com.stars.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/after")
public class ThemeController {


	
	@RequestMapping("/post")
	public String returnLogin(){
		return "after/post/post";
	}
}
