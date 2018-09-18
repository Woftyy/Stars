package com.stars.service;

import com.stars.entity.User;

public interface UserService {

	//注册
	public void doRegister(String name,String password,String sex, String email);
	//检验用户名是否重复
	public boolean checkName(String name);
	//登录判断
	public boolean checkLogin(String name, String password);
	//通过姓名获取User
	public User getUserByName(String name); 
}
