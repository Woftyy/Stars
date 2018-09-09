package com.stars.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stars.entity.Category;
import com.stars.service.CategoryService;



@Controller
@RequestMapping("")
public class CategoryController {
	@Autowired
	CategoryService categoryService;

	@RequestMapping("test1")
	public ModelAndView listCategory(){
		ModelAndView mav = new ModelAndView();
		List<Category> cs= categoryService.list();
		System.out.println("请求的是test1 跳转到首页了");
		mav.addObject("cs", cs);
		//跳转到指定页�?
		mav.setViewName("index");
		return mav;
	}

}
