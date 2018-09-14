package com.stars.controller.view;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stars.entity.Category;

@Controller
@RequestMapping("/")
public class UserController {
	
	@RequestMapping("/")
	public String returnIndex(){
		return "index";
	}
	
	@RequestMapping("/login")
	public String returnLogin(){
		return "login";
	}
	@RequestMapping("/register")
	public String returnRegister(){
		return "register";
	}
}
