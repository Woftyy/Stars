package com.stars.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/after")
public class ThemeController {


	
	@RequestMapping("/editing")
	public String returnEditing(){
		return "after/common/editing";
	}
	@RequestMapping("/reading")
	public String returnReading(){
		return "after/common/reading";
	}
}
