package com.stars.service;

import java.util.List;

import com.stars.entity.User;

public interface UserService {

	//注册
	public void doRegister(String name,String password,String sex, String email);
	//检验用户名是否重复
	public boolean checkName(String name);
	//登录判断
	public boolean checkLogin(String name, String password);
	//获取全部用户
	public List<User> list();
	//通过姓名获取User
	public User getUserByName(String name); 
	//通过thread uid 获取 User
	public List<User> getUserByThreadUid();
	//通过id 获取User
	public User getById(int id);
	//获取对应主题的所有评论的用户
	public List<User> UserFromReplyThreadUid(int tid);
	//获取对应主题的评论主题用户
	public List<User> UserFromReviewsfromUid(int tid);
	//获取对应主题的回复用户的用户
	public List<User> UserFromReplyfromUid(int tid);
	//获取对应主题被回复的用户
	public List<User> UserFromReplytoUid(int tid);
	//修改资料
    public void updateProfile(User user);
	
}
